-- ═══════════════════════════════════════════════════════════════════
-- Rankings automáticos por trigger.
-- Al pasar un TRIED o un AI_TRIED a 'FINISHED' se recalculan y persisten
-- los puntajes del estudiante en TODOS los rankings activos.
--
-- Reglas de pertenencia de un intento a un ranking:
--   • Ranking GENERAL (sin filas en rankings_competences): cuentan TODOS los intentos.
--   • Ranking POR COMPETENCIAS {C}: solo cuentan los intentos cuyas competencias estén
--     TODAS dentro de {C} (subconjunto). Es decir, un test/sesión "exclusivo" de esas
--     competencias. Un test con cualquier competencia fuera de {C} NO suma.
--   En ambos casos se suma el PUNTAJE COMPLETO del intento (no por competencia).
--   • source_filter limita a ALL | TRIEDS | AI_TRIEDS.
--   • Solo TRIEDS en modo EXAM/TIMED cuentan. period_type define la ventana.
-- ═══════════════════════════════════════════════════════════════════

DROP TRIGGER IF EXISTS trg_update_ranking_on_tried    ON razonapro.trieds;
DROP TRIGGER IF EXISTS trg_update_ranking_on_ai_tried ON razonapro.ai_trieds;
DROP FUNCTION IF EXISTS razonapro.fn_update_ranking_on_tried();
DROP FUNCTION IF EXISTS razonapro.fn_update_ranking_on_ai_tried();
DROP FUNCTION IF EXISTS razonapro.fn_refresh_student_ranking(VARCHAR, VARCHAR, TIMESTAMP);
DROP FUNCTION IF EXISTS razonapro.fn_refresh_student_ranking(VARCHAR, VARCHAR);

CREATE FUNCTION razonapro.fn_refresh_student_ranking(
    p_student_id  VARCHAR,
    p_program_id  VARCHAR,
    p_finished_at TIMESTAMP
) RETURNS VOID AS $fn_refresh_student_ranking$
DECLARE
    v_ranking   RECORD;
    v_ps        DATE;
    v_pe        DATE;
    v_start     TIMESTAMP;
    v_end       TIMESTAMP;
    v_ts        NUMERIC(7,2);
    v_tc        INTEGER;
    v_as        NUMERIC(7,2);
    v_ac        INTEGER;
    v_has_comps BOOLEAN;
    v_when      TIMESTAMP;
    v_existing  INTEGER;
BEGIN
    v_when := COALESCE(p_finished_at, CURRENT_TIMESTAMP);

    FOR v_ranking IN SELECT * FROM razonapro.rankings WHERE is_active = 'Y' LOOP

        CASE v_ranking.period_type
            WHEN 'DAILY' THEN
                v_ps := v_when::DATE; v_pe := v_when::DATE;
            WHEN 'WEEKLY' THEN
                v_ps := DATE_TRUNC('week',  v_when)::DATE;
                v_pe := (DATE_TRUNC('week',  v_when) + INTERVAL '6 days')::DATE;
            WHEN 'MONTHLY' THEN
                v_ps := DATE_TRUNC('month', v_when)::DATE;
                v_pe := (DATE_TRUNC('month', v_when) + INTERVAL '1 month' - INTERVAL '1 day')::DATE;
            ELSE
                v_ps := NULL; v_pe := NULL;   -- GENERAL
        END CASE;
        v_start := CASE WHEN v_ps IS NULL THEN NULL ELSE v_ps::TIMESTAMP END;
        v_end   := CASE WHEN v_pe IS NULL THEN NULL ELSE (v_pe + INTERVAL '1 day' - INTERVAL '1 second') END;

        v_has_comps := EXISTS (
            SELECT 1 FROM razonapro.rankings_competences rc WHERE rc.ranking_id = v_ranking.ranking_id);

        -- ── TRIEDS (puntaje completo del intento) ───────────────────
        v_ts := 0; v_tc := 0;
        IF v_ranking.source_filter IN ('ALL','TRIEDS') THEN
            SELECT COALESCE(SUM(t.score), 0), COUNT(*)
            INTO v_ts, v_tc
            FROM razonapro.trieds t
            JOIN razonapro.tests  te ON te.test_id = t.test_id
            WHERE t.student_id = p_student_id AND t.program_id = p_program_id
              AND t.status = 'FINISHED' AND t.score IS NOT NULL
              AND te.test_mode IN ('EXAM','TIMED')
              AND (v_start IS NULL OR COALESCE(t.finished_at, t.attempt_timestamp) >= v_start)
              AND (v_end   IS NULL OR COALESCE(t.finished_at, t.attempt_timestamp) <= v_end)
              -- Filtro por competencias: el test debe ser EXCLUSIVO del conjunto del ranking.
              AND (NOT v_has_comps OR (
                    EXISTS (SELECT 1 FROM razonapro.tests_questions tq
                             WHERE tq.test_id = t.test_id AND tq.is_active = 'Y')
                AND NOT EXISTS (SELECT 1 FROM razonapro.tests_questions tq
                                 WHERE tq.test_id = t.test_id AND tq.is_active = 'Y'
                                   AND tq.competence_id NOT IN (
                                       SELECT rc.competence_id FROM razonapro.rankings_competences rc
                                        WHERE rc.ranking_id = v_ranking.ranking_id))
              ));
        END IF;

        -- ── AI (puntaje completo de la sesión) ──────────────────────
        v_as := 0; v_ac := 0;
        IF v_ranking.source_filter IN ('ALL','AI_TRIEDS') THEN
            SELECT COALESCE(SUM(a.score), 0), COUNT(*)
            INTO v_as, v_ac
            FROM razonapro.ai_trieds a
            WHERE a.student_id = p_student_id AND a.program_id = p_program_id
              AND a.status = 'FINISHED' AND a.score IS NOT NULL
              AND (v_start IS NULL OR COALESCE(a.finished_at, a.attempt_timestamp) >= v_start)
              AND (v_end   IS NULL OR COALESCE(a.finished_at, a.attempt_timestamp) <= v_end)
              -- Filtro por competencias: la sesión debe ser EXCLUSIVA del conjunto del ranking.
              AND (NOT v_has_comps OR (
                    EXISTS (SELECT 1 FROM razonapro.ai_questions aq
                             WHERE aq.ai_tried_id = a.ai_tried_id AND aq.program_id = a.program_id
                               AND aq.student_id = a.student_id)
                AND NOT EXISTS (SELECT 1 FROM razonapro.ai_questions aq
                                 WHERE aq.ai_tried_id = a.ai_tried_id AND aq.program_id = a.program_id
                                   AND aq.student_id = a.student_id
                                   AND (aq.competence_id IS NULL OR aq.competence_id NOT IN (
                                       SELECT rc.competence_id FROM razonapro.rankings_competences rc
                                        WHERE rc.ranking_id = v_ranking.ranking_id)))
              ));
        END IF;

        -- ── Upsert de la fila del estudiante en este ranking/período ─
        SELECT ranking_student_id INTO v_existing
        FROM razonapro.rankings_students
        WHERE ranking_id = v_ranking.ranking_id
          AND student_id = p_student_id
          AND program_id = p_program_id
          AND period_start IS NOT DISTINCT FROM v_ps
          AND period_end   IS NOT DISTINCT FROM v_pe;

        IF FOUND THEN
            UPDATE razonapro.rankings_students
               SET trieds_score     = v_ts,
                   trieds_count     = v_tc,
                   ai_trieds_score  = v_as,
                   ai_trieds_count  = v_ac,
                   total_score      = v_ts + v_as,
                   last_activity_at = CURRENT_TIMESTAMP
             WHERE ranking_student_id = v_existing;
        ELSE
            INSERT INTO razonapro.rankings_students (
                program_id, student_id, ranking_id,
                period_start, period_end,
                total_score, trieds_score, ai_trieds_score,
                trieds_count, ai_trieds_count, last_activity_at
            ) VALUES (
                p_program_id, p_student_id, v_ranking.ranking_id,
                v_ps, v_pe,
                v_ts + v_as, v_ts, v_as,
                v_tc, v_ac, CURRENT_TIMESTAMP
            );
        END IF;
    END LOOP;
END;
$fn_refresh_student_ranking$ LANGUAGE plpgsql;

-- ── Triggers de disparo ─────────────────────────────────────────────
CREATE FUNCTION razonapro.fn_update_ranking_on_tried()
RETURNS TRIGGER AS $trg_update_ranking_on_tried$
BEGIN
    IF NEW.status = 'FINISHED' AND (TG_OP = 'INSERT' OR OLD.status <> 'FINISHED') THEN
        PERFORM razonapro.fn_refresh_student_ranking(NEW.student_id, NEW.program_id, NEW.finished_at);
    END IF;
    RETURN NEW;
END;
$trg_update_ranking_on_tried$ LANGUAGE plpgsql;

CREATE FUNCTION razonapro.fn_update_ranking_on_ai_tried()
RETURNS TRIGGER AS $trg_update_ranking_on_ai_tried$
BEGIN
    IF NEW.status = 'FINISHED' AND (TG_OP = 'INSERT' OR OLD.status <> 'FINISHED') THEN
        PERFORM razonapro.fn_refresh_student_ranking(NEW.student_id, NEW.program_id, NEW.finished_at);
    END IF;
    RETURN NEW;
END;
$trg_update_ranking_on_ai_tried$ LANGUAGE plpgsql;

CREATE TRIGGER trg_update_ranking_on_tried
    AFTER INSERT OR UPDATE OF status ON razonapro.trieds
    FOR EACH ROW EXECUTE FUNCTION razonapro.fn_update_ranking_on_tried();

CREATE TRIGGER trg_update_ranking_on_ai_tried
    AFTER INSERT OR UPDATE OF status ON razonapro.ai_trieds
    FOR EACH ROW EXECUTE FUNCTION razonapro.fn_update_ranking_on_ai_tried();

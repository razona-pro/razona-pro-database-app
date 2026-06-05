-- ─────────────────────────────────────────────────────────────────
-- Calcula score y finished_at cuando un intento pasa a FINISHED
-- ─────────────────────────────────────────────────────────────────
CREATE OR REPLACE FUNCTION razonapro.fn_calculate_tried_score()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.status = 'FINISHED' AND (TG_OP = 'INSERT' OR OLD.status <> 'FINISHED') THEN
        IF NEW.total_questions > 0 AND NEW.correct_answers IS NOT NULL THEN
            NEW.score := ROUND((NEW.correct_answers::NUMERIC / NEW.total_questions::NUMERIC) * 100, 2);
        END IF;
        IF NEW.finished_at IS NULL THEN
            NEW.finished_at := CURRENT_TIMESTAMP;
        END IF;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- IA: el score lo calcula la aplicación PONDERADO por el nivel de cada pregunta
-- (suma de niveles acertados / suma de niveles totales * 100). NO se sobreescribe
-- aquí con un simple correct/total, porque el modo IA es adaptativo por nivel.
CREATE OR REPLACE FUNCTION razonapro.fn_calculate_ai_tried_score()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.status = 'FINISHED' AND (TG_OP = 'INSERT' OR OLD.status <> 'FINISHED') THEN
        IF NEW.finished_at IS NULL THEN
            NEW.finished_at := CURRENT_TIMESTAMP;
        END IF;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_calculate_tried_score
    BEFORE INSERT OR UPDATE OF status, correct_answers ON razonapro.trieds
    FOR EACH ROW EXECUTE FUNCTION razonapro.fn_calculate_tried_score();

CREATE TRIGGER trg_calculate_ai_tried_score
    BEFORE INSERT OR UPDATE OF status, correct_answers ON razonapro.ai_trieds
    FOR EACH ROW EXECUTE FUNCTION razonapro.fn_calculate_ai_tried_score();

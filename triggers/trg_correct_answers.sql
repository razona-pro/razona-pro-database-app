-- ─────────────────────────────────────────────────────────────────
-- Recuenta correct_answers en trieds tras INSERT/UPDATE/DELETE
-- en students_responses
-- ─────────────────────────────────────────────────────────────────
CREATE OR REPLACE FUNCTION razonapro.fn_update_tried_correct_answers()
RETURNS TRIGGER AS $$
DECLARE
    v_competence_id VARCHAR(6);
    v_test_id       VARCHAR(8);
    v_program_id    VARCHAR(3);
    v_student_id    VARCHAR(7);
    v_tried_id      VARCHAR(10);
BEGIN
    IF TG_OP = 'DELETE' THEN
        v_competence_id := OLD.competence_id;
        v_test_id       := OLD.test_id;
        v_program_id    := OLD.program_id;
        v_student_id    := OLD.student_id;
        v_tried_id      := OLD.tried_id;
    ELSE
        v_competence_id := NEW.competence_id;
        v_test_id       := NEW.test_id;
        v_program_id    := NEW.program_id;
        v_student_id    := NEW.student_id;
        v_tried_id      := NEW.tried_id;
    END IF;

    UPDATE razonapro.trieds
    SET correct_answers = (
            SELECT COUNT(*)
            FROM razonapro.students_responses sr
            WHERE sr.competence_id = v_competence_id
              AND sr.test_id       = v_test_id
              AND sr.program_id    = v_program_id
              AND sr.student_id    = v_student_id
              AND sr.tried_id      = v_tried_id
              AND sr.is_correct    = 'Y'
        )
    WHERE competence_id = v_competence_id
      AND test_id       = v_test_id
      AND program_id    = v_program_id
      AND student_id    = v_student_id
      AND tried_id      = v_tried_id
      AND status       <> 'FINISHED';

    RETURN COALESCE(NEW, OLD);
END;
$$ LANGUAGE plpgsql;

-- ─────────────────────────────────────────────────────────────────
-- Recuenta correct_answers en ai_trieds tras INSERT/UPDATE/DELETE
-- en ai_tried_responses
-- ─────────────────────────────────────────────────────────────────
CREATE OR REPLACE FUNCTION razonapro.fn_update_ai_tried_correct_answers()
RETURNS TRIGGER AS $$
DECLARE
    v_program_id  VARCHAR(3);
    v_student_id  VARCHAR(7);
    v_ai_tried_id VARCHAR(10);
BEGIN
    IF TG_OP = 'DELETE' THEN
        v_program_id  := OLD.program_id;
        v_student_id  := OLD.student_id;
        v_ai_tried_id := OLD.ai_tried_id;
    ELSE
        v_program_id  := NEW.program_id;
        v_student_id  := NEW.student_id;
        v_ai_tried_id := NEW.ai_tried_id;
    END IF;

    UPDATE razonapro.ai_trieds
    SET correct_answers = (
            SELECT COUNT(*)
            FROM razonapro.ai_tried_responses atr
            WHERE atr.program_id  = v_program_id
              AND atr.student_id  = v_student_id
              AND atr.ai_tried_id = v_ai_tried_id
              AND atr.is_correct  = 'Y'
        )
    WHERE program_id  = v_program_id
      AND student_id  = v_student_id
      AND ai_tried_id = v_ai_tried_id
      AND status     <> 'FINISHED';

    RETURN COALESCE(NEW, OLD);
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_update_tried_answers
    AFTER INSERT OR UPDATE OR DELETE ON razonapro.students_responses
    FOR EACH ROW EXECUTE FUNCTION razonapro.fn_update_tried_correct_answers();

CREATE TRIGGER trg_update_ai_tried_answers
    AFTER INSERT OR UPDATE OR DELETE ON razonapro.ai_tried_responses
    FOR EACH ROW EXECUTE FUNCTION razonapro.fn_update_ai_tried_correct_answers();

CREATE OR REPLACE FUNCTION razonapro.fn_restrict_students_responses()
RETURNS TRIGGER AS $$
DECLARE
    v_status razonapro.trieds.status%TYPE;
BEGIN
    IF TG_OP = 'DELETE' THEN
        RAISE EXCEPTION
            'DELETE no permitido en students_responses. '
            'Registro: student_response_id = %', OLD.student_response_id;

    ELSIF TG_OP = 'UPDATE' THEN
        SELECT status INTO v_status
          FROM razonapro.trieds
         WHERE test_id    = OLD.test_id
           AND program_id = OLD.program_id
           AND student_id = OLD.student_id
           AND tried_id   = OLD.tried_id;

        IF v_status <> 'IN_PROGRESS' THEN
            RAISE EXCEPTION
                'No se puede modificar la respuesta %: '
                'el intento % tiene estado % y ya no admite cambios',
                OLD.student_response_id, OLD.tried_id, v_status;
        END IF;

        -- Campos de identidad: nunca deben cambiar
        IF OLD.student_response_id <> NEW.student_response_id
        OR OLD.competence_id       <> NEW.competence_id
        OR OLD.test_id             <> NEW.test_id
        OR OLD.tried_id            <> NEW.tried_id
        OR OLD.student_id          <> NEW.student_id
        OR OLD.question_id         <> NEW.question_id THEN
            RAISE EXCEPTION
                'Solo se permite actualizar option_id, answered_at e is_correct '
                'en students_responses. Registro: %', OLD.student_response_id;
        END IF;

        RETURN NEW;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_restrict_students_responses
    BEFORE UPDATE OR DELETE ON razonapro.students_responses
    FOR EACH ROW EXECUTE FUNCTION razonapro.fn_restrict_students_responses();
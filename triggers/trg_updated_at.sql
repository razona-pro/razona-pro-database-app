-- ─────────────────────────────────────────────────────────────────
-- Función genérica updated_at (NOW())
-- Usada por todas las tablas excepto trieds
-- ─────────────────────────────────────────────────────────────────
CREATE OR REPLACE FUNCTION razonapro.fn_set_updated_at()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at := CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- ─────────────────────────────────────────────────────────────────
-- Función updated_at para trieds
-- Usa GREATEST para nunca violar CK_TRIEDS_UPDATED_AT
-- (el trigger trg_update_tried_answers también hace UPDATE en trieds
--  y puede disparar este trigger en la misma transacción)
-- ─────────────────────────────────────────────────────────────────
CREATE OR REPLACE FUNCTION razonapro.fn_set_trieds_updated_at()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at := GREATEST(NOW(), NEW.created_at, OLD.updated_at);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- ─────────────────────────────────────────────────────────────────
-- Triggers
-- ─────────────────────────────────────────────────────────────────
CREATE TRIGGER trg_admins_updated_at
    BEFORE UPDATE ON razonapro.admins
    FOR EACH ROW EXECUTE FUNCTION razonapro.fn_set_updated_at();

CREATE TRIGGER trg_programs_updated_at
    BEFORE UPDATE ON razonapro.programs
    FOR EACH ROW EXECUTE FUNCTION razonapro.fn_set_updated_at();

CREATE TRIGGER trg_competences_updated_at
    BEFORE UPDATE ON razonapro.competences
    FOR EACH ROW EXECUTE FUNCTION razonapro.fn_set_updated_at();

CREATE TRIGGER trg_rankings_updated_at
    BEFORE UPDATE ON razonapro.rankings
    FOR EACH ROW EXECUTE FUNCTION razonapro.fn_set_updated_at();

CREATE TRIGGER trg_students_updated_at
    BEFORE UPDATE ON razonapro.students
    FOR EACH ROW EXECUTE FUNCTION razonapro.fn_set_updated_at();

CREATE TRIGGER trg_questions_updated_at
    BEFORE UPDATE ON razonapro.questions
    FOR EACH ROW EXECUTE FUNCTION razonapro.fn_set_updated_at();

CREATE TRIGGER trg_tests_updated_at
    BEFORE UPDATE ON razonapro.tests
    FOR EACH ROW EXECUTE FUNCTION razonapro.fn_set_updated_at();

CREATE TRIGGER trg_tests_questions_updated_at
    BEFORE UPDATE ON razonapro.tests_questions
    FOR EACH ROW EXECUTE FUNCTION razonapro.fn_set_updated_at();

CREATE TRIGGER trg_rankings_students_updated_at
    BEFORE UPDATE ON razonapro.rankings_students
    FOR EACH ROW EXECUTE FUNCTION razonapro.fn_set_updated_at();

-- trieds usa su propia función
CREATE TRIGGER trg_trieds_updated_at
    BEFORE UPDATE ON razonapro.trieds
    FOR EACH ROW EXECUTE FUNCTION razonapro.fn_set_trieds_updated_at();

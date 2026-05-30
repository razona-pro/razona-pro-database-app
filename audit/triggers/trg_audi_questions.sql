CREATE OR REPLACE FUNCTION razonapro.fn_audi_questions()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO razonapro.audi_questions
        (competence_id, question_id, difficulty_level, is_active, registered_at, db_user, action)
    VALUES (OLD.competence_id, OLD.question_id, OLD.difficulty_level, OLD.is_active,
            CURRENT_TIMESTAMP, CURRENT_USER,
            CASE TG_OP WHEN 'UPDATE' THEN 'U' ELSE 'D' END);
    IF TG_OP = 'UPDATE' THEN RETURN NEW; ELSE RETURN OLD; END IF;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_audi_questions
    BEFORE UPDATE OR DELETE ON razonapro.questions
    FOR EACH ROW EXECUTE FUNCTION razonapro.fn_audi_questions();

CREATE OR REPLACE FUNCTION razonapro.fn_audi_competences()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO razonapro.audi_competences (competence_id, competence_name, is_active, registered_at, db_user, action)
    VALUES (OLD.competence_id, OLD.competence_name, OLD.is_active, CURRENT_TIMESTAMP, CURRENT_USER,
            CASE TG_OP WHEN 'UPDATE' THEN 'U' ELSE 'D' END);
    IF TG_OP = 'UPDATE' THEN RETURN NEW; ELSE RETURN OLD; END IF;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_audi_competences
    BEFORE UPDATE OR DELETE ON razonapro.competences
    FOR EACH ROW EXECUTE FUNCTION razonapro.fn_audi_competences();

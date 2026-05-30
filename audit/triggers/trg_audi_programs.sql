CREATE OR REPLACE FUNCTION razonapro.fn_audi_programs()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO razonapro.audi_programs (program_id, program_name, is_active, registered_at, db_user, action)
    VALUES (OLD.program_id, OLD.program_name, OLD.is_active, CURRENT_TIMESTAMP, CURRENT_USER,
            CASE TG_OP WHEN 'UPDATE' THEN 'U' ELSE 'D' END);
    IF TG_OP = 'UPDATE' THEN RETURN NEW; ELSE RETURN OLD; END IF;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_audi_programs
    BEFORE UPDATE OR DELETE ON razonapro.programs
    FOR EACH ROW EXECUTE FUNCTION razonapro.fn_audi_programs();

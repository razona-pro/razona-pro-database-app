CREATE OR REPLACE FUNCTION razonapro.fn_audi_students()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO razonapro.audi_students
        (student_id, program_id, email, is_active, email_verified, identity_verified, registered_at, db_user, action)
    VALUES (OLD.student_id, OLD.program_id, OLD.email, OLD.is_active,
            OLD.email_verified, OLD.identity_verified, CURRENT_TIMESTAMP, CURRENT_USER,
            CASE TG_OP WHEN 'UPDATE' THEN 'U' ELSE 'D' END);
    IF TG_OP = 'UPDATE' THEN RETURN NEW; ELSE RETURN OLD; END IF;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_audi_students
    BEFORE UPDATE OR DELETE ON razonapro.students
    FOR EACH ROW EXECUTE FUNCTION razonapro.fn_audi_students();

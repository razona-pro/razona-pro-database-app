CREATE OR REPLACE FUNCTION razonapro.fn_audi_admins()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO razonapro.audi_admins (admin_id, email, is_active, registered_at, db_user, action)
    VALUES (OLD.admin_id, OLD.email, OLD.is_active, CURRENT_TIMESTAMP, CURRENT_USER,
            CASE TG_OP WHEN 'UPDATE' THEN 'U' ELSE 'D' END);
    IF TG_OP = 'UPDATE' THEN RETURN NEW; ELSE RETURN OLD; END IF;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_audi_admins
    BEFORE UPDATE OR DELETE ON razonapro.admins
    FOR EACH ROW EXECUTE FUNCTION razonapro.fn_audi_admins();

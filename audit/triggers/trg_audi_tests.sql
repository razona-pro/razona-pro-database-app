CREATE OR REPLACE FUNCTION razonapro.fn_audi_tests()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO razonapro.audi_tests
        (test_id, competence_id, test_name, test_mode, duration_seconds, is_active, registered_at, db_user, action)
    VALUES (OLD.test_id, OLD.competence_id, OLD.test_name, OLD.test_mode,
            OLD.duration_seconds, OLD.is_active, CURRENT_TIMESTAMP, CURRENT_USER,
            CASE TG_OP WHEN 'UPDATE' THEN 'U' ELSE 'D' END);
    IF TG_OP = 'UPDATE' THEN RETURN NEW; ELSE RETURN OLD; END IF;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_audi_tests
    BEFORE UPDATE OR DELETE ON razonapro.tests
    FOR EACH ROW EXECUTE FUNCTION razonapro.fn_audi_tests();

CREATE OR REPLACE FUNCTION razonapro.fn_audi_rankings()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO razonapro.audi_rankings
        (ranking_id, ranking_name, period_type, source_filter, is_active, registered_at, db_user, action)
    VALUES (OLD.ranking_id, OLD.ranking_name, OLD.period_type, OLD.source_filter, OLD.is_active,
            CURRENT_TIMESTAMP, CURRENT_USER,
            CASE TG_OP WHEN 'UPDATE' THEN 'U' ELSE 'D' END);
    IF TG_OP = 'UPDATE' THEN RETURN NEW; ELSE RETURN OLD; END IF;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_audi_rankings
    BEFORE UPDATE OR DELETE ON razonapro.rankings
    FOR EACH ROW EXECUTE FUNCTION razonapro.fn_audi_rankings();

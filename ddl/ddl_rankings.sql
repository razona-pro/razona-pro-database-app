CREATE TABLE razonapro.rankings (
    ranking_id    VARCHAR(6)   NOT NULL,
    ranking_name  VARCHAR(20)  NOT NULL,
    description   VARCHAR(100),
    period_type   VARCHAR(10)  NOT NULL,
    source_filter VARCHAR(10)  NOT NULL,
    competence_id VARCHAR(6),
    is_active     CHAR(1)      NOT NULL DEFAULT 'Y',
    created_at    TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at    TIMESTAMP,
    CONSTRAINT PK_RANKINGS                PRIMARY KEY (ranking_id),
    CONSTRAINT CK_RANKINGS_IS_ACTIVE      CHECK (is_active IN ('Y','N')),
    CONSTRAINT CK_RANKINGS_PERIOD_TYPE    CHECK (period_type IN ('DAILY','WEEKLY','MONTHLY','GENERAL')),
    CONSTRAINT CK_RANKINGS_SOURCE_FILTER  CHECK (source_filter IN ('ALL','TRIEDS','AI_TRIEDS')),
    CONSTRAINT CK_RANKINGS_NAME_NOTEMPTY  CHECK (LENGTH(TRIM(ranking_name)) > 0),
    CONSTRAINT CK_RANKINGS_DESC_NOTEMPTY  CHECK (description IS NULL OR LENGTH(TRIM(description)) > 0),
    CONSTRAINT CK_RANKINGS_UPDATED_AT     CHECK (updated_at IS NULL OR updated_at >= created_at)
);

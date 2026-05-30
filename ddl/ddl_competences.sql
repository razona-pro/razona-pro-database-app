CREATE TABLE razonapro.competences (
    competence_id   VARCHAR(6)   NOT NULL,
    competence_name VARCHAR(30)  NOT NULL,
    description     VARCHAR(100),
    is_active       CHAR(1)      NOT NULL DEFAULT 'Y',
    created_at      TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at      TIMESTAMP,
    CONSTRAINT PK_COMPETENCES              PRIMARY KEY (competence_id),
    CONSTRAINT CK_COMPETENCES_IS_ACTIVE    CHECK (is_active IN ('Y','N')),
    CONSTRAINT CK_COMPETENCES_NAME_NOTEMPTY CHECK (LENGTH(TRIM(competence_name)) > 0),
    CONSTRAINT CK_COMPETENCES_DESC_NOTEMPTY CHECK (description IS NULL OR LENGTH(TRIM(description)) > 0),
    CONSTRAINT CK_COMPETENCES_UPDATED_AT   CHECK (updated_at IS NULL OR updated_at >= created_at)
);

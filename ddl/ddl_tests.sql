CREATE TABLE razonapro.tests (
    test_id              VARCHAR(8)  NOT NULL,
    admin_id             VARCHAR(6)  NOT NULL,
    test_name            VARCHAR(50) NOT NULL,
    description          VARCHAR(100),
    duration_seconds     INTEGER,  -- NULL permitido para modo PRACTICE (sin tiempo)
    is_active            CHAR(1)     NOT NULL DEFAULT 'Y',
    questions_to_present INTEGER,
    test_mode            VARCHAR(10) NOT NULL,
    created_at           TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at           TIMESTAMP,
    -- MULTICOMPETENCIA: la prueba se identifica solo por test_id. Sus competencias
    -- son las de sus preguntas (tabla tests_questions). No tiene competencia propia.
    CONSTRAINT PK_TESTS                       PRIMARY KEY (test_id),
    CONSTRAINT FK_TESTS_ADMINS                FOREIGN KEY (admin_id)
        REFERENCES razonapro.admins (admin_id) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT CK_TESTS_IS_ACTIVE             CHECK (is_active IN ('Y','N')),
    CONSTRAINT CK_TESTS_MODE                  CHECK (test_mode IN ('PRACTICE','EXAM','TIMED')),
    CONSTRAINT CK_TESTS_DURATION_POSITIVE     CHECK (duration_seconds IS NULL OR duration_seconds > 0),
    -- Solo EXAM requiere duración total. PRACTICE no tiene tiempo; TIMED lo maneja
    -- POR PREGUNTA (según dificultad), así que su duración total es NULL.
    CONSTRAINT CK_TESTS_DURATION_REQUIRED     CHECK (test_mode <> 'EXAM' OR duration_seconds IS NOT NULL),
    CONSTRAINT CK_TESTS_QUESTIONS_TO_PRESENT  CHECK (questions_to_present IS NULL OR questions_to_present > 0),
    CONSTRAINT CK_TESTS_NAME_NOTEMPTY         CHECK (LENGTH(TRIM(test_name)) > 0),
    CONSTRAINT CK_TESTS_DESC_NOTEMPTY         CHECK (description IS NULL OR LENGTH(TRIM(description)) > 0),
    CONSTRAINT CK_TESTS_UPDATED_AT            CHECK (updated_at IS NULL OR updated_at >= created_at)
);

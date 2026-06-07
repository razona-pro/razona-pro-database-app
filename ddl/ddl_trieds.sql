CREATE TABLE razonapro.trieds (
    program_id          VARCHAR(3)    NOT NULL,
    student_id          VARCHAR(7)    NOT NULL,
    test_id             VARCHAR(8)    NOT NULL,
    tried_id            VARCHAR(10)   NOT NULL,
    status              VARCHAR(15)   NOT NULL DEFAULT 'IN_PROGRESS',
    score               NUMERIC(7,2),
    time_spent_seconds  INTEGER,
    total_questions     INTEGER       NOT NULL,
    correct_answers     INTEGER       DEFAULT 0,
    fraud_attempts      INTEGER       NOT NULL DEFAULT 0,  -- nº de eventos sospechosos (cambios de pestaña, etc.)
    review_viewed       CHAR(1)       NOT NULL DEFAULT 'N', -- retroalimentación de un solo uso (Y tras verla)
    attempt_timestamp   TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    created_at          TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at          TIMESTAMP,
    finished_at         TIMESTAMP,
    -- MULTICOMPETENCIA: el intento es de una PRUEBA (test_id), no de una competencia.
    CONSTRAINT PK_TRIEDS                 PRIMARY KEY (test_id, program_id, student_id, tried_id),
    CONSTRAINT FK_TRIEDS_STUDENTS        FOREIGN KEY (student_id, program_id)
        REFERENCES razonapro.students (student_id, program_id) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT FK_TRIEDS_TESTS           FOREIGN KEY (test_id)
        REFERENCES razonapro.tests (test_id) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT CK_TRIEDS_STATUS          CHECK (status IN ('IN_PROGRESS','FINISHED','ABANDONED','TIMED_OUT','ANULADO','PLAGIO')),
    CONSTRAINT CK_TRIEDS_FRAUD_ATTEMPTS  CHECK (fraud_attempts >= 0),
    CONSTRAINT CK_TRIEDS_REVIEW_VIEWED   CHECK (review_viewed IN ('Y','N')),
    -- El score ahora es puntos crudos ponderados por dificultad (no sobre 100); solo se exige no-negativo.
    CONSTRAINT CK_TRIEDS_SCORE           CHECK (score IS NULL OR score >= 0),
    CONSTRAINT CK_TRIEDS_TOTAL_QUESTIONS CHECK (total_questions > 0),
    CONSTRAINT CK_TRIEDS_CORRECT_ANSWERS CHECK (correct_answers IS NULL OR correct_answers >= 0),
    CONSTRAINT CK_TRIEDS_CORRECT_LE_TOTAL CHECK (correct_answers IS NULL OR correct_answers <= total_questions),
    CONSTRAINT CK_TRIEDS_TIME_SPENT      CHECK (time_spent_seconds IS NULL OR time_spent_seconds > 0),
    CONSTRAINT CK_TRIEDS_FINISHED_AT     CHECK (finished_at IS NULL OR finished_at >= attempt_timestamp),
    CONSTRAINT CK_TRIEDS_UPDATED_AT      CHECK (updated_at IS NULL OR updated_at >= created_at)
);

CREATE TABLE razonapro.ai_trieds (
    program_id          VARCHAR(3)   NOT NULL,
    student_id          VARCHAR(7)   NOT NULL,
    ai_tried_id         VARCHAR(10)  NOT NULL,
    status              VARCHAR(15)  NOT NULL DEFAULT 'IN_PROGRESS',
    score               NUMERIC(7,2),
    total_questions     INTEGER      NOT NULL,
    correct_answers     INTEGER      DEFAULT 0,
    time_spent_seconds  INTEGER,
    finished_at         TIMESTAMP,
    attempt_timestamp   TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    description         VARCHAR(200),
    competence_id       VARCHAR(6),
    theta               NUMERIC(5,3) DEFAULT 0.0,
    fraud_attempts      INTEGER      NOT NULL DEFAULT 0,
    CONSTRAINT PK_AI_TRIEDS                    PRIMARY KEY (program_id, student_id, ai_tried_id),
    CONSTRAINT FK_AI_TRIEDS_STUDENTS           FOREIGN KEY (student_id, program_id)
        REFERENCES razonapro.students (student_id, program_id) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT CK_AI_TRIEDS_STATUS             CHECK (status IN ('IN_PROGRESS','FINISHED','ABANDONED','ANULADO')),
    CONSTRAINT CK_AI_TRIEDS_FRAUD_ATTEMPTS     CHECK (fraud_attempts >= 0),
    -- El score ahora es puntos crudos ponderados por nivel (no sobre 100); solo se exige no-negativo.
    CONSTRAINT CK_AI_TRIEDS_SCORE              CHECK (score IS NULL OR score >= 0),
    CONSTRAINT CK_AI_TRIEDS_TOTAL_QUESTIONS    CHECK (total_questions > 0),
    CONSTRAINT CK_AI_TRIEDS_CORRECT_ANSWERS    CHECK (correct_answers IS NULL OR correct_answers >= 0),
    CONSTRAINT CK_AI_TRIEDS_CORRECT_LE_TOTAL   CHECK (correct_answers IS NULL OR correct_answers <= total_questions),
    CONSTRAINT CK_AI_TRIEDS_TIME_SPENT         CHECK (time_spent_seconds IS NULL OR time_spent_seconds > 0),
    CONSTRAINT CK_AI_TRIEDS_FINISHED_AT        CHECK (finished_at IS NULL OR finished_at >= attempt_timestamp),
    CONSTRAINT CK_AI_TRIEDS_DESC_NOTEMPTY      CHECK (description IS NULL OR LENGTH(TRIM(description)) > 0)
);

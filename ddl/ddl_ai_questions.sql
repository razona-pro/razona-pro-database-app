CREATE TABLE razonapro.ai_questions (
    ai_question_id   VARCHAR(12)  NOT NULL,
    program_id       VARCHAR(3)   NOT NULL,
    student_id       VARCHAR(7)   NOT NULL,
    ai_tried_id      VARCHAR(10)  NOT NULL,
    competence_id    VARCHAR(6),
    question_order   INTEGER      NOT NULL,
    statement        TEXT         NOT NULL,
    options_json     TEXT         NOT NULL,
    correct_index    INTEGER      NOT NULL,
    explanation      TEXT,
    difficulty_level INTEGER      NOT NULL DEFAULT 5,
    selected_index   INTEGER,
    is_correct       CHAR(1),
    hints_used       INTEGER      NOT NULL DEFAULT 0,
    answered_at      TIMESTAMP,
    created_at       TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT PK_AI_QUESTIONS PRIMARY KEY (ai_question_id),
    CONSTRAINT FK_AI_QUESTIONS_AI_TRIEDS FOREIGN KEY (program_id, student_id, ai_tried_id)
        REFERENCES razonapro.ai_trieds (program_id, student_id, ai_tried_id)
        ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT CK_AI_QUESTIONS_IS_CORRECT     CHECK (is_correct IS NULL OR is_correct IN ('Y','N')),
    CONSTRAINT CK_AI_QUESTIONS_ORDER          CHECK (question_order > 0),
    CONSTRAINT CK_AI_QUESTIONS_CORRECT_INDEX  CHECK (correct_index >= 0),
    CONSTRAINT CK_AI_QUESTIONS_DIFFICULTY     CHECK (difficulty_level BETWEEN 1 AND 10),
    CONSTRAINT CK_AI_QUESTIONS_HINTS          CHECK (hints_used >= 0),
    CONSTRAINT CK_AI_QUESTIONS_STATEMENT      CHECK (LENGTH(TRIM(statement)) > 0),
    CONSTRAINT CK_AI_QUESTIONS_ANSWERED_AT    CHECK (answered_at IS NULL OR answered_at >= created_at)
);

CREATE INDEX idx_ai_questions_tried
    ON razonapro.ai_questions (ai_tried_id, question_order);
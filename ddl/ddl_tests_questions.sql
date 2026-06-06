CREATE SEQUENCE IF NOT EXISTS razonapro.seq_test_question_id
    START WITH 1 INCREMENT BY 1;

CREATE TABLE razonapro.tests_questions (
    admin_id         VARCHAR(6)  NOT NULL,
    competence_id    VARCHAR(6)  NOT NULL,
    test_id          VARCHAR(8)  NOT NULL,
    question_id      VARCHAR(7)  NOT NULL,
    test_question_id INTEGER     NOT NULL DEFAULT nextval('razonapro.seq_test_question_id'),
    question_order   INTEGER,
    is_active        CHAR(1)     NOT NULL DEFAULT 'Y',
    created_at       TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at       TIMESTAMP,
    CONSTRAINT PK_TESTS_QUESTIONS          PRIMARY KEY (test_question_id),
    -- Multi-competencia: una prueba (test_id) puede agrupar preguntas de DISTINTAS competencias.
    -- Por eso la FK al test es solo por test_id (no por competencia). competence_id = competencia
    -- de la PREGUNTA (lo asegura la FK a questions).
    CONSTRAINT FK_TESTS_QUESTIONS_TESTS    FOREIGN KEY (test_id)
        REFERENCES razonapro.tests (test_id) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT FK_TESTS_QUESTIONS_QUESTIONS FOREIGN KEY (competence_id, question_id)
        REFERENCES razonapro.questions (competence_id, question_id) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT FK_TESTS_QUESTIONS_ADMINS   FOREIGN KEY (admin_id)
        REFERENCES razonapro.admins (admin_id) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT UN_TESTS_QUESTIONS          UNIQUE (competence_id, test_id, question_id),
    CONSTRAINT CK_TESTS_QUESTIONS_IS_ACTIVE CHECK (is_active IN ('Y','N')),
    CONSTRAINT CK_TESTS_QUESTIONS_ORDER    CHECK (question_order IS NULL OR question_order > 0),
    CONSTRAINT CK_TESTS_QUESTIONS_UPDATED_AT CHECK (updated_at IS NULL OR updated_at >= created_at)
);

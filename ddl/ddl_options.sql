CREATE TABLE razonapro.options (
    competence_id VARCHAR(6)   NOT NULL,
    question_id   VARCHAR(7)   NOT NULL,
    option_id     VARCHAR(6)   NOT NULL,
    option_text   VARCHAR(300) NOT NULL,
    is_correct    CHAR(1)      NOT NULL DEFAULT 'N',
    CONSTRAINT PK_OPTIONS              PRIMARY KEY (competence_id, question_id, option_id),
    CONSTRAINT FK_OPTIONS_QUESTIONS    FOREIGN KEY (competence_id, question_id)
        REFERENCES razonapro.questions (competence_id, question_id) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT CK_OPTIONS_IS_CORRECT   CHECK (is_correct IN ('Y','N')),
    CONSTRAINT CK_OPTIONS_TEXT_NOTEMPTY CHECK (LENGTH(TRIM(option_text)) > 0)
);

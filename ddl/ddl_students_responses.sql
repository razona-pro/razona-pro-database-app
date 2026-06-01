CREATE TABLE razonapro.students_responses (
    competence_id       VARCHAR(6)  NOT NULL,
    test_id             VARCHAR(8)  NOT NULL,
    program_id          VARCHAR(3)  NOT NULL,
    student_id          VARCHAR(7)  NOT NULL,
    tried_id            VARCHAR(10) NOT NULL,
    question_id         VARCHAR(7)  NOT NULL,
    option_id           VARCHAR(6),           -- NULL = sin responder
    student_response_id VARCHAR(10) NOT NULL,
    is_correct          CHAR(1)     NOT NULL  DEFAULT 'N',
    created_at          TIMESTAMP   NOT NULL  DEFAULT CURRENT_TIMESTAMP,
    answered_at         TIMESTAMP,
    CONSTRAINT PK_STUDENTS_RESPONSES   PRIMARY KEY (student_response_id),
    CONSTRAINT FK_STUD_RESP_TRIEDS     FOREIGN KEY (competence_id, test_id, program_id, student_id, tried_id)
        REFERENCES razonapro.trieds (competence_id, test_id, program_id, student_id, tried_id) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT UN_STUDENTS_RESPONSES   UNIQUE (competence_id, test_id, program_id, student_id, tried_id, question_id),
    CONSTRAINT CK_STUD_RESP_IS_CORRECT CHECK (is_correct IN ('Y','N')),
    CONSTRAINT CK_STUD_RESP_ANSWERED_AT CHECK (answered_at IS NULL OR answered_at >= created_at)
);
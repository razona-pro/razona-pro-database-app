CREATE TABLE razonapro.question_doubts (
    doubt_id       VARCHAR(12) NOT NULL,
    student_id     VARCHAR(7)  NOT NULL,
    program_id     VARCHAR(3)  NOT NULL,
    source         VARCHAR(10) NOT NULL,
    competence_id  VARCHAR(6),
    question_id    VARCHAR(7),
    ai_question_id VARCHAR(12),
    statement      TEXT,
    message        VARCHAR(500),
    status         VARCHAR(12) NOT NULL DEFAULT 'OPEN',
    created_at     TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    reviewed_at    TIMESTAMP,
    CONSTRAINT PK_QUESTION_DOUBTS    PRIMARY KEY (doubt_id),
    CONSTRAINT FK_DOUBTS_STUDENTS    FOREIGN KEY (student_id, program_id)
        REFERENCES razonapro.students (student_id, program_id) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT CK_DOUBTS_SOURCE      CHECK (source IN ('STATIC','AI')),
    CONSTRAINT CK_DOUBTS_STATUS      CHECK (status IN ('OPEN','REVIEWED','CLOSED')),
    CONSTRAINT CK_DOUBTS_REVIEWED_AT CHECK (reviewed_at IS NULL OR reviewed_at >= created_at)
);

CREATE INDEX idx_doubts_status
    ON razonapro.question_doubts (status, created_at DESC);
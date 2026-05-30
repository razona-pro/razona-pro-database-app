CREATE TABLE razonapro.audi_programs (
    row_id        SERIAL      NOT NULL,
    program_id    VARCHAR(3)  NOT NULL,
    program_name  VARCHAR(50) NOT NULL,
    is_active     CHAR(1)     NOT NULL,
    registered_at TIMESTAMP   NOT NULL,
    db_user       VARCHAR(50) NOT NULL,
    action        CHAR(1)     NOT NULL,
    CONSTRAINT PK_AUDI_PROGRAMS        PRIMARY KEY (row_id),
    CONSTRAINT CK_AUDI_PROGRAMS_ACTION CHECK (action IN ('U','D'))
);

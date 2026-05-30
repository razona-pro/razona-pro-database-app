CREATE TABLE razonapro.audi_admins (
    row_id        SERIAL      NOT NULL,
    admin_id      VARCHAR(6)  NOT NULL,
    email         VARCHAR(50) NOT NULL,
    is_active     CHAR(1)     NOT NULL,
    registered_at TIMESTAMP   NOT NULL,
    db_user       VARCHAR(50) NOT NULL,
    action        CHAR(1)     NOT NULL,
    CONSTRAINT PK_AUDI_ADMINS          PRIMARY KEY (row_id),
    CONSTRAINT CK_AUDI_ADMINS_ACTION   CHECK (action IN ('U','D'))
);

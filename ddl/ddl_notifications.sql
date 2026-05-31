CREATE TABLE razonapro.notifications (
    notification_id VARCHAR(12)  NOT NULL,
    recipient_id    VARCHAR(7)   NOT NULL,
    recipient_type  VARCHAR(10)  NOT NULL,
    type            VARCHAR(20)  NOT NULL,
    title           VARCHAR(120) NOT NULL,
    body            VARCHAR(500),
    link            VARCHAR(200),
    is_read         CHAR(1)      NOT NULL DEFAULT 'N',
    created_at      TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    read_at         TIMESTAMP,
    CONSTRAINT PK_NOTIFICATIONS         PRIMARY KEY (notification_id),
    CONSTRAINT CK_NOTIF_IS_READ         CHECK (is_read IN ('Y','N')),
    CONSTRAINT CK_NOTIF_RECIPIENT_TYPE  CHECK (recipient_type IN ('STUDENT','ADMIN')),
    CONSTRAINT CK_NOTIF_TYPE            CHECK (type IN ('NEW_TEST','DOUBT_REPORT','SYSTEM')),
    CONSTRAINT CK_NOTIF_TITLE_NOTEMPTY  CHECK (LENGTH(TRIM(title)) > 0),
    CONSTRAINT CK_NOTIF_READ_AT         CHECK (read_at IS NULL OR read_at >= created_at)
);

CREATE INDEX idx_notif_recipient
    ON razonapro.notifications (recipient_id, recipient_type, is_read, created_at DESC);
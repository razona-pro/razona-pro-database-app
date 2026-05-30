-- ─────────────────────────────────────────────────────────────────
-- Tokens para admins  (PASSWORD_RESET | REFRESH)
-- ─────────────────────────────────────────────────────────────────
CREATE TABLE razonapro.admin_tokens (
    admin_token_id BIGSERIAL    NOT NULL,
    admin_id       CHAR(6)      NOT NULL,
    token_hash     CHAR(64)     NOT NULL,   -- SHA-256 hex del token raw
    token_type     VARCHAR(20)  NOT NULL,   -- PASSWORD_RESET | REFRESH
    expires_at     TIMESTAMP    NOT NULL,
    used_at        TIMESTAMP,
    created_at     TIMESTAMP    NOT NULL DEFAULT NOW(),
    CONSTRAINT PK_ADMIN_TOKENS        PRIMARY KEY (admin_token_id),
    CONSTRAINT FK_ADMIN_TOKENS_ADMIN  FOREIGN KEY (admin_id)
        REFERENCES razonapro.admins (admin_id) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT CK_ADMIN_TOKENS_TYPE   CHECK (token_type IN ('PASSWORD_RESET','REFRESH'))
);

CREATE UNIQUE INDEX uq_admin_tokens_hash   ON razonapro.admin_tokens (token_hash);
CREATE        INDEX idx_admin_tokens_admin ON razonapro.admin_tokens (admin_id);

-- ─────────────────────────────────────────────────────────────────
-- Tokens para estudiantes (EMAIL_VERIFY | PASSWORD_RESET | REFRESH)
-- ─────────────────────────────────────────────────────────────────
CREATE TABLE razonapro.student_tokens (
    student_token_id BIGSERIAL   NOT NULL,
    student_id       CHAR(7)     NOT NULL,
    token_hash       CHAR(64)    NOT NULL,   -- SHA-256 hex del token raw
    token_type       VARCHAR(20) NOT NULL,   -- EMAIL_VERIFY | PASSWORD_RESET | REFRESH
    expires_at       TIMESTAMP   NOT NULL,
    used_at          TIMESTAMP,
    created_at       TIMESTAMP   NOT NULL DEFAULT NOW(),
    CONSTRAINT PK_STUDENT_TOKENS          PRIMARY KEY (student_token_id),
    CONSTRAINT FK_STUDENT_TOKENS_STUDENT  FOREIGN KEY (student_id)
        REFERENCES razonapro.students (student_id) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT CK_STUDENT_TOKENS_TYPE     CHECK (token_type IN ('EMAIL_VERIFY','PASSWORD_RESET','REFRESH'))
);

CREATE UNIQUE INDEX uq_student_tokens_hash    ON razonapro.student_tokens (token_hash);
CREATE        INDEX idx_student_tokens_student ON razonapro.student_tokens (student_id);

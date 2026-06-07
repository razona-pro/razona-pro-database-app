CREATE TABLE razonapro.appeals (
    appeal_id           VARCHAR(12)   NOT NULL,
    student_id          VARCHAR(7)    NOT NULL,
    program_id          VARCHAR(3)    NOT NULL,
    deactivation_reason VARCHAR(10),                       -- FRAUD | MANUAL (snapshot al apelar)
    message             VARCHAR(1000) NOT NULL,
    status              VARCHAR(10)   NOT NULL DEFAULT 'PENDING',
    admin_response      VARCHAR(1000),
    resolved_by         VARCHAR(6),
    created_at          TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    resolved_at         TIMESTAMP,
    CONSTRAINT PK_APPEALS                 PRIMARY KEY (appeal_id),
    CONSTRAINT FK_APPEALS_STUDENTS        FOREIGN KEY (student_id, program_id)
        REFERENCES razonapro.students (student_id, program_id) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT FK_APPEALS_ADMINS          FOREIGN KEY (resolved_by)
        REFERENCES razonapro.admins (admin_id) ON DELETE SET NULL ON UPDATE RESTRICT,
    CONSTRAINT CK_APPEALS_STATUS          CHECK (status IN ('PENDING','APPROVED','REJECTED')),
    CONSTRAINT CK_APPEALS_DEACT_REASON    CHECK (deactivation_reason IS NULL OR deactivation_reason IN ('FRAUD','MANUAL')),
    CONSTRAINT CK_APPEALS_MSG_NOTEMPTY    CHECK (LENGTH(TRIM(message)) > 0),
    CONSTRAINT CK_APPEALS_RESOLVED_AT     CHECK (resolved_at IS NULL OR resolved_at >= created_at),
    -- Resuelta ⇒ debe tener fecha y autor; pendiente ⇒ no.
    CONSTRAINT CK_APPEALS_RESOLVE_CONSIST CHECK (
        (status = 'PENDING'  AND resolved_at IS NULL AND resolved_by IS NULL)
     OR (status <> 'PENDING' AND resolved_at IS NOT NULL))
);

-- A lo sumo UNA apelación PENDING por estudiante (índice parcial único).
CREATE UNIQUE INDEX IF NOT EXISTS ux_appeals_one_pending
    ON razonapro.appeals (student_id, program_id)
    WHERE status = 'PENDING';

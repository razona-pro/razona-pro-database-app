-- ─────────────────────────────────────────────────────────────────
-- IRT acumulativo por usuario y competencia.
-- Guarda el theta (habilidad estimada) que persiste ENTRE intentos IA:
-- si un usuario rinde alto en una competencia, su siguiente práctica IA
-- arranca en un nivel acorde (no siempre desde el medio).
-- ─────────────────────────────────────────────────────────────────
CREATE TABLE razonapro.ai_user_competence (
    program_id      VARCHAR(3)   NOT NULL,
    student_id      VARCHAR(7)   NOT NULL,
    competence_id   VARCHAR(6)   NOT NULL,
    theta           NUMERIC(5,3) NOT NULL DEFAULT 0.0,
    answered_total  INTEGER      NOT NULL DEFAULT 0,
    updated_at      TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT PK_AI_USER_COMPETENCE PRIMARY KEY (program_id, student_id, competence_id),
    CONSTRAINT FK_AI_USER_COMP_STUDENTS    FOREIGN KEY (student_id, program_id)
        REFERENCES razonapro.students (student_id, program_id) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT FK_AI_USER_COMP_COMPETENCES FOREIGN KEY (competence_id)
        REFERENCES razonapro.competences (competence_id) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT CK_AI_USER_COMP_THETA       CHECK (theta >= -3.0 AND theta <= 3.0),
    CONSTRAINT CK_AI_USER_COMP_ANSWERED    CHECK (answered_total >= 0)
);

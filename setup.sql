-- ═══════════════════════════════════════════════════════════════════
-- SCRIPT MAESTRO — RazonaPro
-- Ejecuta en orden; arranca siempre desde cero (DROP … CASCADE).
-- Motor: PostgreSQL 15+   Esquema: razonapro
-- ═══════════════════════════════════════════════════════════════════

-- ── 0. Esquema ────────────────────────────────────────────────────
DROP SCHEMA IF EXISTS razonapro CASCADE;
CREATE SCHEMA razonapro;

-- ── 1. Tablas principales (orden de dependencias) ─────────────────
\i ddl/ddl_admins.sql
\i ddl/ddl_programs.sql
\i ddl/ddl_competences.sql
\i ddl/ddl_rankings.sql
\i ddl/ddl_rankings_competences.sql   -- competencias por ranking (multi-competencia); depende de rankings y competences
\i ddl/ddl_students.sql
\i ddl/ddl_questions.sql
\i ddl/ddl_options.sql
\i ddl/ddl_tests.sql
\i ddl/ddl_tests_questions.sql       -- incluye seq_test_question_id
\i ddl/ddl_trieds.sql
\i ddl/ddl_students_responses.sql
\i ddl/ddl_ai_trieds.sql
\i ddl/ddl_ai_tried_responses.sql
\i ddl/ddl_ai_questions.sql          -- NUEVO (depende de ai_trieds)
\i ddl/ddl_ai_user_competence.sql    -- NUEVO (IRT acumulativo por usuario; depende de students y competences)
\i ddl/ddl_notifications.sql         -- NUEVO (independiente)
\i ddl/ddl_question_doubts.sql
\i ddl/ddl_rankings_students.sql     -- incluye seq_ranking_student_id
\i ddl/ddl_appeals.sql               -- apelaciones de cuentas desactivadas (depende de students y admins)
\i ddl/ddl_tokens.sql

-- ── 2. Tablas de auditoría ────────────────────────────────────────
\i audit/ddl/ddl_audi_admins.sql
\i audit/ddl/ddl_audi_programs.sql
\i audit/ddl/ddl_audi_competences.sql
\i audit/ddl/ddl_audi_students.sql
\i audit/ddl/ddl_audi_tests.sql
\i audit/ddl/ddl_audi_questions.sql
\i audit/ddl/ddl_audi_rankings.sql
\i audit/ddl/ddl_audi_options.sql
\i audit/ddl/ddl_audi_tests_questions.sql

-- ── 3. Índices de stats ───────────────────────────────────────────
CREATE INDEX idx_trieds_status       ON razonapro.trieds (status);
CREATE INDEX idx_trieds_finished_at  ON razonapro.trieds (finished_at);
CREATE INDEX idx_students_is_active  ON razonapro.students (is_active);
CREATE INDEX idx_competences_active  ON razonapro.competences (is_active);

-- ── 4. Triggers de negocio ────────────────────────────────────────
\i triggers/trg_updated_at.sql
-- score y correct_answers se calculan en el backend Java; los RANKINGS se actualizan
-- por trigger al pasar un tried/ai_tried a FINISHED (trg_rankings.sql).
\i triggers/trg_restrict_students_responses.sql
\i triggers/trg_rankings.sql

-- ── 5. Triggers de auditoría ──────────────────────────────────────
\i audit/triggers/trg_audi_admins.sql
\i audit/triggers/trg_audi_programs.sql
\i audit/triggers/trg_audi_competences.sql
\i audit/triggers/trg_audi_students.sql
\i audit/triggers/trg_audi_tests.sql
\i audit/triggers/trg_audi_questions.sql
\i audit/triggers/trg_audi_rankings.sql
\i audit/triggers/trg_audi_options.sql
\i audit/triggers/trg_audi_tests_questions.sql

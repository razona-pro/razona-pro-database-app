-- ═══════════════════════════════════════════════════════════════════
-- MIGRACIÓN — Puntaje ponderado por dificultad/nivel (Fase 1)
-- Fecha: 2026-06-05
--
-- Centraliza el cálculo de score y correct_answers en el backend Java.
-- 1. Elimina los triggers/funciones de cálculo (ahora los hace Java).
-- 2. Relaja la constraint de score (ya no es sobre 100, son puntos crudos).
--
-- Aplicar sobre una BD EXISTENTE (con datos). Para una BD nueva, usar setup.sql.
-- Ejecutar:
--   psql -U postgres -d <bd> -f migrations/2026-06-05_scoring_ponderado.sql
-- ═══════════════════════════════════════════════════════════════════

SET search_path TO razonapro;

-- ── 1. Eliminar triggers y funciones de cálculo ──────────────────────
DROP TRIGGER  IF EXISTS trg_calculate_tried_score    ON razonapro.trieds;
DROP TRIGGER  IF EXISTS trg_calculate_ai_tried_score ON razonapro.ai_trieds;
DROP TRIGGER  IF EXISTS trg_update_tried_answers     ON razonapro.students_responses;
DROP TRIGGER  IF EXISTS trg_update_ai_tried_answers  ON razonapro.ai_tried_responses;

DROP FUNCTION IF EXISTS razonapro.fn_calculate_tried_score();
DROP FUNCTION IF EXISTS razonapro.fn_calculate_ai_tried_score();
DROP FUNCTION IF EXISTS razonapro.fn_update_tried_correct_answers();
DROP FUNCTION IF EXISTS razonapro.fn_update_ai_tried_correct_answers();

-- ── 1b. Eliminar triggers/funciones de RANKING (ahora el ranking lo calcula Java) ──
-- IMPORTANTE: esto resuelve el error "no existe la función fn_refresh_student_ranking",
-- que hacía rollback al finalizar un intento (quedaba IN_PROGRESS).
DROP TRIGGER  IF EXISTS trg_update_ranking_on_tried    ON razonapro.trieds;
DROP TRIGGER  IF EXISTS trg_update_ranking_on_ai_tried ON razonapro.ai_trieds;
DROP FUNCTION IF EXISTS razonapro.fn_update_ranking_on_tried();
DROP FUNCTION IF EXISTS razonapro.fn_update_ranking_on_ai_tried();
DROP FUNCTION IF EXISTS razonapro.fn_refresh_student_ranking(VARCHAR, VARCHAR, TIMESTAMP);
DROP FUNCTION IF EXISTS razonapro.fn_refresh_student_ranking(character varying, character varying, timestamp without time zone);

-- ── 2. Relajar la constraint de score (puntos crudos, no sobre 100) ──
ALTER TABLE razonapro.trieds    DROP CONSTRAINT IF EXISTS CK_TRIEDS_SCORE;
ALTER TABLE razonapro.trieds    ADD  CONSTRAINT CK_TRIEDS_SCORE
    CHECK (score IS NULL OR score >= 0);

ALTER TABLE razonapro.ai_trieds DROP CONSTRAINT IF EXISTS CK_AI_TRIEDS_SCORE;
ALTER TABLE razonapro.ai_trieds ADD  CONSTRAINT CK_AI_TRIEDS_SCORE
    CHECK (score IS NULL OR score >= 0);

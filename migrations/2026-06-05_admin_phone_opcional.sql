-- ═══════════════════════════════════════════════════════════════════
-- MIGRACIÓN — El teléfono del administrador ya no se solicita
-- Fecha: 2026-06-05
-- Hace nullable admins.phone. Los CHECK/UNIQUE existentes ya toleran NULL
-- (un CHECK con NULL pasa, y UNIQUE permite múltiples NULL en PostgreSQL).
--
-- Ejecutar:
--   psql -U postgres -d <bd> -f migrations/2026-06-05_admin_phone_opcional.sql
-- ═══════════════════════════════════════════════════════════════════

ALTER TABLE razonapro.admins ALTER COLUMN phone DROP NOT NULL;

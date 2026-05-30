# razona-pro-database

Scripts de base de datos para RazonaPro — evaluación Saber Pro UFPSO.  
Motor: **PostgreSQL 15+** · Esquema: `razonapro`  
**Autores:** Fabian Rojas (0192270) · Andres Gomez (0192250)

---

## Ejecución desde cero

```bash
psql -U <usuario> -d <base_de_datos> -f setup.sql
```

`setup.sql` hace `DROP SCHEMA razonapro CASCADE` y reconstruye todo en orden.  
Los archivos individuales se pueden correr por separado respetando el orden de dependencias descrito abajo.

---

## Tablas principales (16)

| Tabla | PK |
|---|---|
| `admins` | `admin_id` VARCHAR(6) — `AMN###` |
| `programs` | `program_id` VARCHAR(3) — numérico |
| `competences` | `competence_id` VARCHAR(6) — `CPE###` |
| `rankings` | `ranking_id` VARCHAR(6) — `RKG###` |
| `students` | `(student_id, program_id)` + UNIQUE `student_id` |
| `questions` | `(competence_id, question_id)` — `QTN####` |
| `options` | `(competence_id, question_id, option_id)` — `OTN###` |
| `tests` | `(test_id, competence_id)` — `TET#####` |
| `tests_questions` | `test_question_id` INTEGER — secuencia embebida |
| `trieds` | `(competence_id, test_id, program_id, student_id, tried_id)` |
| `students_responses` | `student_response_id` VARCHAR(10) — `SRE#######` |
| `ai_trieds` | `(program_id, student_id, ai_tried_id)` |
| `ai_tried_responses` | `(program_id, student_id, ai_tried_id, ai_tried_response_id)` |
| `rankings_students` | `ranking_student_id` INTEGER — secuencia embebida |
| `admin_tokens` | `admin_token_id` BIGSERIAL |
| `student_tokens` | `student_token_id` BIGSERIAL |

## Tablas de auditoría (9)

`audi_admins` · `audi_programs` · `audi_competences` · `audi_students` · `audi_tests` · `audi_questions` · `audi_rankings` · `audi_options` · `audi_tests_questions`

Capturan `UPDATE` y `DELETE` con snapshot del estado anterior.

---

### Convención de IDs (VARCHAR PKs)

| Tabla | Acrónimo | Ejemplo | VARCHAR |
|---|---|---|---|
| admins | AMN | AMN001 | (6) |
| competences | CPE | CPE001 | (6) |
| rankings | RKG | RKG001 | (6) |
| questions | QTN | QTN0001 | (7) |
| options | OTN | OTN001 | (6) |
| tests | TET | TET00001 | (8) |
| trieds | TRD | TRD0000001 | (10) |
| students_responses | SRE | SRE0000001 | (10) |
| ai_trieds | ATD | ATD0000001 | (10) |
| ai_tried_responses | ATE | ATE0000001 | (10) |

> `program_id` y `student_id` usan solo números.  
> `test_question_id` y `ranking_student_id` son `INTEGER` con secuencia propia.

---

## Estructura

```
razona-pro-database/
├── setup.sql                         ← punto de entrada único
├── ddl/                              # 16 archivos (tablas + tokens)
├── audit/
│   ├── ddl/                          # 9 archivos
│   └── triggers/                     # 9 archivos
├── triggers/                         # 5 archivos
└── README.md
```

---

## Orden de ejecución (detallado)

### 1 — DDL tablas principales

| # | Archivo |
|---|---|
| 01 | `ddl/ddl_admins.sql` |
| 02 | `ddl/ddl_programs.sql` |
| 03 | `ddl/ddl_competences.sql` |
| 04 | `ddl/ddl_rankings.sql` |
| 05 | `ddl/ddl_students.sql` |
| 06 | `ddl/ddl_questions.sql` |
| 07 | `ddl/ddl_options.sql` |
| 08 | `ddl/ddl_tests.sql` |
| 09 | `ddl/ddl_tests_questions.sql` |
| 10 | `ddl/ddl_trieds.sql` |
| 11 | `ddl/ddl_students_responses.sql` |
| 12 | `ddl/ddl_ai_trieds.sql` |
| 13 | `ddl/ddl_ai_tried_responses.sql` |
| 14 | `ddl/ddl_rankings_students.sql` |
| 15 | `ddl/ddl_tokens.sql` |

### 2 — DDL auditoría

| # | Archivo |
|---|---|
| 16 | `audit/ddl/ddl_audi_admins.sql` |
| 17 | `audit/ddl/ddl_audi_programs.sql` |
| 18 | `audit/ddl/ddl_audi_competences.sql` |
| 19 | `audit/ddl/ddl_audi_students.sql` |
| 20 | `audit/ddl/ddl_audi_tests.sql` |
| 21 | `audit/ddl/ddl_audi_questions.sql` |
| 22 | `audit/ddl/ddl_audi_rankings.sql` |
| 23 | `audit/ddl/ddl_audi_options.sql` |
| 24 | `audit/ddl/ddl_audi_tests_questions.sql` |

### 3 — Índices de stats

Creados directamente en `setup.sql` sobre `trieds`, `students` y `competences`.

### 4 — Triggers de negocio

| # | Archivo | Qué hace |
|---|---|---|
| 25 | `triggers/trg_updated_at.sql` | `updated_at` automático; trieds usa `GREATEST` |
| 26 | `triggers/trg_calculate_scores.sql` | Calcula `score` y `finished_at` al pasar a FINISHED |
| 27 | `triggers/trg_correct_answers.sql` | Recuenta `correct_answers` en trieds / ai_trieds |
| 28 | `triggers/trg_rankings.sql` | Actualiza `rankings_students` al finalizar un intento |
| 29 | `triggers/trg_restrict_students_responses.sql` | Bloquea DELETE; restringe UPDATE a campos permitidos |

### 5 — Triggers de auditoría

| # | Archivo |
|---|---|
| 30 | `audit/triggers/trg_audi_admins.sql` |
| 31 | `audit/triggers/trg_audi_programs.sql` |
| 32 | `audit/triggers/trg_audi_competences.sql` |
| 33 | `audit/triggers/trg_audi_students.sql` |
| 34 | `audit/triggers/trg_audi_tests.sql` |
| 35 | `audit/triggers/trg_audi_questions.sql` |
| 36 | `audit/triggers/trg_audi_rankings.sql` |
| 37 | `audit/triggers/trg_audi_options.sql` |
| 38 | `audit/triggers/trg_audi_tests_questions.sql` |

---

## Cambios respecto a la versión anterior

| Elemento | Cambio |
|---|---|
| `students.student_id` | `UNIQUE` declarado directamente en el DDL (ya no se crea con `CREATE UNIQUE INDEX CONCURRENTLY`) |
| `fn_set_updated_at` en `trieds` | Función separada `fn_set_trieds_updated_at` que usa `GREATEST(NOW(), created_at, OLD.updated_at)` para no violar `CK_TRIEDS_UPDATED_AT` |
| `students_responses.option_id` | Se mantiene `NOT NULL` desde el DDL base |
| `seq_test_question_id` / `seq_ranking_student_id` | Incluidas en sus propios DDL junto a la tabla |
| `admin_tokens` / `student_tokens` | Nuevas tablas en `ddl/ddl_tokens.sql` con CHECK en `token_type` |
| `trg_restrict_students_responses` | Permite cambiar `is_correct` (campo de negocio); solo protege los campos de identidad |
| Carpeta `dml/` | Eliminada del repo — los datos se gestionan fuera del esquema de BD |

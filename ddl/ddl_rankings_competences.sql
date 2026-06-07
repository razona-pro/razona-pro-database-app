-- Competencias que abarca cada ranking (multi-competencia).
-- Sin filas para un ranking = ranking general (todas las competencias).
CREATE TABLE razonapro.rankings_competences (
    ranking_id    VARCHAR(6) NOT NULL,
    competence_id VARCHAR(6) NOT NULL,
    CONSTRAINT PK_RANKINGS_COMPETENCES PRIMARY KEY (ranking_id, competence_id),
    CONSTRAINT FK_RANK_COMP_RANKING     FOREIGN KEY (ranking_id)
        REFERENCES razonapro.rankings (ranking_id) ON DELETE CASCADE ON UPDATE RESTRICT,
    CONSTRAINT FK_RANK_COMP_COMPETENCE  FOREIGN KEY (competence_id)
        REFERENCES razonapro.competences (competence_id) ON DELETE RESTRICT ON UPDATE RESTRICT
);

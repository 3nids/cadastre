/*
	bien fonds
*/

BEGIN;

/* CREATE TABLE */
DROP TABLE IF EXISTS cadastre.bienfonds CASCADE;
CREATE TABLE cadastre.bienfonds (id serial NOT NULL);
SELECT setval('cadastre.bienfonds_id_seq', 100, true);
COMMENT ON TABLE cadastre.bienfonds IS 'bienfonds.';

/* columns */
ALTER TABLE cadastre.bienfonds ADD COLUMN genre        varchar(30) DEFAULT '' ;
ALTER TABLE cadastre.bienfonds ADD COLUMN numero       varchar(12) DEFAULT '' ;
ALTER TABLE cadastre.bienfonds ADD COLUMN commune      varchar(20) DEFAULT '' ;

ALTER TABLE cadastre.bienfonds ADD COLUMN lbl_x        decimal(12,3)          ;
ALTER TABLE cadastre.bienfonds ADD COLUMN lbl_y        decimal(12,3)          ;
ALTER TABLE cadastre.bienfonds ADD COLUMN lbl_ori_deg  decimal(6,2)           ;

/* geometry */
SELECT AddGeometryColumn('cadastre', 'bienfonds', 'geometry', 21781, 'POLYGON', 2);
CREATE INDEX bienfonds_geoidx ON cadastre.bienfonds USING GIST ( geometry );


COMMIT;

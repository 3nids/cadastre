/*
	numero maison
*/

BEGIN;

/* CREATE TABLE */
DROP TABLE IF EXISTS cadastre.numeromaison CASCADE;
CREATE TABLE cadastre.numeromaison (id serial NOT NULL);
SELECT setval('cadastre.numeromaison_id_seq', 100, true);
COMMENT ON TABLE cadastre.numeromaison IS 'numeromaison.';

/* columns */
ALTER TABLE cadastre.numeromaison ADD COLUMN numero       varchar(20) DEFAULT '' ;

ALTER TABLE cadastre.numeromaison ADD COLUMN lbl_ori_deg  decimal(6,2)           ;

/* geometry */
SELECT AddGeometryColumn('cadastre', 'numeromaison', 'geometry', 21781, 'POINT', 2);
CREATE INDEX numeromaison_geoidx ON cadastre.numeromaison USING GIST ( geometry );


COMMIT;

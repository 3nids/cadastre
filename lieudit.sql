/*
	lieux dits
*/

BEGIN;

/* CREATE TABLE */
DROP TABLE IF EXISTS cadastre.lieudit CASCADE;
CREATE TABLE cadastre.lieudit (id serial NOT NULL);
SELECT setval('cadastre.lieudit_id_seq', 100, true);
COMMENT ON TABLE cadastre.lieudit IS 'lieudit.';

/* columns */
ALTER TABLE cadastre.lieudit ADD COLUMN lieu       varchar(120) DEFAULT '' ;

ALTER TABLE cadastre.lieudit ADD COLUMN lbl_ori_deg  decimal(6,2)           ;

/* geometry */
SELECT AddGeometryColumn('cadastre', 'lieudit', 'geometry', 21781, 'POINT', 2);
CREATE INDEX lieudit_geoidx ON cadastre.lieudit USING GIST ( geometry );


COMMIT;

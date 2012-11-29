/*
	batiments
*/

BEGIN;

/* CREATE TABLE */
DROP TABLE IF EXISTS cadastre.batiment CASCADE;
CREATE TABLE cadastre.batiment (id serial NOT NULL);
SELECT setval('cadastre.batiment_id_seq', 100, true);
COMMENT ON TABLE cadastre.batiment IS 'batiment.';

/* columns */
ALTER TABLE cadastre.batiment ADD COLUMN genre              varchar(30) DEFAULT '' ;
ALTER TABLE cadastre.batiment ADD COLUMN design             varchar(60) DEFAULT '' ;
ALTER TABLE cadastre.batiment ADD COLUMN numero             varchar(12) DEFAULT '' ;
ALTER TABLE cadastre.batiment ADD COLUMN commune            varchar(20) DEFAULT '' ;
ALTER TABLE cadastre.batiment ADD COLUMN qualite            varchar(10) DEFAULT '' ;

ALTER TABLE cadastre.batiment ADD COLUMN lbl_x              decimal(12,3)          ;
ALTER TABLE cadastre.batiment ADD COLUMN lbl_y              decimal(12,3)          ;
ALTER TABLE cadastre.batiment ADD COLUMN lbl_ori_deg        decimal(6,2)           ;

/* geometry */
SELECT AddGeometryColumn('cadastre', 'batiment', 'geometry', 21781, 'POLYGON', 2);
CREATE INDEX batiment_geoidx ON cadastre.batiment USING GIST ( geometry );

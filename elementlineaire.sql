/*
	element lineaire
*/

BEGIN;

/* CREATE TABLE */
DROP TABLE IF EXISTS cadastre.elementlineaire CASCADE;
CREATE TABLE cadastre.elementlineaire (id serial NOT NULL);
SELECT setval('cadastre.elementlineaire_id_seq', 100, true);
COMMENT ON TABLE cadastre.elementlineaire IS 'elementlineaire.';

ALTER TABLE cadastre.elementlineaire ADD COLUMN genre        varchar(30) DEFAULT '' ;
ALTER TABLE cadastre.elementlineaire ADD COLUMN qualite      varchar(10) DEFAULT '' ;

/* geometry */
SELECT AddGeometryColumn('cadastre', 'elementlineaire', 'geometry', 21781, 'LINESTRING', 2);
CREATE INDEX elementlineaire_geoidx ON cadastre.elementlineaire USING GIST ( geometry );


COMMIT;

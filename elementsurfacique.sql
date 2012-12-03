/*
	element lineaire
*/

BEGIN;

/* CREATE TABLE */
DROP TABLE IF EXISTS cadastre.elementsurfacique CASCADE;
CREATE TABLE cadastre.elementsurfacique (id serial NOT NULL);
SELECT setval('cadastre.elementsurfacique_id_seq', 100, true);
COMMENT ON TABLE cadastre.elementsurfacique IS 'elementsurfacique.';

ALTER TABLE cadastre.elementsurfacique ADD COLUMN genre        varchar(30) DEFAULT '' ;
ALTER TABLE cadastre.elementsurfacique ADD COLUMN qualite      varchar(10) DEFAULT '' ;

/* geometry */
SELECT AddGeometryColumn('cadastre', 'elementsurfacique', 'geometry', 21781, 'POLYGON', 2);
CREATE INDEX elementsurfacique_geoidx ON cadastre.elementsurfacique USING GIST ( geometry );


COMMIT;

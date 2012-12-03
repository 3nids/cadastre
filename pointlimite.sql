/*
	points limites
*/

BEGIN;

/* CREATE TABLE */
DROP TABLE IF EXISTS cadastre.pointlimite CASCADE;
CREATE TABLE cadastre.pointlimite (id serial NOT NULL);
SELECT setval('cadastre.pointlimite_id_seq', 100, true);
COMMENT ON TABLE cadastre.pointlimite IS 'pointlimite.';

/* columns */
ALTER TABLE cadastre.pointlimite ADD COLUMN numero       varchar(20) DEFAULT '' ;



/* geometry */
SELECT AddGeometryColumn('cadastre', 'pointlimite', 'geometry', 21781, 'POINT', 2);
CREATE INDEX pointlimite_geoidx ON cadastre.pointlimite USING GIST ( geometry );


COMMIT;

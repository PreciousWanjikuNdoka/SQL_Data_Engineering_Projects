--This is an idempotent script
-- .read Lessons\Lessons\1.21\1.21_DDL_DML_Prt1.sql

USE data_jobs;

DROP DATABASE IF EXISTS jobs_mart;

CREATE DATABASE IF NOT EXISTS jobs_mart;

SHOW DATABASES;



SELECT *
FROM information_schema.schemata;

USE jobs_mart;

CREATE SCHEMA IF NOT EXISTS staging;

--DROP SCHEMA staging;

CREATE TABLE IF NOT EXISTS staging.prefferd_roles(
    role_id INTEGER PRIMARY KEY,
    role_name VARCHAR
);

SELECT *
FROM information_schema.TABLES
WHERE table_catalog='jobs_mart';

INSERT INTO staging.prefferd_roles(role_id,role_name)
VALUES
    (1,'Data Engineer'),
    (2,'Senior Data Engineer'),
    (3,'Software Engineer');
    
SELECT *
FROM staging.prefferd_roles;

ALTER TABLE staging.prefferd_roles
ADD COLUMN prefferd_roles BOOLEAN;

UPDATE staging.prefferd_roles
SET prefferd_roles= true
WHERE role_id =1 OR role_id = 2;

UPDATE staging.prefferd_roles
SET prefferd_roles= false
WHERE role_id =3;

ALTER TABLE staging.prefferd_roles
RENAME to priority_roles;

SELECT *
FROM staging.priority_roles;

ALTER TABLE staging.priority_roles
RENAME COLUMN prefferd_roles TO priority_lvl;

ALTER TABLE staging.priority_roles
ALTER COLUMN priority_lvl TYPE INTEGER;

UPDATE staging.priority_roles
SET priority_lvl =3
WHERE role_id =3;

SELECT *
FROM staging.priority_roles;
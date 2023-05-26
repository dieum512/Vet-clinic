/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT * FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE (name IN ('Agumon') OR name IN ('Pikachu'));
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name NOT IN ('Gabumon');
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

/* Query and update animals table */

BEGIN;
SAVEPOINT SP1;
ALTER TABLE animals RENAME COLUMN species TO unspecified;
ROLLBACK TO SP1;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokeon' WHERE name NOT LIKE '%mon';
COMMIT;

BEGIN;
SAVEPOINT SP2;
DELETE FROM animals;
ROLLBACK TO SP2;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg = -5.7;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg = -45;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg = -12.13;
COMMIT;

SAVEPOINT SP3;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO SP3;

SELECT COUNT(name) FROM animals;
SELECT * FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, MAX(escape_attempts) FROM animals GROUP BY neutered;
SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;
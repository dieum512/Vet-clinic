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

-- querry multiple tables
SELECT name, full_name FROM animals JOIN owners ON owners.id = animals.owner_id WHERE full_name = 'Melody Pond';
SELECT a.name, s.name FROM animals a JOIN species s ON s.id = a.species_id WHERE species_id = 1;
SELECT o.*, name FROM owners o FULL JOIN animals a ON a.owner_id = o.id;
SELECT species_id,s.name, COUNT(species_id) FROM animals a JOIN species s ON s.id = a.species_id GROUP BY species_id, s.name;
SELECT full_name, a.name, s.name FROM animals a JOIN owners o ON a.owner_id = o.id JOIN species s ON s.id = a.species_id WHERE full_name = 'Jennifer Orwell' AND species_id = 2;
SELECT full_name, a.name,escape_attempts FROM animals a JOIN owners o ON a.owner_id = o.id WHERE full_name = 'Dean Winchester' AND escape_attempts > 0;
SELECT full_name, MAX(owner_count) FROM (SELECT full_name, COUNT(owner_id) AS owner_count FROM animals a JOIN owners o ON a.owner_id = o.id GROUP BY full_name, owner_id) AS subquery GROUP BY full_name;

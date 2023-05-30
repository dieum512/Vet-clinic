/* Database schema to keep the structure of entire database. */

CREATE TABLE animals(id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, name VARCHAR(50) 
NOT NULL, date_of_birth DATE NOT NULL, escape_attempts INT NOT NULL, neutered BOOLEAN NOT NULL, we
ight_kg DECIMAL);
ALTER TABLE animals ADD COLUMN species VARCHAR(100);

-- querry multiple tables
CREATE TABLE owners (id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, full_name VARCHAR(200), age INT);
CREATE TABLE species (id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, name VARCHAR(200));
ALTER TABLE animals DROP species;
ALTER TABLE animals ADD species_id INT;
ALTER TABLE animals ADD CONSTRAINT fk_species FOREIGN KEY (species_id) REFERENCES species(id) ON DELETE CASCADE;
ALTER TABLE animals ADD owner_id INT;
ALTER TABLE animals ADD CONSTRAINT fk_owners FOREIGN KEY (owner_id) REFERENCES owners(id) ON DELETE CASCADE;

-- Add join table for visits
CREATE TABLE vets (id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, name VARCHAR(200), age INT, date_of_graduation DATE);
CREATE TABLE specializations (species_id INT, vets_id INT);
CREATE TABLE visits (animals_id INT, vets_id INT, date_of_visit DATE);

-- database performance 
ALTER TABLE owners ADD COLUMN email VARCHAR(120);

/* Database schema to keep the structure of entire database. */

CREATE TABLE animals(id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, name VARCHAR(50) 
NOT NULL, date_of_birth DATE NOT NULL, escape_attempts INT NOT NULL, neutered BOOLEAN NOT NULL, we
ight_kg DECIMAL);
ALTER TABLE animals ADD COLUMN species VARCHAR(100);

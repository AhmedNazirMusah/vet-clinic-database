/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id NOT NULL PRIMARY KEY,
    name VARCHAR (50) NOT NULL,
    date_of_birth DATE NOT NULL,
    escape_attempts INT,
    neutered        BOOLEAN,
    weight_kg       DECIMAL,
);

ALTER TABLE animals ADD species VARCHAR;

CREATE TABLE owners (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    full_name VARCHAR(50),
    age INT
);

CREATE TABLE species (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(50)
);

-- Modify animals table

ALTER TABLE animals DROP COLUMN species;

ALTER TABLE animals ADD species_id INT, ADD CONSTRAINT species_id FOREIGN KEY(species_id) REFERENCES species(id);

ALTER TABLE animals ADD owners_id INT, ADD CONSTRAINT owners_id FOREIGN KEY(owners_id) REFERENCES owners(id);


-- vets table 

CREATE TABLE vets (
    id INT GENERATED ALWAYS AS IDENTITY,
    name varchar(100),
    age INT,
    date_of_graduation DATE,
    PRIMARY KEY(id)
);


-- specializations table

CREATE TABLE specializations (
    id INT GENERATED ALWAYS AS IDENTITY,
    vets_id INT,
    species_id INT,
    PRIMARY KEY(id),
    FOREIGN KEY(vets_id) REFERENCES vets (id) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY(species_id) REFERENCES species (id) ON DELETE RESTRICT ON UPDATE CASCADE
);


-- visits table

CREATE TABLE visits (
    id INT GENERATED ALWAYS AS IDENTITY,
    animals_id INT,
    vets_id INT,
    date_of_visit DATE,
    PRIMARY KEY(id),
    FOREIGN KEY (vets_id) REFERENCES vets (id) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (animals_id) REFERENCES animals (id) ON DELETE RESTRICT ON UPDATE CASCADE
);

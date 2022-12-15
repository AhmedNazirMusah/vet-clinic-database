/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Agumon','02/03/2020', 0 ,true, 10.23);  
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Gabumon','11/15/2018', 2 ,true, 8);   
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Pikachu','07/01/2021', 1 ,false, 15.04);    
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Devimon','05/12/2017', 5 ,true, 11);  
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Charmander', '02/08/2020', 0, false, -11);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Plantmon', '11/15/2021', 2, false, -5.7);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Squirtle', '04/02/1993', 3, false, -12.13);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Angemon', '06/12/2005', 1, true, -45);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Boarmon', '06/07/2005', 7, true, 20.4);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Blossom', '10/13/1998', 3, true, 17);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Ditto', '05/14/2022', 4, true, 22);

-- Inserting data into the owners table

INSERT INTO owners(full_name, age) VALUES('Sam Smith', 34);
INSERT INTO owners(full_name, age) VALUES('Jennifer Orwell', 19);
INSERT INTO owners(full_name, age) VALUES('Bob', 45);
INSERT INTO owners(full_name, age) VALUES('Melody Pond', 77);
INSERT INTO owners(full_name, age) VALUES('Dean Winchester', 14);
INSERT INTO owners(full_name, age) VALUES('Jodie Whittaker', 38);


-- Inserting data into species table
INSERT INTO species(name) VALUES('Pokemon');
INSERT INTO species(name) VALUES('Digimon');

--Modifying inserted animals so it includes the species_id value

UPDATE animals SET species_id = (SELECT id FROM species WHERE name = 'Digimon') WHERE name LIKE '%mon';
UPDATE animals SET species_id = (SELECT id FROM species WHERE name = 'Pokemon') WHERE species_id IS NULL;

-- Modifying inserted animals to include owner information (owner_id)

UPDATE animals SET owners_id = (SELECT id from owners WHERE full_name = 'Sam Smith') WHERE name = 'Agumon';
UPDATE animals SET owners_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell') WHERE name IN ('Gabumon', 'Pikachu');
UPDATE animals SET owners_id = (SELECT id FROM owners WHERE full_name = 'Bob') WHERE name IN ('Devimon', 'Plantmon');
UPDATE animals SET owners_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond') WHERE name IN ('Charmander', 'Squirtle', 'Blossom');
UPDATE animals SET owners_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester') WHERE name IN ('Angemon', 'Boarmon');


-- Inserting data into vets table

INSERT INTO vets(name, age, date_of_graduation) VALUES('William Tatcher', 45, '2000-04-23');
INSERT INTO vets(name, age, date_of_graduation) VALUES('Maisy Smith',26, '2019-01-17');
INSERT INTO vets(name, age, date_of_graduation) VALUES('Stephanie Mendez', 64, '1981-05-04');
INSERT INTO vets(name, age, date_of_graduation) VALUES('Jack Harkness', 38, '2008-06-08');

-- inserting data into specialties
INSERT INTO specializations(vets_id, species_id) VALUES (1, 1);
INSERT INTO specializations(vets_id, species_id) VALUES (3, 1);
INSERT INTO specializations(vets_id, species_id) VALUES (3, 2);
INSERT INTO specializations(vets_id, species_id) VALUES (4, 2);

-- inserting data into visits

INSERT INTO visits(vets_id, animals_id, date_of_visit) VALUES (1, 1, '2020-05-24');
INSERT INTO visits(vets_id, animals_id, date_of_visit) VALUES (3, 1, '2020-07-22');
INSERT INTO visits(vets_id, animals_id, date_of_visit) VALUES (4, 2, '2021-02-02');
INSERT INTO visits(vets_id, animals_id, date_of_visit) VALUES (3, 2, '2020-01-05');
INSERT INTO visits(vets_id, animals_id, date_of_visit) VALUES (3, 2, '2020-03-08');
INSERT INTO visits(vets_id, animals_id, date_of_visit) VALUES (3, 2, '2020-05-14');
INSERT INTO visits(vets_id, animals_id, date_of_visit) VALUES (3, 4, '2021-05-04');
INSERT INTO visits(vets_id, animals_id, date_of_visit) VALUES (4, 5, '2021-02-24');
INSERT INTO visits(vets_id, animals_id, date_of_visit) VALUES (2, 6, '2019-12-21');
INSERT INTO visits(vets_id, animals_id, date_of_visit) VALUES (1, 6, '2020-08-10');
INSERT INTO visits(vets_id, animals_id, date_of_visit) VALUES (2, 6, '2021-04-07');
INSERT INTO visits(vets_id, animals_id, date_of_visit) VALUES (3, 7, '2019-09-29');
INSERT INTO visits(vets_id, animals_id, date_of_visit) VALUES (4, 8, '2020-10-03');
INSERT INTO visits(vets_id, animals_id, date_of_visit) VALUES (4, 8, '2020-11-04');
INSERT INTO visits(vets_id, animals_id, date_of_visit) VALUES (2, 9, '2019-01-24');
INSERT INTO visits(vets_id, animals_id, date_of_visit) VALUES (2, 9, '2019-05-15');
INSERT INTO visits(vets_id, animals_id, date_of_visit) VALUES (2, 9, '2020-02-27');
INSERT INTO visits(vets_id, animals_id, date_of_visit) VALUES (2, 9, '2020-08-03');
INSERT INTO visits(vets_id, animals_id, date_of_visit) VALUES (3, 10, '2020-05-24');
INSERT INTO visits(vets_id, animals_id, date_of_visit) VALUES (1, 10, '2021-01-11');
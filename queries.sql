/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name LIKE '%mon%';
SELECT name FROM animals WHERE date_of_birth BETWEEN '01/01/2016' AND '01/01/2019';
SELECT * from animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name NOT IN ('Gabumon');
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3 OR weight_kg IN (10.4, 17.3);

-- update of tables 

-- How many animals are there?
SELECT COUNT(date_of_birth) FROM animals;

--How many animals have never tried to escape?
SELECT COUNT(date_of_birth) FROM animals WHERE escape_attempts = 0;

-- What is the average weight of animals?
SELECT AVG(weight_kg) FROM animals;

-- Who escapes the most, neutered or not neutered animals?
SELECT neutered, escape_attempts FROM animals
WHERE escape_attempts = (select MAX(escape_attempts) FROM animals);

-- What is the minimum and maximum weight of each type of animal?
SELECT species, MAX(weight_kg), MIN(weight_kg) FROM animals GROUP BY species;

SELECT species, AVG(escape_attempts) FROM animals 
WHERE date_of_birth > '01/01/1990' AND date_of_birth < '01/01/2000'
GROUP BY species;

-- All queries using JOIN:

-- What animals belong to Melody Pond?

SELECT animals.name FROM animals JOIN owners ON animals.owners_id = owners.id WHERE full_name='Melody Pond';

--List of all animals that are pokemon (their type is Pokemon).

SELECT animals.name FROM animals JOIN species ON animals.species_id = species.id WHERE species_id = 1;

--List all owners and their animals, remember to include those that don't own any animal.
SELECT animals.name,full_name FROM owners LEFT JOIN animals ON animals.owners_id=owners.id;

--How many animals are there per species?

SELECT species.name, COUNT(*) from animals JOIN species ON animals.species_id = species.id GROUP BY species.name;

--List all Digimon owned by Jennifer Orwell.
SELECT * FROM animals LEFT JOIN owners ON animals.owners_id = owners.id LEFT JOIN species ON animals.species_id = species.id 
WHERE owners.full_name = 'Jennifer Orwell' AND species.name = 'Digimon';

--List all animals owned by Dean Winchester that haven't tried to escape.

SELECT * FROM animals LEFT JOIN owners ON animals.owners_id = owners.id
WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;

--Who owns the most animals?

SELECT owners.full_name, COUNT(animals.name) AS total FROM owners LEFT JOIN animals ON animals.owners_id = owners.id 
GROUP BY owners.full_name ORDER BY total DESC LIMIT 1;

-- Who was the last animal seen by William Tatcher?

SELECT animals.name, visits.date_of_visit FROM animals JOIN visits ON animals.id = visits.animals_id 
JOIN vets ON vets.id = visits.vets_id WHERE vets.id = 1 ORDER BY date_of_visit DESC LIMIT 1;

-- How many different animals did Stephanie Mendez see?

SELECT COUNT(DISTINCT animals.name) FROM animals JOIN visits ON animals.id = visits.animals_id 
JOIN vets ON vets.id = visits.vets_id WHERE vets.id = 3;

-- List all vets and their specialties, including vets with no specialties.

SELECT vets.name, species.name FROM vets JOIN specializations ON vets.id = specializations.vets_id JOIN species
ON specializations.species_id = species.id;

-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT animals.name FROM animals JOIN visits ON animals.id = visits.animals_id JOIN vets
ON vets.id = visits.vets_id WHERE vets.id = 3 AND visits.date_of_visit >= '2020-04-01' AND visits.date_of_visit <= '2020-08-30';

-- What animal has the most visits to vets?

SELECT animals.name, COUNT(visits.date_of_visit) FROM animals JOIN visits
ON animals.id = visits.animals_id GROUP BY animals.name ORDER BY COUNT DESC LIMIT 1;

-- Who was Maisy Smith's first visit?

SELECT animals.name FROM animals JOIN visits ON animals.id = visits.animals_id JOIN vets  ON vets.id = visits.vets_id
WHERE vets.id = 2 ORDER BY visits.date_of_visit LIMIT 1;

-- Details for most recent visit: animal information, vet information, and date of visit.

SELECT * FROM animals JOIN visits ON animals.id = visits.animals_id FULL JOIN vets  ON vets.id = visits.vets_id
WHERE vets.id = 2 ORDER BY visits.date_of_visit DESC LIMIT 1;

-- How many visits were with a vet that did not specialize in that animal's species?

SELECT COUNT(*) FROM visits JOIN vets ON vets.id = visits.vets_id WHERE vets.id = 2;

-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.

SELECT species.name, COUNT(visits.animals_id) FROM visits JOIN vets ON visits.vets_id = vets.id FULL JOIN animals
ON visits.animals_id = animals.id JOIN species  ON species.id = animals.species_id WHERE vets.id = 2
GROUP BY species.name;
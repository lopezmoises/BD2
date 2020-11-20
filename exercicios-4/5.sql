SELECT film_id,title,description,length
FROM sakila.film
WHERE release_year = SOME (SELECT release_year FROM sakila.film WHERE length > 87);
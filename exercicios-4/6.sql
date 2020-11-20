SELECT film_id,title,description,length
FROM sakila.film
WHERE length > ALL (SELECT length FROM sakila.film WHERE rating = "NC-17");
SELECT actor.actor_id,first_name,last_name, COUNT(film_actor.film_id) AS Total_filmes
FROM sakila.actor
INNER JOIN sakila.film_actor on film_actor.actor_id = actor.actor_id
WHERE actor.actor_id = 100
GROUP BY actor.actor_id;
SELECT actor.actor_id,first_name,last_name, COUNT(film_actor.film_id) AS Total_filmes
FROM sakila.actor
INNER JOIN sakila.film_actor on film_actor.actor_id = actor.actor_id
GROUP BY actor.actor_id
ORDER BY Total_filmes ASC;
SELECT category_id,COUNT(category_id) AS Total_filmes
FROM sakila.film_category
GROUP BY category_id;
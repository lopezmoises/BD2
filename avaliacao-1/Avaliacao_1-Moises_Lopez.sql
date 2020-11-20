-- 1 --
SELECT customer_id, SUM(amount) AS total_pagamentos 
FROM sakila.payment 
WHERE customer_id IN (2,11,20,37) 
GROUP BY customer_id;
-- 2 --
SELECT customer.customer_id,customer.first_name,last_name,SUM(amount) AS total_pagamentos
FROM sakila.customer 
INNER JOIN sakila.payment ON payment.customer_id = customer.customer_id
WHERE customer.customer_id IN (2,11,20,37) 
GROUP BY customer_id;
-- 3 --
SELECT customer.customer_id,customer.first_name,last_name,SUM(amount) AS total_pagamentos
FROM sakila.customer 
INNER JOIN sakila.payment ON payment.customer_id = customer.customer_id
WHERE customer.first_name = 'ELLEN'
HAVING total_pagamentos BETWEEN 100 AND 125;
-- 4 --
SELECT category.category_id, category.name, AVG(film.length) AS Media_tempo
FROM sakila.category 
INNER JOIN sakila.film_category ON category.category_id = film_category.category_id
INNER JOIN sakila.film ON film_category.film_id = film.film_id  
GROUP BY category.category_id;
-- 5 --
SELECT category.category_id, category.name, AVG(film.length) AS Media_tempo
FROM sakila.category 
INNER JOIN sakila.film_category ON category.category_id = film_category.category_id
INNER JOIN sakila.film ON film_category.film_id = film.film_id  
GROUP BY category.category_id
HAVING Media_tempo BETWEEN 120 AND 130
ORDER BY Media_tempo DESC;
-- 6 --
SELECT country.country,city.city,customer.first_name,customer.last_name,customer.email,address.address,address.phone,address.postal_code
FROM sakila.customer
INNER JOIN sakila.address ON address.address_id = customer.address_id
INNER JOIN sakila.city ON city.city_id = address.city_id
INNER JOIN sakila.country ON country.country_id = city.country_id
WHERE country LIKE 'A%' OR country LIKE '%nada%';
-- 7 --
SELECT actor.actor_id,actor.first_name,actor.last_name,COUNT(film_actor.actor_id) AS Total_filmes
FROM sakila.actor 
INNER JOIN sakila.film_actor ON actor.actor_id = film_actor.actor_id
GROUP BY film_actor.actor_id 
ORDER BY Total_filmes DESC 
LIMIT 1;
-- 8 --
SELECT country.country,city.city,customer.first_name,customer.last_name,customer.email,address.address,address.phone,address.postal_code
FROM sakila.customer
INNER JOIN sakila.address ON address.address_id = customer.address_id
INNER JOIN sakila.city ON city.city_id = address.city_id
INNER JOIN sakila.country ON country.country_id = city.country_id
WHERE country LIKE 'A%' OR country LIKE '%nada%';
-- 9 --
SELECT country.country, city.city 
FROM sakila.country, sakila.city
WHERE country.country_id = city.country_id 
ORDER BY country DESC, city ASC;
-- 10 --
SELECT COUNT(*) 
FROM sakila.payment 
CROSS JOIN sakila.customer;
-- 11 -- 
-- 12 -- 
SELECT address.district,address.address,customer.first_name,customer.last_name,address.postal_code,address.phone
FROM (SELECT district,address,postal_code,phone FROM sakila.address WHERE city_id IN 
		(SELECT DISTINCT city_id FROM sakila.city WHERE country_id = 
			(SELECT country_id FROM sakila.country WHERE country = 'United States'))) AS address , 
	(SELECT first_name,last_name from sakila.customer) AS customer;
-- 13 --
SELECT staff.staff_id,staff.first_name,staff.last_name,COUNT(rental.staff_id) AS Alugueis 
FROM sakila.staff 
INNER JOIN sakila.rental ON rental.staff_id = staff.staff_id 
WHERE rental.rental_date BETWEEN "2005-07-29" AND "2005-07-30" 
GROUP BY sakila.staff.staff_id;
-- 14 --
SELECT film.film_id,film.title, COUNT(rental.inventory_id) AS Total_alugueis
FROM sakila.inventory
INNER JOIN sakila.rental ON rental.inventory_id = inventory.inventory_id
INNER JOIN sakila.film ON film.film_id = inventory.film_id
GROUP BY film_id
ORDER BY Total_alugueis DESC;

SELECT customer_id,first_name,last_name,email
FROM sakila.customer
WHERE address_id = (SELECT address.address_id FROM sakila.address WHERE phone = '657282285970');
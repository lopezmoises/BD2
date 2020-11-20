SELECT customer.first_name,customer.last_name,address.address,address.district,address.phone
FROM sakila.address, sakila.customer
WHERE address.address_id = customer.address_id;

SELECT customer.first_name,customer.last_name,address.address,address.district,address.phone
FROM sakila.address
JOIN sakila.customer ON address.address_id = customer.address_id;

SELECT customer.first_name,customer.last_name,address.address,address.district,address.phone
FROM sakila.address
JOIN sakila.customer USING (address_id);

SELECT customer.first_name,customer.last_name,address.address,address.district,address.phone
FROM sakila.address
NATURAL JOIN sakila.customer;
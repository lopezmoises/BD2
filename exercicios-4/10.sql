SELECT address.*,customer.* 
FROM sakila.address
RIGHT JOIN sakila.customer ON address.address_id = customer.address_id;
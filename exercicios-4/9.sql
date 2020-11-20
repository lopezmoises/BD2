SELECT address.*,customer.* 
FROM sakila.address
LEFT JOIN sakila.customer ON address.address_id = customer.address_id;
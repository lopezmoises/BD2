-- Dado a que no se puede utiizar FULL JOIN en MySql, utilizamos esta sentencia:
SELECT address.*,customer.* 
FROM sakila.address
LEFT JOIN sakila.customer ON address.address_id = customer.address_id
UNION
SELECT address.*,customer.* 
FROM sakila.address
RIGHT JOIN sakila.customer ON address.address_id = customer.address_id;
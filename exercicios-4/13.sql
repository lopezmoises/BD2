-- Dado a que no se puede utiizar INTERSECT en MySql, utilizamos esta sentencia:
SELECT first_name
FROM sakila.customer
WHERE active = 1 AND first_name IN (SELECT first_name FROM sakila.staff WHERE active = 1);

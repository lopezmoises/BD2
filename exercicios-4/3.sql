SELECT address_id,address,district,postal_code
FROM sakila.address
WHERE (address_id,district) IN (SELECT address_id,district FROM sakila.address WHERE district = "Alberta")
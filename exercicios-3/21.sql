SELECT customer.customer_id,first_name,last_name, SUM(payment.amount) AS Total_pagamentos
FROM sakila.customer
INNER JOIN sakila.payment on payment.customer_id = customer.customer_id
GROUP BY customer.customer_id;
SELECT staff.staff_id,first_name,last_name, SUM(payment.amount) AS Total_cobrancas
FROM sakila.staff
INNER JOIN sakila.payment on payment.staff_id = staff.staff_id
GROUP BY staff.staff_id;
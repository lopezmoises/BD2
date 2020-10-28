SELECT first_name,last_name,salaries.salary,salaries.from_date,salaries.to_date FROM psdb.employees
INNER JOIN psdb.salaries ON salaries.emp_no = employees.emp_no
WHERE employees.emp_no = 10006
ORDER BY salaries.from_date
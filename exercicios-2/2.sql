SELECT first_name,last_name,departments.dept_name,dept_emp.from_date,dept_emp.to_date 
FROM psdb.employees
INNER JOIN psdb.dept_emp ON dept_emp.emp_no = employees.emp_no
INNER JOIN psdb.departments ON departments.dept_no = dept_emp.dept_no

SELECT first_name,last_name,departments.dept_name FROM psdb.employees
LEFT JOIN psdb.dept_manager ON dept_manager.emp_no = employees.emp_no
LEFT JOIN psdb.departments ON departments.dept_no = dept_manager.dept_no
WHERE employees.emp_no = 110022 OR employees.emp_no = 110085 OR employees.emp_no = 10006 
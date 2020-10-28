INSERT INTO psdb.departments VALUES ('d99','Compras internas');
----------------------------------------------------------------
SELECT first_name,last_name,departments.dept_name
FROM psdb.employees
RIGHT JOIN psdb.dept_manager ON dept_manager.emp_no = employees.emp_no
RIGHT JOIN psdb.departments ON departments.dept_no = dept_manager.dept_no;

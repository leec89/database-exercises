use employees;
use departments;
use dept_emp;
use title;

SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM employees LIMIT 10;

SELECT CONCAT(emp_no, ' - ', last_name, ', ', first_name) AS full_name, birth_date AS DOB FROM employees LIMIT 10;

SELECT e.emp_no, CONCAT(e.first_name, ' ', e.last_name) AS full_name, s.salary, e.hire_date
FROM employees e LEFT JOIN salaries s
                           ON e.emp_no = s.emp_no
WHERE s.to_date LIKE '9999%' order by salary DESC;
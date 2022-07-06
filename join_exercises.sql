use employees;
use departments;
use dept_emp;
use title;
use salaries;

# (2) Find department along with the name of the current manager for that department.

SELECT d.dept_name AS 'Department Name', concat(e.first_name, ' ', e.last_name) AS 'Department Manager'
FROM employees e
         JOIN dept_manager dm ON dm.emp_no = e.emp_no
         JOIN departments d ON d.dept_no = dm.dept_no
WHERE dm.to_date LIKE '9999%'
ORDER BY d.dept_name;

# (1) Find the name of all departments currently managed by women.

SELECT d.dept_name AS 'Department Name', concat(e.first_name, ' ', e.last_name) AS 'Department Manager'
FROM employees e
         JOIN dept_manager dm ON dm.emp_no = e.emp_no
         JOIN departments d ON d.dept_no = dm.dept_no
WHERE dm.to_date LIKE '9999%' AND e.gender = 'f'
ORDER BY d.dept_name;

# (1) Find the current titles of employees currently working in the Customer Service department.

SELECT t.title AS 'title', count(*) AS 'Total'
FROM employees e
         JOIN titles t on e.emp_no = t.emp_no
         JOIN dept_emp de on e.emp_no = de.emp_no
         JOIN departments d on de.dept_no = d.dept_no
WHERE d.dept_name = 'Customer Service' AND t.to_date > NOW() AND de.to_date > NOW()
group by t.title
order by count(*) DESC;

# (1) Find the current salary of all current managers.

SELECT dm.to_date, d.dept_name AS 'Department Name', concat(e.first_name, ' ', e.last_name) AS 'Department Manager', s.salary AS 'Salary'
FROM employees e
         JOIN salaries s ON e.emp_no = s.emp_no
         JOIN dept_manager dm ON dm.emp_no = e.emp_no
         JOIN departments d ON d.dept_no = dm.dept_no
WHERE s.to_date > NOW() AND dm.to_date > NOW()
ORDER BY d.dept_name;

SELECT CONCAT(e.first_name, ' ', e.last_name) AS 'Employee', d.dept_name AS 'Department', CONCAT(e.first_name, ' ', e.last_name) AS 'Manager'
FROM employees e
         LEFT JOIN departments d on e.emp_no = d.dept_name;
use employees;
use departments;
use dept_emp;
use title;
use salaries;
use dept_manager;

SELECT first_name, last_name, birth_date
FROM employees
WHERE emp_no IN (
    SELECT emp_no
    FROM dept_manager
)
LIMIT 10;

SELECT * FROM employees
WHERE hire_date IN (
    SELECT hire_date
    FROM employees e
    WHERE e.emp_no = 101010
);

SELECT * FROM employees
WHERE birth_date = '1957-08-11';

SELECT t.title AS 'title', count(*) AS 'Total'
FROM employees e
         JOIN titles t on e.emp_no = t.emp_no
WHERE first_name IN (
    SELECT first_name
    FROM employees
    WHERE first_name = 'Aamod'
)
group by t.title
order by count(*) DESC;

SELECT count(*)
FROM titles t
WHERE t.emp_no IN (
    SELECT e.emp_no
    FROM employees e
    WHERE first_name = 'Aamod'
);

SELECT *
FROM employees
WHERE first_name = 'Aamod';


SELECT first_name, last_name
from employees e
where e.gender = 'F' AND e.emp_no IN (
    SELECT dm.emp_no
    FROM dept_manager dm
    WHERE to_date > NOW()
);

SELECT d.dept_name
FROM departments d
         JOIN dept_emp de on d.dept_no = de.dept_no
         JOIN employees e on de.emp_no = e.emp_no
         JOIN dept_manager dm on e.emp_no = dm.emp_no
where e.gender = 'F' AND dm.to_date > NOW()
group by d.dept_name;


SELECT d.dept_name
FROM departments d
WHERE d.dept_no IN (
    SELECT dm.dept_no
    FROM dept_manager dm
    WHERE dm.to_date > NOW() AND dm.emp_no IN (
        SELECT e.emp_no
        FROM employees e
        WHERE e.gender = 'F'
    )
)
group by d.dept_name;
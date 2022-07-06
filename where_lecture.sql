use employees;
use departments;
use dept_emp;
use title;

# WHERE EXERCISE

SELECT * FROM employees WHERE last_name LIKE '%ing';

SELECT * FROM employees WHERE hire_date < '1991-02-07';

SELECT * FROM employees WHERE hire_date = '1985-01-01';

SELECT * FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya');     # 709 results

SELECT * FROM employees WHERE last_name LIKE 'E%';  # 7330 results (case insensitive with LIKE!)

SELECT * FROM employees WHERE last_name LIKE '%q%';     # 1873 results (case insensitive with LIKE!)

SELECT * FROM employees WHERE last_name LIKE 's%ue';     # 194 results (starts with 's', ends with 'ue')

SELECT * FROM employees WHERE first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya';

SELECT * FROM employees WHERE gender = 'M' AND first_name IN ('Irena', 'Vidya', 'Maya');    # 441 results

SELECT * FROM employees WHERE (last_name LIKE 'E%') OR (last_name LIKE '%E');   # 30723 results

SELECT * FROM employees WHERE (last_name LIKE '%q%') AND (last_name NOT LIKE '%qu%');   # 547 results

# ORDER BY EXERCISES

SELECT * FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya') ORDER BY first_name;     # 709 results

SELECT * FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya') ORDER BY first_name, last_name;     # 709 results

SELECT * FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya') ORDER BY last_name, first_name;     # 709 results

SELECT * FROM employees WHERE (last_name LIKE 'E%') OR (last_name LIKE '%E') ORDER BY emp_no DESC;   # 30723 results

# LIMIT EXERCISE

SELECT DISTINCT last_name FROM employees WHERE last_name LIKE 'z%' ORDER BY last_name DESC LIMIT 10;

SELECT * FROM salaries ORDER BY salary DESC;

SELECT * FROM salaries WHERE to_date LIKE '9999%' ORDER BY salary DESC;

SELECT * FROM salaries WHERE to_date LIKE '9999%' ORDER BY salary DESC LIMIT 5;

SELECT * FROM salaries ORDER BY salary DESC LIMIT 5;

SELECT * FROM salaries ORDER BY salary DESC LIMIT 5 OFFSET 45;

# FUNCTIONS EXERCISE

SELECT WEEKDAY(NOW());

SELECT first_name from employees order by first_name;   # 300024 results

SELECT first_name from employees group by first_name;   # 1275 results

SELECT DISTINCT first_name from employees order by first_name;  # 1275 results

SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM employees  WHERE (last_name LIKE 'E%') OR (last_name LIKE '%E');

SELECT * FROM employees limit 25;

SELECT * FROM employees WHERE month(birth_date) = 12
                          AND day(birth_date) = 25;

SELECT * FROM employees WHERE year(hire_date) BETWEEN 1990 AND 1999
                            AND month(birth_date) = 12
                            AND day(birth_date) = 25;

SELECT * FROM employees WHERE year(hire_date) BETWEEN 1990 AND 1999
                          AND birth_date LIKE '%12-25%';


SELECT *, DATEDIFF(hire_date, birth_date) from employees WHERE year(hire_date) BETWEEN 1990 AND 1999
                                                        AND birth_date LIKE '%12-25%';

SELECT CONCAT(first_name, ' ', last_name) AS full_name, DATEDIFF(curdate(), hire_date) AS number_days from employees WHERE year(hire_date) BETWEEN 1990 AND 1999
                                                           AND birth_date LIKE '%12-25%' ORDER BY number_days DESC;

SELECT * FROM employees WHERE year(hire_date) BETWEEN 1990 AND 1999
                          AND birth_date LIKE '%12-25%' ORDER BY hire_date, birth_date;

SELECT *, DATEDIFF(CURDATE(), hire_date)
FROM employees
WHERE year (hire_date) BETWEEN 1990 AND 2000 AND birth_date LIKE '%-12-25%';

# GROUP BY EXERCISE

SELECT DISTINCT title FROM titles;

SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM employees  WHERE (last_name LIKE 'E%') OR (last_name LIKE '%E') GROUP BY last_name;

SELECT last_name
FROM employees
WHERE (last_name LIKE 'E%') AND (last_name LIKE '%E')
GROUP BY last_name;

SELECT first_name, last_name
FROM employees
WHERE (last_name LIKE 'E%') AND (last_name LIKE '%E')
GROUP BY first_name, last_name;

SELECT DISTINCT first_name, last_name
FROM employees
WHERE last_name LIKE '%E' AND last_name LIKE 'E%'
GROUP BY first_name, last_name
ORDER BY first_name, last_name;

SELECT COUNT(*), last_name FROM employees
        WHERE (last_name LIKE '%q%') AND (last_name NOT LIKE '%qu%')
        GROUP BY last_name;   # 547 results

SELECT COUNT(*), gender FROM employees
         WHERE first_name IN ('Irena', 'Vidya', 'Maya')
         GROUP BY gender;

# ALIAS EXERCISE

SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM employees LIMIT 10;

SELECT CONCAT(emp_no, ' - ', last_name, ', ', first_name) AS full_name, birth_date AS DOB FROM employees LIMIT 10;

SELECT e.emp_no, CONCAT(e.first_name, ' ', e.last_name) AS full_name, s.salary, e.hire_date
    FROM employees e LEFT JOIN salaries s
    ON e.emp_no = s.emp_no
    WHERE s.to_date LIKE '9999%' order by salary DESC;


DESCRIBE employees;
DESCRIBE departments;
DESCRIBE dept_emp;
DESCRIBE dept_manager;
DESCRIBE salaries;
DESCRIBE titles;

SELECT * from employees;
SELECT * from departments;
SELECT * from dept_emp;
SELECT * from dept_manager;
SELECT * from salaries;
SELECT * from titles;

# JOINS - Employees Database exercises
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

# SUB-QUERY EXERCISE

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
WHERE birth_date = '1957-08-11'

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
use employees;

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



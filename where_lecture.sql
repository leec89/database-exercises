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

SELECT WEEKDAY(NOW());

SELECT first_name from employees order by first_name;   # 300024 results

SELECT first_name from employees group by first_name;   # 1275 results

SELECT DISTINCT first_name from employees order by first_name;  # 1275 results


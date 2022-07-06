use employees;

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
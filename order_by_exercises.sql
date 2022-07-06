use employees;

SELECT * FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya') ORDER BY first_name;     # 709 results

SELECT * FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya') ORDER BY first_name, last_name;     # 709 results

SELECT * FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya') ORDER BY last_name, first_name;     # 709 results

SELECT * FROM employees WHERE (last_name LIKE 'E%') OR (last_name LIKE '%E') ORDER BY emp_no DESC;   # 30723 results
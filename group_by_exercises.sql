use employees;
use titles;

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
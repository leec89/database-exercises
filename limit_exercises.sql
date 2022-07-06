use employees;

SELECT DISTINCT last_name FROM employees WHERE last_name LIKE 'z%' ORDER BY last_name DESC LIMIT 10;

SELECT * FROM salaries ORDER BY salary DESC;

SELECT * FROM salaries WHERE to_date LIKE '9999%' ORDER BY salary DESC;

SELECT * FROM salaries WHERE to_date LIKE '9999%' ORDER BY salary DESC LIMIT 5;

SELECT * FROM salaries ORDER BY salary DESC LIMIT 5;

SELECT * FROM salaries ORDER BY salary DESC LIMIT 5 OFFSET 45;

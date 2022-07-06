use employees;

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



SELECT COUNT(*), gender AS "Employee Count With Gender"
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
GROUP BY gender;


SELECT concat(first_name, " ", last_name) AS "full name"
FROM employees
WHERE last_name LIKE 'e%e';

SELECT first_name, last_name, datediff(now(), hire_date) AS "number of days employed"
FROM employees
WHERE birth_date like '%12-25'
AND hire_date BETWEEN '1990-01-01' and '1999-12-31';

SELECT emp_no, first_name, last_name
FROM employees
WHERE birth_date LIKE '%12-25%';

SELECT concat(first_name, " ", last_name) AS "full_name", count(first_name) AS "number of people with this name"
FROM employees
WHERE last_name LIKE '%q%'
AND last_name NOT LIKE '%qu%'
GROUP BY full_name
ORDER BY `number of people with this name` DESC;
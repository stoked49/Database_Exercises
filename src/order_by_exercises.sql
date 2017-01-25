SELECT emp_no, first_name, last_name
FROM employees
WHERE gender = 'M' AND (first_name IN ('Irena', 'Vidya') OR first_name = 'Maya');

SELECT emp_no, first_name, last_name
FROM employees
WHERE last_name IN ('E');

SELECT emp_no, first_name, last_name
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31'
      AND (birth_date LIKE '%12-25%');

SELECT emp_no, first_name, last_name
FROM employees
WHERE birth_date LIKE '%12-25%';

SELECT emp_no, first_name, last_name
FROM employees
WHERE last_name LIKE '%q%'
      AND NOT last_name LIKE '%qu%';
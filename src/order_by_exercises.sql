SELECT emp_no, first_name, last_name
FROM employees
WHERE gender = 'M' AND (first_name IN ('Irena', 'Vidya') OR first_name = 'Maya')
ORDER BY last_name DESC, first_name DESC;

SELECT emp_no, first_name, last_name
FROM employees
WHERE last_name LIKE 'e%'
  AND last_name like '%e'
ORDER BY emp_no DESC;

SELECT emp_no, first_name, last_name, birth_date
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31'
      AND (birth_date LIKE '%12-25%')
ORDER BY birth_date ASC, hire_date DESC;

SELECT emp_no, first_name, last_name
FROM employees
WHERE birth_date LIKE '%12-25%';

SELECT emp_no, first_name, last_name
FROM employees
WHERE last_name LIKE '%q%'
      AND NOT last_name LIKE '%qu%';
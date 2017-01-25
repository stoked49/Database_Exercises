SELECT title
from titles
GROUP BY title;
SELECT DISTINCT title
FROM titles
ORDER BY title;
SELECT last_name
FROM employees
WHERE last_name LIKE 'e%'
      AND last_name like '%e'
GROUP BY last_name;
SELECT first_name, last_name
FROM employees
WHERE last_name LIKE 'e%'
      AND last_name like '%e'
GROUP BY first_name, last_name;
SELECT last_name
FROM employees
WHERE last_name LIKE '%q%'
      AND NOT last_name LIKE '%qu%'
GROUP BY last_name;

CREATE DATABASE IF NOT EXISTS join_test_db;

CREATE TABLE roles (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE users (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL,
  role_id INT UNSIGNED DEFAULT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (role_id) REFERENCES roles (id)
);

INSERT INTO roles (name) VALUES ('admin');
INSERT INTO roles (name) VALUES ('author');
INSERT INTO roles (name) VALUES ('reviewer');
INSERT INTO roles (name) VALUES ('commenter');

INSERT INTO users (name, email, role_id) VALUES
  ('bob', 'bob@example.com', 1),
  ('joe', 'joe@example.com', 2),
  ('sally', 'sally@example.com', 3),
  ('adam', 'adam@example.com', 3),
  ('jane', 'jane@example.com', null),
  ('mike', 'mike@example.com', null);

INSERT INTO users (name, email, role_id) VALUES
  ('kevin', 'kevin@example.com', null),
  ('haley', 'haley@example.com', 2),
  ('vanessa', 'vanessa@example.com', 2),
  ('abdou', 'abdou@example.com', 2);

SELECT users.name AS user_name, roles.name AS role_name
FROM users
  JOIN roles ON users.role_id = roles.id;

SELECT users.name AS user_name, roles.name AS role_name
FROM users
LEFT JOIN roles ON users.role_id = roles.id;

SELECT users.name AS user_name, roles.name AS role_name
FROM users
RIGHT JOIN roles ON users.role_id = roles.id;

SELECT users.name AS user_name, roles.name AS role_name, COUNT(users.name)
FROM users
  RIGHT JOIN roles ON users.role_id = roles.id
GROUP BY roles.name;

USE employees;
SELECT CONCAT(employees.first_name, " ", employees.last_name) AS "current manager", dept_name
FROM departments
JOIN dept_manager ON dept_manager.dept_no = departments.dept_no
JOIN employees ON dept_manager.emp_no = employees.emp_no
WHERE dept_manager.to_date > curdate()
ORDER BY departments.dept_name;

SELECT CONCAT(employees.first_name, " ", employees.last_name) AS "current manager", dept_name
FROM departments
  JOIN dept_manager ON dept_manager.dept_no = departments.dept_no
  JOIN employees ON dept_manager.emp_no = employees.emp_no
WHERE dept_manager.to_date > curdate() AND employees.gender = 'F'
ORDER BY departments.dept_name;

SELECT *
FROM titles
JOIN employees ON titles.emp_no = employees.emp_no
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = "Customer Service"
AND dept_emp.to_date > curdate()
AND titles.to_date > curdate()
GROUP BY title;

SELECT salary, employees.first_name, employees.last_name
FROM salaries
JOIN employees ON salaries.emp_no = employees.emp_no
  JOIN dept_manager ON employees.emp_no = dept_manager.emp_no
JOIN departments ON dept_manager.dept_no = departments.dept_no
WHERE dept_manager.to_date > curdate()
AND salaries.to_date > curdate();

SELECT *
FROM employees AS e
JOIN dept_emp ON e.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
JOIN dept_manager ON departments.dept_no = dept_manager.dept_no
JOIN employees AS managers ON dept_manager.emp_no = managers.emp_no
WHERE dept_emp.to_date > curdate()
AND dept_manager.to_date > curdate();

CREATE TABLE department (
	dept_no VARCHAR(255) PRIMARY KEY,
	dept_name VARCHAR(255)
)
SELECT * FROM department

-- DROP TABLE dept_manager
CREATE TABLE dept_manager (
	dept_no VARCHAR(255),
	emp_no INT,
	FOREIGN KEY (emp_no) REFERENCES employees(employee_no),
	FOREIGN KEY (dept_no) REFERENCES department(dept_no)
)
SELECT * FROM dept_manager

CREATE TABLE employees(
	employee_no INT PRIMARY KEY,
	emp_title_id VARCHAR(255),
	birth_date DATE,
	first_name VARCHAR(255),
	last_name VARCHAR(255),
	sex VARCHAR(1),
	hire_date DATE,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
)
SELECT * FROM employees

-- DROP TABLE dept_emp
CREATE TABLE dept_emp(
	emp_no INT,
	dept_no VARCHAR(255),
	FOREIGN KEY (dept_no) REFERENCES department(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(employee_no)
)	
SELECT * FROM dept_emp

CREATE TABLE titles(
	title_id VARCHAR(255) PRIMARY KEY,
	title VARCHAR(255)
)
SELECT * FROM titles


CREATE TABLE salaries(
	emp_no INT,
	salary INT,
 	FOREIGN KEY (emp_no) REFERENCES employees(employee_no)
	)
SELECT * FROM 	salaries
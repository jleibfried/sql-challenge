-- List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT employee_no, last_name, first_name, sex, s.salary
FROM employees e
JOIN salaries s
ON (s.emp_no = e.employee_no);

-- List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, sex, hire_date
FROM employees
WHERE EXTRACT(YEAR from hire_date)=1986;


-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT emp_no -- This in my mind is "listing the manager".  It's unclear if you want name or id or what
FROM dept_manager dm
JOIN department dpt
ON (dm.dept_no=dpt.dept_no)
JOIN employees e 
ON (dm.emp_no = e.employee_no)
WHERE (e.last_name IS NOT NULL 
	   AND e.first_name IS NOT NULL 
	   AND dpt.dept_name IS NOT NULL);
 
-- List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT dpt.dept_name, e.employee_no
FROM department dpt
JOIN dept_emp
ON (dept_emp.dept_no=dpt.dept_no)
JOIN employees e 
ON (dept_emp.emp_no=e.employee_no)
WHERE (e.last_name IS NOT NULL 
	   AND e.first_name IS NOT NULL 
	   AND dpt.dept_name IS NOT NULL);


-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM employees
WHERE (first_name='Hercules'
	  AND LEFT(last_name,1)='B');

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.employee_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN dept_emp ON (dept_emp.emp_no=e.employee_no)
JOIN department d ON (d.dept_no=dept_emp.dept_no)
WHERE d.dept_name='Sales';


-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.employee_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN dept_emp ON (dept_emp.emp_no=e.employee_no)
JOIN department d ON (d.dept_no=dept_emp.dept_no)
WHERE (d.dept_name='Sales'
	   OR d.dept_name='Development');

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, count(*) AS number_of_surnames 
FROM employees 
GROUP BY 1
ORDER BY number_of_surnames DESC;

-- Epilogue
SELECT * 
FROM employees
WHERE employee_no = 499942;
-- I'm April Foolsday and I'm from the future?!?!?

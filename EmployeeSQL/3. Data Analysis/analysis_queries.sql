--List the employee number, last name, first name, sex, and salary of each employee
SELECT A.emp_no, A.last_name, A.first_name, A.sex, B.salary AS salary
FROM employees AS A
JOIN salaries AS B ON A.emp_no = B.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

--List the manager of each department along with their department number, department name, employee number, last name, and first name
SELECT A.dept_no, B.dept_name, C.emp_no, C.last_name, C.first_name
FROM dept_manager AS A
JOIN departments AS B ON A.dept_no = B.dept_no
JOIN employees AS C ON C.emp_no = A.emp_no;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name
SELECT A.dept_no, A.emp_no, B.last_name, B.first_name, C.dept_name
FROM dept_emp AS A
JOIN employees AS B ON A.emp_no = B.emp_no
JOIN departments AS C on A.dept_no = C.dept_no

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'

--List each employee in the Sales department, including their employee number, last name, and first name
SELECT C.emp_no, C.last_name, C.first_name
FROM dept_emp AS A
JOIN departments AS B ON A.dept_no = B.dept_no
JOIN employees AS C ON A.emp_no = C.emp_no
WHERE B.dept_name = 'Sales'

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT C.emp_no, C.last_name, C.first_name, B.dept_name
FROM dept_emp AS A
JOIN departments AS B ON A.dept_no = B.dept_no
JOIN employees AS C ON A.emp_no = C.emp_no
WHERE B.dept_name = 'Sales' OR B.dept_name = 'Development'

--List the frequency counts, in descending order, of all the employee last names
SELECT last_name, COUNT(*) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC
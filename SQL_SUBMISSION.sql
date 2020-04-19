-- Created Tables 
CREATE TABLE departments (
	dept_no VARCHAR,
	dept_name VARCHAR
);

CREATE TABLE dept_emp (
	emp_no INT,
	dept_no varchar,
	from_date DATE,
	to_date DATE
);

CREATE TABLE dept_manager (
	dept_no VARCHAR,
	emp_no INT,
	from_date DATE,
	to_date DATE
);

CREATE TABLE employees (
	emp_no INT,
	birth_date DATE,
	first_name VARCHAR, 
	last_name VARCHAR,
	gender VARCHAR,
	hire_date DATE	
);

CREATE TABLE salaries (
	emp_no INT,
	salary INT,
	from_date DATE,
	to_date DATE
);

CREATE TABLE titles (
	emp_no INT,
	title VARCHAR,
	from_date DATE,
	to_date DATE 
);

-- Question 1
select employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary
from employees
join salaries
on (employees.emp_no=salaries.emp_no)

-- Question 2
select * from employees
where hire_date >= '1986-01-01' and hire_date <= '1986-12-31';

-- Question 3
select * from dept_manager

select d.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name, dm.from_date, dm.to_date
from departments d
join dept_manager dm
on d.dept_no = dm.dept_no
join employees e
on dm.emp_no = e.emp_no;


-- Question 4 
select dept_emp.emp_no, employees.first_name, employees.last_name, departments.dept_name
from departments
join dept_emp
on departments.dept_no = dept_emp.dept_no
join employees
on dept_emp.emp_no = employees.emp_no

-- Question 5
select * from employees
where first_name = 'Hercules' and last_name like 'B%'

-- Question 6 
select departments.dept_no, departments.dept_name, dept_emp.emp_no, employees.first_name, employees.last_name
from departments
join dept_emp
on departments.dept_no = dept_emp.dept_no
join employees
on employees.emp_no = dept_emp.emp_no
where dept_name = 'Sales'

-- Question 7
select departments.dept_no, departments.dept_name, dept_emp.emp_no, employees.first_name, employees.last_name
from departments
join dept_emp
on departments.dept_no = dept_emp.dept_no
join employees
on employees.emp_no = dept_emp.emp_no
where dept_name = 'Sales' or dept_name = 'Development'

-- Question 8
select count (last_name) as "name_count", last_name from employees
group by last_name
order by name_count desc







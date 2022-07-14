CREATE TABLE employees (
	emp_no INT NOT NULL,
     birth_date DATE NOT NULL,
     first_name VARCHAR NOT NULL,
     last_name VARCHAR NOT NULL,
     gender VARCHAR NOT NULL,
     hire_date DATE NOT NULL,
     PRIMARY KEY (emp_no)
);

SELECT employees.emp_no,
employees.first_name,
employees.last_name,
titles.title,
titles.from_date,
titles.to_date
INTO retirement_titles
FROM employees
INNER JOIN titles
ON (employees.emp_no = titles.emp_no)
WHERE (employees.birth_date BETWEEN '01/01/52' AND '12/31/55')
ORDER BY emp_no ASC;


select * from retirement_titles


S-- Use Dictinct with Orderby to remove duplicate rows

SELECT DISTINCT ON (retirement_titles.emp_no) retirement_titles.emp_no,
retirement_titles.first_name,
retirement_titles.last_name,
retirement_titles.title

INTO unique_titles
FROM retirement_titles
WHERE retirement_titles.to_date = '1/1/99'
ORDER BY emp_no asc,to_date DESC;


-- retiring titles
select COUNT(title), title from unique_titles
group by title
order by count(title) desc



-- Deliverable 2 
CREATE TABLE dept_emp(
	emp_no INT NOT NULL,
    dept_no VARCHAR NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL
);

Select distinct on (employees.emp_no) employees.emp_no,
employees.first_name,
employees.last_name,
employees.birth_date,
dept_emp.from_date,
dept_emp.to_date,
titles.title
from employees INNER JOIN dept_emp
on (employees.emp_no = dept_emp.emp_no)
INNER JOIN titles on (employees.emp_no = titles.emp_no)
where (employees.birth_date BETWEEN '1/1/65' AND '12/31/65')
AND (dept_emp.to_date = '1/1/9999')
order by employees.emp_no;
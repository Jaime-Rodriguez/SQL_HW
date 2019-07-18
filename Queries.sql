-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.

select E.emp_no "Employee Number", E.last_name "Last Name", 
E.first_name "First Name", E.Gender "Gender", S.Salary "Salary"
from public."Employees" E inner join public."Salaries" S on E.emp_no = S.emp_no
order by 1;

-- 2. List employees who were hired in 1986.

select * from public."Employees" E where extract(year from E.hire_date) = 1986;

-- 3. List the manager of each department with the following information: department number, 
-- department name, the manager's employee number, last name, first name, and start and end employment dates

select D.dept_name "Department Name", DM.emp_no "Manager's Emp Number", E.last_name "Last Name", 
E.first_name "First Name", DM.from_date "Start Employement Date", DM.to_date "End Employment Date" 
from public."Dept_Manager" DM inner join public."Employees" E on DM.emp_no = E.emp_no 
inner join public."Departments" D on DM.dept_no = D.dept_no;

-- 4. List the department of each employee with the following information: employee number, last name, 
-- first name, and department name.

select E.emp_no "Employee Number", E.last_name "Last Name", E.first_name "First Name", 
D.dept_name "Department Name"
from public."Employees" E inner join public."Dept_Emp" DE on E.emp_no = DE.emp_no
inner join public."Departments" D on DE.dept_no = D.dept_no;

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."

select * from public."Employees" E where E.first_name = 'Hercules' and E.last_name like 'B%'; 

-- 6. List all employees in the Sales department, including their employee number, last name, 
-- first name, and department name.

select E.emp_no "Employee Number",E.last_name "Last Name",E.first_name "First Name",
D.dept_name "Department Name"
from public."Employees" E inner join public."Dept_Emp" DE on E.emp_no = DE.emp_no
inner join public."Departments" D on DE.dept_no = D.dept_no
where D.dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, including their employee number, 
-- last name, first name, and department name.

select E.emp_no "Employee Number",E.last_name "Last Name",E.first_name "First Name",
D.dept_name "Department Name"
from public."Employees" E inner join public."Dept_Emp" DE on E.emp_no = DE.emp_no
inner join public."Departments" D on DE.dept_no = D.dept_no
where D.dept_name in ('Sales','Development');

-- 8. In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name.

select E.last_name "Last Name",count(*) "Total Count"
from public."Employees" E 
group by E.last_name
order by 2 desc

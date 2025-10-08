-- DDL (Data Definition Language)

		-- Syntax
		
		-- CREATE TABLE <table_name> (
		-- 	col1_name <data_type>,
		-- 	col2_name <data_type>,
		-- 	col3_name <data_type>
		-- 	);

create table employees (
	emp_id int primary key,
	emp_name char(50),
	age int,
	department varchar(50),
	salary int,
	hire_date date
);

------------------------------------------

-- DML (Data Manipulation Language)

	--syntax
	--insert into <table_name> (col1_name,col2_name,col3_name,...)
	--values (val_col1_1,val-col2_1,val-col3_1,...),
	--		 (val_col1_2,val-col2_2,val-col3_2,...);

insert into employees (emp_id,emp_name,age,department,salary,hire_date)
values (2,'Steve',20,'Finance',10000,'2022-05-13'),
	   (3,'Bob',35,'IT',20000,'2022-05-11'),
	   (4,'Charlie',28,'Marketing',50000,'2022-06-01'),
	   (5,'David',40,'HR',70000,'2022-06-15'),
	   (6,'Eva',25,'Finance',12000,'2022-07-10'),
	   (7,'Frank',32,'Marketing',45000,'2022-08-01'),
	   (8,'Grace',22,'Marketing	',45000,'8/1/2022'),
	   (9,'Hank',29,'Sales',30000,'8/15/2022'),
	   (10,'Ivy',33,'Sales',35000,'9/1/2022'),
	   (11,'Abhi',35,'Games',55000,'9/9/2022');

--------------------------------------------------------------------

-- DQL (Data Query Language)

		--Syntax
		--select * from <table_name>;  * = everything

select * from employees;

--Query select columns
select 
	emp_id,
	emp_name 
from employees;

--Using Aliases with AS
select 
	emp_id as employees_id,
	emp_name as employees_name
from employees;

select 
	e.emp_id,
	e.emp_name
from employees as e;



--Filtering data using WHERE Clause
select * from employees
where department = 'Marketing';

select * from employees
where age = 35;

--Filtering data using WHERE Clause for multiple values
select * from employees
where department in ('Marketing','HR');

--Using BETWEEN
select * from employees
where salary between 20000 and 50000;

select * from employees
where age between 30 and 40;

--Using Arithmetic expressions
--Q: retrieve employees name, their monthly salary, and a 10% bonus
select 
	emp_name,
	salary as monthly_salary,
	salary * 0.10 as bonus_amount
from employees;

--Q: retrieve employee ids, thier age, monthly salary, and yearly salary
select
	emp_id,
	age,
	salary as monthly_salary,
	salary * 12 as yearly_salary
from employees;

--Q: retrieve employees name, salary, total salary after 20% tax deduction.
select 
	emp_name,
	salary,
	salary * 0.20 as deduction,
	salary - (salary * 0.20) as net_salary
from employees;

--filtering the data using multiple conditions
--Q: retrieve employees in 'IT' department and a salary greater than 20000

select * from employees;

select * from employees 
where department = 'IT'
and salary > 20000;

--using OR
--Q: retrieve employees in 'HR' department or with a salary lesser than 50000
select * from employees
where department  = 'HR'
or salary < 50000;

--usign NOT
--Q: retrieve employees who do not work in 'HR' department
select * from employees
where NOT department = 'HR';

select * from employees
where department not in ('HR');

select * from employees
where not department in ('HR', 'IT');

--using like

--'_%' after the letter - starting letter
--'%_%' start and end - anywhere in the word
--'%_' before - ending letter

--Q: retrieve employees whose names start with "A"
select * from employees
where emp_name LIKE 'A%';

--Q: retrieve employees whose name has "b"
select * from employees
where emp_name LIKE '%b%';

select * from employees
where emp_name LIKE '%ev%';

--Q: retreive employees whose name end with "e"
select * from employees
where emp_name LIKE '%e';

--Sorting Data by Order By

select * from employees order by emp_id asc;

select * from employees order by emp_id desc;

select * from employees order by department asc;

select * from employees order by hire_date desc;

--sorting by multiple columns

select * from employees 
order by department asc, salary desc;

select * from employees 
order by department asc, hire_Date desc;


select * from employees;
select * from departments;

-----------------------------------------------------

--Joins

--Inner Join

select * from employees e
inner join department d on d.dept_name = e.department

select * from employees 
inner join department on department.dept_name = employees.department

--Q:retrieve the names of employees along with their dept_ids and department names.
-- Include only employees who belong to a department.

select 
	e.emp_id,
	e.emp_name,
	d.dept_id,
	e.department,
	e.salary,
	e.hire_date
from employees e
inner join department d on d.dept_name = e.department


-- Left Join

--Q:Retrieve all employees names and their department names and department IDs. 
--  Include employees even if they do not belong to any department [use - left join]
select 
	e.emp_name,
	d.dept_name,
	d.dept_id
from employees e
left join department d on d.dept_name = e.department


--Q:Retrieve all employees names and their department names and department IDs. 
--  Include employees even if they do not belong to any department [use - right join]
select 
	e.emp_name,
	d.dept_name,
	d.dept_id
from department d
right join employees e on d.dept_name = e.department

--Right Join

select * from employees e
right join department d on d.dept_name = e.department

-- Full Outer Join

select * from employees e
full outer join department d on d.dept_name = e.department


---------------------------------------------------------------------------------------

--Q/A

--1)Retrieve employee names and their monthly salary with a column alias.

select 
	emp_name as employees_name,
	salary as monthly_salary
from employees;

--2)Retrieve employee names and their annual salary with an alias.

select 
	emp_name as employees_name,
	salary * 12 as annual_salary
from employees;

--3) Retrieve employee names, salaries, and a 20% bonus.
select 
	emp_name as employees_name,
	salary,
	salary * 0.2 as bonus
from employees;

--4) Retrieve employees in the "HR" department or with a salary greater than 50000.
select * from employees
where department = 'HR'
or salary> 50000;

--5) Retrieve employees who do not work in the "HR" department.
select * from employees
where not department = 'HR'

--6) Retrieve employees whose names end with "e".
select * from employees
where emp_name like '%e';

--7) Retrieve employees with a salary between 20000 and 50000.
select * from employees
where salary between 20000 and 50000;

--Q/A Joins

--1) Write a query to retrieve the names of employees along with their department names. Include only employees who belong to a department.
select 
	e.emp_name,
	e.department
from employees e 
inner join department d on d.dept_name = e.department;

--2) Write a query to retrieve all employees and their department names. Include employees even if they do not belong to any department.
select * from employees e
left join department d on d.dept_name = e.department;

--3) Write a query to retrieve all departments and the names of employees who work in those departments. 
--   Include departments even if they have no employees.
select 
	d.dept_name,
	e.emp_name
from department d
left join employees e on d.dept_name = e.department;


select 
	d.dept_name,
	e.emp_name 
from employees e
right join department d on d.dept_name = e.department;

--4)Write a query to retrieve all employees and all departments, 
--  including employees without departments and departments without employees.

select * from employees e
full outer join department d on d.dept_name = e.department;

----------------------------------------------------------------------------------------

--Aggregation and grouping

--
select count(*) from employees;

select sum(salary) from employees;

select avg(salary) from employees;

select max(salary) from employees;

select min(salary) from employees;

--

select distinct department from employees;

select * from employees order by age

select 
	department,  
	count(*) as total_employees
from employees
group by department

--
select 
	department,  
	sum(salary) as total_salary
from employees
group by department

--
select 
	department, 
	hire_date,
	sum(salary) as total_salary
from employees
group by department, hire_date

--
select 
	department,
	max(salary) as max_salary
from employees
group by department

--
select 
	department,
	min(salary) as min_salary
from employees
group by department

--
select 
	department,
	round(avg(age),1) as avg_age
from employees
group by department;

--Combining Multiple Aggregate Function

--Q: write a query to retrive the count of employees, total salary, average salary, max and min salary, 
--   and avgrage age for each department



------------------------------------------------------------

--Having Clause 

-- Q: retrieve departments where total salary is > 40000 
select * from (
select 
	department,  
	sum(salary) as total_salary
from employees
group by department
having sum(salary) > 40000
)
where total_salary > 60000

--Q: retrieve departments where there are more than 1 employees 

select 
	department,  
	count(emp_id) as total_employees
from employees
group by department
having count(emp_id) > 1


--Q: Find departments where the average salary is greater than 30000.
select 
	department,
	round(avg(salary),1) as avg_salary
from employees
group by department
having avg(salary) > 30000

--Q: Find departments where the total salary is greater than 50000.
select 
	department,  
	sum(salary) as total_salary
from employees
group by department
having sum(salary) > 50000

--Q: Find departments where the minimum salary is greater than 20000.
select 
	department,  
	min(salary) as min_salary
from employees
group by department
having sum(salary) > 20000


--Q: Find departments where the maximum salary is greater than 50000.
select 
	department,  
	max(salary) as min_salary
from employees
group by department
having max(salary) > 50000


--Q: Find departments where the average salary is greater than 30000 and number of employees is greater than 1.
select 
	department,
	round(avg(salary),1) as avg_salary,
	count(*) as total_employees
from employees
group by department
having avg(salary) > 30000 and count(*) > 1

--Q: Find departments and department IDs where the total salary is greater than 50000.
select 
	e.department,  
	d.dept_id,
	sum(e.salary) as total_salary
from employees e 
inner join department d on d.dept_name = e.department
group by e.department,d.dept_id 
having sum(e.salary) > 50000

select * from employees;
select * from department;

--Q: Find departments and department IDs where the minimum salary is greater than 20000.
select 
	e.department,  
	d.dept_id,
	min(e.salary) as min_salary
from employees e
inner join department d on d.dept_name = e.department
group by e.department,d.dept_id
having min(e.salary) > 20000

-- select
--		col1, col2,col3...
-- from <table_A>
-- join <table_B>
-- where <condition>
-- group by <cols.....>
-- having <condition>
-- order by <cols>


------------------------------------------------------------------------------------------

--Uisng Subqueries in SQL[query inside a query]

--WHERE Clause
--SELECT Clause
--FROM Clause
--HAVING Clause

--WHERE Clause
--Q: Find employees whose salary is greater than the average salary.

select * from employees
where salary > (select avg(salary) from employees);

--Q: Find employees whose salary is greater than total salary of finance department.
select * from employees
where salary > (select sum(salary) from employees where department = 'Finance');

--SELECT Clause
--Q: Retrieve employees name, salary, average salary, and the difference between their salary and average salary.

select
	emp_name,
	salary,
	(select avg(salary) from employees) as avg_salary,
	salary - (select avg(salary) from employees) as salary_diff
from employees;

--FROM Clause


select emp_id, emp_name from (select * from employees where department = 'IT') ;


select 
	emp_id,
	emp_name,
	dept_id,
	salary
from (
	select 
		*
	from employees e 
	inner join department d on d.dept_name = e.department
) ;



select sum(total_salary) from (
	select 
		e.department,
		sum(e.salary) as total_salary
	from employees e 
	inner join department d on d.dept_name = e.department
	group by e.department
	having sum(e.salary) > 50000
) 



select * from (
	select 
		department,  
		count(emp_id) as total_employees
	from employees
	group by department
	having count(emp_id) > 1
) 
where total_employees > 2

---------------------------------------------------------

-- Q1) Write a query to count the number of employees in each department. 

	select 
		department,  
		count(emp_id) as total_employees
	from employees
	group by department

--Q2) Write a query to find the minimum and maximum salary in the "Sales" department.
select 
	department,
	min(salary),
	max(salary)
from employees
group by department
having department = 'Sales';

--Q3)Write a query to find the average salary spent per department for employees who are 25 years old or older.

select 
	department,
	avg(salary)
from employees
where age >= 25
group by department;

--Q4) Write a query to retrieve departments where the total salary is greater than the average salary across all the department


select 
	department,  
	sum(salary) as total_salary
from employees
group by department
having sum(salary) > (
	select avg(total_salary) from 
		(select 
			department,
			sum(salary) as total_salary
		from employees
		group by department)
	)

--Q6) Write a query to find the  department IDs where the total salary is between 40000 and 80000

select 
	d.dept_id,
	sum(e.salary) as total_salary
from employees e 
inner join department d on d.dept_name = e.department
group by d.dept_id
having sum(e.salary) between 40000 and 80000;

----------------------------------------------------------------------------------

-- DDL (Data Definition Language)

-- CREATE - Creates a database objects (table, schema)

-- ALTER - Modifies the database objects (column names, data types - table structure)

-- DROP - Deleting a Table

-- TRUNCATE - Removing the data inside a table

---------

-- ALTER

-- Altering a column name

-- Syntax
-- ALTER TABLE <table_name>
-- RENAME <col_name> TO <new_col_name>;

select * from employees;

alter table employees
rename age to emp_age;

-- Altering a column data type

-- Syntax
-- ALTER TABLE <table_name>
-- ALTER <col_name> TYPE <new_data_type>;

alter table employees
alter department type char(50);

-- Alterning a table name

--Syntax
-- ALTER TABLE <table_name>
-- RENAME TO <new_table_name>

alter table department
rename to departments;

-----------------

--DROP 

-- Syntax
-- DROP TABLE <table_name>;

drop table employees;

-----------------

-- TRUNCATE

-- Synatx
-- TRUNCATE TABLE <table_name>;
select * from departments

Truncate table department;

-------------------------------------------------------------

-- DML (Data Manipulation Language)

-- INSERT - Adds a new data into a table

-- UPDATE - Modifies the existing data

-- DELETE - Deleting a particular value


select * from employees order by 1;

-- UPDATE

-- SYNTAX
-- UPDATE <table_name>
-- SET <col_name> = <updated_value>
-- WHERE CONDITION

update employees
set salary = 20000
where emp_id = 2;

update employees
set department = 'Finance'
where emp_id = 8;

-- DELETE

-- Synatx
-- DELETE FROM <table_name>
-- WHERE <condition>;

delete from employees
where department = 'Games' 


-----------------------------------

-- DQL (Data Query Language)

-- SELECT: Retrieves data

-- select * from <table_name>;


-----------------------------------

select * from employees order by 1;

-- TCL (Transaction Control Language)

BEGIN;

update employees
set salary = 30000
where emp_id = 2;

update employees
set salary = 50000
where emp_id = 3;

ROLLBACK;

COMMIT;

--------------------

-- SAVEPOINT: Sets a point to rollback to-

BEGIN;

update employees
set salary = 20000
where emp_id = 2;

SAVEPOINT one;

update employees
set salary = 30000
where emp_id = 3;

savepoint two;

update employees
set salary = 60000
where emp_id = 4;

savepoint three;

update employees
set salary = 80000
where emp_id = 5;

savepoint four;

rollback to two;

commit;

---------------------------------
select * from employees order by 1;

-- RELEASE SAVEPOINT

BEGIN;

update employees
set salary = 45000
where emp_id = 11;

update employees
set salary = 40000
where emp_id = 3;

savepoint day2;

update employees
set salary = 60000
where emp_id = 4;

savepoint three;

update employees
set salary = 80000
where emp_id = 5;

savepoint four;

release savepoint day2;

rollback to one;

commit;

------------

-- Ex: Transaction using INSERT

Begin;

insert into employees (emp_id,emp_name,emp_age,department,salary,hire_date)
values (11,'Robert',20,'Finance',50000,'2022-05-13');

savepoint one_record;

insert into employees (emp_id,emp_name,emp_age,department,salary,hire_date)
values (12,'Tom',30,'HR',30000,'2022-05-13');

rollback to one_record;

commit;


-----------------------

select 
	department,  
	count(emp_id) as total_employees
from employees
group by department

--------------------------------

-- Window Funtion: performs a calculation accross a set of table rows that are related to the 
				-- current row. Unlike group by it does not collapse the rows.

-- Ranking Functions
	-- ROW_NUMBER
	-- RANK
	-- DENSE_RANK
	-- NTILE

-- Aggregate window functions
	-- SUM
	-- AVG
	-- COUNT

-- Value functions
	-- LAG
	-- LEAD

----------------
-- ROW_NUMBER

select 
	 *
	,row_number () over (partition by department order by salary desc) as row_num
from employees

select 
	* 
from employees 
where department = 'Finance' 
order by salary desc 
limit 3

-- RANK

select 
	 *
	,rank () over (partition by department order by salary desc) as row_num
from employees

-- DENSE_RANK
select 
	 *
	,dense_rank () over (partition by department order by salary desc) as row_num
from employees

-- NTILE
-- ntile(n)

select 
	 *
	,ntile(5) over (order by salary desc) as half_group
from employees;

-- Q: FInd highest paid employees in each department

select * from (
select 
	 *
	,row_number () over (partition by department order by salary desc) as row_num
from employees
)
where row_num = 1

----------------
-- Aggregate window functions

-- SUM 

select 
	 *
	,sum(salary) over (partition by department order by hire_Date) as dept_total_salary
from employees;

-- AVG

select 
	*
	,avg(salary) over (partition by department) as dept_avg_salary
from employees;

-- COUNT

select
	 *
	,count(emp_id) over (partition by department) as emp_count
from employees;

-- Running Total (Cumulative SUM)

select 
	 *
	,sum (salary) over (partition by department order by salary desc) as row_num
from employees

select 
	 *
	,sum(salary) over (order by emp_id ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_total
from employees;

-- MAX
--Q: show each employees salary along with the highest salary in their department

select
	 emp_name
	,department
	,salary
	,max(salary) over (partition by department) as max_dept_salary
from employees

-------

-- VALUE FUNCTIONS

-- LAG

select 
	 emp_name
	,hire_Date
	,salary
	,lag(salary) over (order by hire_date) as prev_salary
from employees

select 
	 emp_name
	,hire_Date
	,lag(hire_date) over (order by hire_date) as prev_hire_Date
from employees

select 
	 emp_name
	,hire_Date
	,lead(hire_date) over (order by hire_date) as next_hire_Date
from employees

--------------

-- Q: Use LAG to see how salary changed from the previous employee in the department

select 
	 emp_name
	,department
	,hire_date
	,salary
	,lag(salary) over (partition by department order by hire_date) as prev_emp_Salary
	,salary - lag(salary) over (partition by department order by hire_date) as salary_diff_with_prev
from employees

-- Q: Use LEAD to compare salary with the next employee (by hire date) in the department

select 
	 emp_name
	,department
	,hire_date
	,salary
	,lead(salary) over (partition by department order by hire_date) as prev_emp_Salary
	,salary - lead(salary) over (partition by department order by hire_date) as salary_diff_with_prev
from employees;


-------------------------------------------------------

-- DCL - Data Control Language

-- Commands are used to control access [like permissions] to data in database.

--GRANT

--REVOKE

--------------------

-- GRANT

-- user can only view the data - but not modify it.
GRANT SELECT ON employees TO demo_user;

-- Allow all permissions to a particular user.
GRANT SELECT, INSERT, UPDATE, DELETE ON employees to demo_user;

------------------------------------

-- REVOKE

--remove access from demo_user 

REVOKE SELECT ON employees FROM demo_user;

-- remove certain sets of commands.
REVOKE UPDATE, DELETE ON employees FROM demo_user;




use company;
select * from emp;

--Display all employees.
select * from emp;

--Display only employee name and salary.
select Emp_name,Emp_sal from emp
--Display unique cities.
select distinct city from emp 
insert into emp values (11,'Sanket','pune',2500,'sales')
select distinct city from emp 
--Display unique combinations of city and department.
select distinct city,emp_dept from emp
--Display employees whose salary is greater than 3000.
select * from emp
where emp_sal > 3000
--Display employees whose salary is between 2000 and 5000.
select * from emp
where emp_Sal between 2000 and 5000
--Display employees working in HR.
select * from emp
where emp_dept in ('HR')
--Display employees who are not from Pune.
select * from emp
where city != 'Pune'
--Display employees whose salary is not equal to 25,000.
select * from emp 
where emp_sal <> 2500
--Display employees from Pune OR Mumbai.
select * from emp
where city in ('pune','mumbai')
select * from emp
where city= 'pune' or city = 'mumbai'
--Display employees from Pune AND working in HR.
select * from emp
where city = 'pune' and emp_dept = 'hr'
--Display employees whose salary is greater than 30,000 AND department is Finance.
select * from emp
where emp_sal > 3000 and emp_Dept = 'Finance'
--Display employees whose salary is less than 2001 OR greater than 5000.
select * from emp
where emp_sal not between 2001 and 5000

select * from emp
where emp_Sal < 2001 or emp_Sal > 5000
--Display employees using IN.
select * from emp 
where city in ('pune','nagpur','ranchi')
--Display employees using NOT IN.
select * from emp 
where city not in ('pune','nagpur','ranchi')
--Display employees using BETWEEN.
select * from emp 
where emp_Sal between 3000 and 6000 
--Display employees using NOT BETWEEN.
select * from emp 
where emp_Sal not between 3000 and 6000
--Sort employees by salary ascending.
select * from emp 
order by emp_sal
--Sort employees by salary descending.
select * from emp 
order by emp_sal desc
--Sort employees first by department and then by salary descending.
select * from emp
order by emp_dept ,emp_Sal desc

--Find employees whose name starts with A.
select * from emp
where emp_name like 'A%'
--Find employees whose name ends with A.
select * from emp
where emp_name like '%A'
--Find employees whose name contains A.
select * from emp
where emp_name like '%A%'
--Find employees whose name has exactly 5 characters.
select * from emp
where emp_name like '_____'
--Find employees whose second character is A.
select * from emp
where emp_name like '_A%'
--Find employees whose name starts with either A or B.
select * from emp
where emp_name like '[As]%'
--Find employees whose name contains AB.
select * from emp
where emp_name like '%ha%'
--Find employees whose name does not start with A.
select * from emp
where emp_name not like 'A%'
--Find employees whose city starts with P.
select * from emp
where emp_name like 's%'
--Find employees whose city contains n.
select * from emp
where emp_name like '%n%'
--Find names where the first character can be either A or B.
select * from emp
where emp_name like '[AB]%'
--Find names where the first character is not A or B.
select * from emp
where emp_name not like '[AB]%'
--Find names where the third character is R.
select * from emp
where emp_name like	'__R%'

--Display employees whose city is NULL.
select * from emp
where city is null;
--Display employees whose city is NOT NULL.
select * from emp
where city is not null;
--Replace NULL city with 'Unknown' using ISNULL().
select *, isnull(city, 'Unknown') from emp

--Replace NULL city with 'Unknown' using COALESCE().
select *, coalesce(city,'unknown') from emp
--Display employees whose salary is NULL. 
--Display employee name and salary. If salary is NULL, display 0.
--Explain with query the difference between:

--Display employees whose city is NULL.
--Display employees whose city is NOT NULL.
--Replace NULL city with 'Unknown' using ISNULL().
--Replace NULL city with 'Unknown' using COALESCE().
--Display employees whose salary is NULL.
--Display employee name and salary. If salary is NULL, display 0.
--Explain with query the difference between:

Create a database called CompanyDB.
Create an EMPLOYEE table with:
EMP_ID
EMP_NAME
CITY
SALARY
DEPT_ID
Add a new column EMAIL.
Change the datatype of SALARY.
Rename a column.
Drop the EMAIL column.
Create another table called DEPARTMENT.
Drop the DEPARTMENT table.
Drop the database.
Create a table using appropriate constraints.


PART 5 — Constraints

Create a table containing:

PRIMARY KEY
FOREIGN KEY
NOT NULL
UNIQUE
DEFAULT
CHECK
Create an employee table with EMP_ID as Primary Key.
Make EMP_NAME NOT NULL.
Make EMAIL UNIQUE.
Give CITY a default value of 'Pune'.
Add a CHECK constraint that salary must be greater than 10,000.
Create a department table and connect it with Employee using Foreign Key.
Try inserting duplicate Primary Key. Observe the error.
Try inserting NULL into a NOT NULL column.
Try inserting duplicate EMAIL.
Try inserting salary below the CHECK condition.


🟢 PART 6 — IDENTITY
Create an employee table where EMP_ID automatically increases.
Insert 5 employees without specifying EMP_ID.
Check the generated IDs.
Delete one employee and insert another employee. Observe the ID.
Use IDENTITY_INSERT to insert a specific ID.
Explain the difference between:




🟢 PART 7 — INSERT / UPDATE / DELETE
Insert one employee.
Insert multiple employees.
Update the salary of one employee.
Increase salary by 10% for all employees.
Increase salary by 5% for HR employees.
Change the city of one employee.
Delete one employee.
Delete employees from a particular city.
Delete all employees.
Explain the difference between:

select city from emp
group by city
having city in ('kota','patna')


use company;

create table student_details (
s_id int primary key ,
s_name varchar(50) Not Null,
s_city varchar(50) default 'pune',
s_phone char(10) unique,
)

select * from student_details
sp_help student_details

--M-I
Insert Into student_details values (
1,'shweta','Nagpur','4567654567')

Insert Into student_details values (
2,Null,'Nagpur','4567654567') -- error
Insert Into student_details values (
2,'Nagpur','4567654567') --error
Insert Into student_details values (
2,'sanket','4567654567') -- error

Insert Into student_details values (
2,'radhika',default,'4568654567') 

Insert Into student_details values (
3,'ganesh',default,'4568654567') --error of unique key

--M-II
Insert Into student_details (s_id,s_name,s_city,s_phone) values (
5,'rohini','Nagpur','4567854567') 

Insert Into student_details (s_id,s_name,s_phone) values (
4,'rohini','4567854367') 

Insert Into student_details (s_id,s_name,s_phone) values (
6,'rohini','4567854357') 


create table student(
s_id int foreign key references dept,
s_name varchar(50) not null,
)

create table dept(
d_id int primary key  ,
d_name varchar(30) 
)

insert into dept values(
1, 'HR'),
(2,'Admin'),(3,'sales')
select* from dept;
insert into student values
(1,'kasat')
select * from student
drop table student;

create table student(
s_id int primary key,
s_name varchar(50) not null,
d_id int foreign key references dept
)

insert into student values
(1,'kasat') ---error

insert into student values
(1,'kasat',6)
insert into student values
(1,'kasat',3)
select * from student;

--check
create table stu(
id int primary key,
name varchar(30) not null,
city varchar(30) default 'nagpur',
phone char(20) unique,
age int check (age > 19 and age < =30)
)
insert into stu values
(1,'rina',default,'4567543234',15) --error

insert into stu values
(1,'rina',default,'4567543234',20)

--auto increment 
create table account_details 
(acc_no int identity (345676544, 1 ),
branch varchar(20)
)

insert into account_details values
('pune')
select * from account_details;

insert into account_details values
(345676545,'pune') -- error

insert into account_details values
('hyderabad')

--backup

select*  from empd 
where emp_Sal > 
(select avg(emp_Sal) from empd)

--emp who have the highest sal in com
select * from empd 
where emp_Sal = 
(select max(emp_Sal) from empd)

--sec max sal
select max(emp_sal) from empd
where emp_Sal <
(select max(emp_sal) from empd)

--
select emp_name, emp_dept, emp_Sal from empd
where emp_sal =
(select emp_name, emp_dept, max(emp_sal) from empd group by emp_dept,emp_name)
--emp who work in the same city as amit
select * from empd 
where emp_city = (
select emp_city from empd 
where emp_name = 'amit')

--emp earning more than all hr emp
select * from empd
where emp_sal > 
(select max(emp_Sal) from empd 
where emp_dept = 'hr')
--emp earning more than at least hr emp
select * from empd
where emp_sal > 
(select min(emp_Sal) from empd 
where emp_dept = 'hr')

select emp_dept,avg(emp_Sal)
from empd
group by emp_dept
having avg(emp_Sal) > 
(select avg(emp_Sal) from empd)


select emp_dept,avg(emp_Sal) as avg_Sal
from empd
group by emp_dept
having avg(emp_Sal) = (
select max(avg_Sal)
from (select avg(emp_Sal) as avg_Sal from empd group by emp_dept) as dept_avg)

--select emp_Dept,avg(emp_Sal) from empd group by emp_Dept --only for it
--same as
--emp whose sal > avg sal of it dept
select emp_name ,emp_dept,emp_sal from empd 
where emp_Sal > 
(select avg(emp_Sal) from empd where emp_dept = 'it')

--emp whose sal > highest sal in hr
select * from empd 
where emp_Sal > 
(select max(emp_sal) from empd where emp_dept = 'hr')

--emp whose sal > any sal in hr
select * from empd where
emp_Sal > 
(select min(emp_sal) from empd where emp_dept = 'hr')

select * from empd 
where emp_city = 
(select emp_city from empd where emp_name = 'priyanka')

--Q10. Find the department having the highest average salary.
select emp_dept,avg(emp_sal) from empd group by emp_dept
having avg(emp_sal) = 
(select max(avg_sal) 
from (select avg(emp_sal) as avg_sal from empd group by emp_dept) as avg_dept)

--Q11. Find employees who belong to the department having the highest average salary.
select * from empd 
where emp_Dept in
(select emp_Dept from empd group by emp_dept
having avg(emp_sal) =
(select max(avg_sal) from
(select avg(emp_sal) as avg_sal from empd group by emp_dept) as avg_dept))

--Q12. Find employees whose salary is equal to the highest salary in the IT department.
select * from empd
where emp_sal =
(select max(emp_Sal) from empd where emp_dept = 'it')
--Q13. Find employees whose salary is greater than the average salary of the Finance department.
select * from empd
where emp_sal > 
(select avg(emp_sal) from empd 
where emp_Dept = 'finance')


--Q14. Find the employee(s) having the third-highest distinct salary.
select * from empd
where emp_sal = (
select min(emp_sal) from(
select distinct top (3) emp_sal from empd order by emp_sal desc) as top_emp_sal)
--same as
select * from empd
where emp_sal = 
(select min(emp_sal) from empd 
where emp_sal in
(select distinct top (3) emp_sal from empd order by emp_sal desc) )

--Q15. Find the highest salary below the overall average salary, and display the employee(s) having that salary.
select * from empd 
where emp_sal = (select max(emp_sal) from empd
where emp_Sal < 
(select avg(emp_Sal) from empd))

--Q16. Find the department having the second-highest average salary.
select emp_dept from empd group by emp_dept
having avg(emp_Sal) in (
select min(avg_sal) from 
(select top 2 avg(emp_Sal) as avg_sal,emp_dept from empd group by emp_dept order by avg_sal desc) 
as top_avg_sal)

--Q17. Find the department having the highest total salary.
select emp_Dept from empd group by emp_dept
having sum(emp_sal) in (
select max(sum_dept_sal) from
(select emp_dept,sum(emp_sal) as sum_dept_sal from empd group by emp_dept ) 
as sum_dept)

--Q18. Find employees whose salary is greater than the average salary of HR, IT, Finance and Sales individually.
select * from empd
where emp_sal >
(select max(avg_sal) from
(select avg(emp_sal)as avg_sal from empd group by emp_Dept) as empd)
--or but till now this is not learn
select * from empd
where emp_sal >
All
(select avg(emp_sal)as avg_sal from empd group by emp_Dept) 
💡 Think carefully about ALL.

--Q19. Find employees whose salary is greater than at least one employee from every department.
select * from empd
where emp_sal >
(select min(avg_sal) from
(select avg(emp_sal)as avg_sal from empd group by emp_Dept) as empd)

--or
select * from empd
where emp_sal >
any
(select avg(emp_sal)as avg_sal from empd group by emp_Dept) 
--Q20. Find the employee(s) having the maximum salary among employees whose salary is below ₹6,000.
select * from empd
where emp_sal = 
(select max(emp_Sal) from empd where emp_Sal < 6000)

--Q21. Find the employee(s) having the second-highest salary among employees who belong to IT or HR.
select top 2 emp_sal from empd where emp_dept in ('it','hr') order by emp_sal desc

select * from empd
where emp_sal = (
select min(emp_sal) from(select top 2 emp_sal from empd where emp_dept in ('it','hr')
order by emp_sal desc) as emp_dept) and emp_Dept in ('hr','it')
--or
select * from empd
where emp_Dept in ('hr','it') and
emp_sal = (select max(emp_sal) from empd where emp_Dept in ('hr','it') and
emp_sal < (select max(emp_sal) from empd where emp_Dept in ('hr','it'))) 

--Q22. Find the department(s) whose minimum salary is greater than the overall average salary.
select emp_dept from empd group by emp_dept
having min(emp_Sal) > 
(select avg(emp_Sal) from empd)

--Q23. Find employees whose salary is greater than the maximum salary of HR but less than the maximum salary of Sales.
select * from empd 
where emp_Sal > (select max(emp_sal) from empd where emp_dept = 'hr')
and emp_sal < 
(select max(emp_sal) from empd where emp_dept = 'sales')

--Q24. Find the employee(s) having the salary equal to the maximum salary among employees who joined in 2022.
select * from empd 
where emp_sal = 
(select max(emp_Sal) from empd where emp_doj >= '01-01-2022' and emp_doj < '01-01-2023' )
select * from empd


--Q25. Find the department having the second-highest total salary.
select emp_dept from empd group by emp_dept
having sum(emp_sal) = (select min(sum_Sal) from
(select top 2 sum(emp_sal) as sum_Sal from empd group by emp_dept order by sum_Sal ) as sum_table)
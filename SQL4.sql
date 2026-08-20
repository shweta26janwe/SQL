--Offline SQL
--Session-04
USE WED

select * from Employee

--How to insert records into the table 
--Method - I 
Syntax:
Insert into Table_Name Values (C1_value,C2_value,C3_value,C4_value...Cn_value)

--Single record
insert into employee values (1,'Praveen','Pune','2024-07-12 10:00:00.000',3245.78)
-- 2026-08-20 10:15:45.843
select * from Employee
select GETDATE()

insert into employee values (1,'Praveen','Pune',3245.78)

insert into employee values ('Praveen',2,'Pune',getdate(),3245.78)

insert into employee values ('','','','',2456.80)

SP_HELP EMPLOYEE;

select * from Employee

--If we dont have value to insert into the table then we are supplying blank value 
--then by default depends data type SQL will insert below value 
--1.Numeric data type - 0 (zero)
--2.Approximate vNumeric data type - 0
--3.Char/ string data type - blank / empty space 
--4.date time data type 
--date -1900-01-01
--time - 00:00:00.000
--datetime - 1900-01-01 00:00:00.000

--Method - II
--This will allow you to insert data as per user defined sequence 
syntax:
insert into table_name (col3,col1,col5) values ('Col3_value','Col1_Value','Col5_value')

--If we are not supplying a vlaue to column then by default SQL will replace 
--Place holder value i.e. NULL

insert into Employee(EMP_ID,EMP_DOJ,EMP_NAME) values 
(2,GETDATE()-200,'Kiran')

select * from Employee

insert into Employee(EMP_ID,EMP_DOJ,EMP_NAME) values 
(2,'Kiran')

select * from Employee

insert into Employee(EMP_ID,EMP_DOJ,EMP_NAME) values 
('','','')

--Multiple records into the table 
insert into employee values (2,'Om','Delhi',GETDATE()-500,6700),
(3,'Shila','Ranchi',GETDATE()-600,6000),(4,'vilas','Mumbai',GETDATE()-300,7000.78),
(5,'Veena','Chennai',GETDATE()-800,5000),(6,'Kirti','Nasik',GETDATE()-900,4000),
(7,'Pavan','Indore',GETDATE()-200,8000),(8,'Vikram','Latur',GETDATE()-350,8500),
(9,'Kimaya','Kota',GETDATE()-700,7654.11)

 select * from Employee

 --SQL Cluaes 
 --1.WHERE 
 --2.ORDER BY
 --3.GROUP BY
 --4.HAVING 

 --1.WHERE 
 --It is used for filtering purpose 

 syntax:
 select * from table_name where Condition (Column_Name operator Value);

 --SQL Operator 
 --1.Comparision  (>, < , >=, <=, =, != or <>)

 --Q.Extract those employees who have jooined after 31st Dec 2024?
 select * from Employee where EMP_DOJ > '2024-12-31'

 --Find out an emp list whose sal is less than 5000?
 select * from Employee where EMP_SAL < 5000

 --Display all the employees who is not belong to city Pune?
 select * from Employee where EMP_CITY <> 'Pune'

 --Display employee who have joined after 1st Jan 2025 and having sal > 7000?
 select * from Employee where EMP_DOJ > '2025-01-01', emp_sal > 7000;

 --2.Logical 
--If we want to euqvate two or more than two condition then we have to use logical operator 
 --1.AND
 --AND will operate row-by-row basis 
 syntax:
 select * FROM TABLE_name where condition1 AND condition2.....Condition-n;

 select * from Employee
 
 --Display employee who have joined after 1st Jan 2025 and having sal > 7000?
 select * from Employee where EMP_DOJ > '2025-01-01'and emp_sal > 7000;
 
 --Extract employees from pune city and having sal 5000?
 select * from Employee where EMP_CITY = 'PUNE'and emp_sal > 5000;

 --2.OR
 --It will opearte Row & Column basis.
 syntax:
 select * FROM TABLE_name where condition1 OR condition2.....Condition-n;

 --Extract employees from pune city and having sal 5000?
 select * from Employee where EMP_CITY = 'PUNE'OR emp_sal > 5000;

 --3.NOT
 --It is negation operation 
 syntax:
 select * from table_name where not condition;

 select * from employee where not EMP_DOJ > '2024-12-31'

 --3.Arithmatic (+,-,*,/,%)

 --SQL ALIAS
 --table
 select * from table_name as T

 select * from table_name T

 --Column
 select Column_Name as C1 from table_name;

 select Column_Name C1 from table_name;

 select C1=Column_Name from table_name;

 select * from Employee as E where E.EMP_ID=9

 select * from Employee E where E.EMP_ID=9

 select *,EMP_NAME as Names , EMP_DOJ DOJ, SAL=EMP_SAL from Employee

 --calculate yearly pkg of employee?
select *,PKG_PER_YR=EMP_SAL*12 from Employee

--Diplay only even id employee?
select * from Employee where EMP_ID%2=0
select * from Employee where EMP_ID%2=1



 --SQL Special operator
 --4. IN and NOT IN
 --If we want to extract specific values from, table then we have In and Not operator
 --IN --> it will extract specific records mentioned in a list and 
 --NOT IN --> it will extract specific records which is not mentioned in a list and 
 syntax:
 select * from Table_name where IN (v1,v5,v8,v9....)
 select * from Table_name where NOT IN (v1,v5,v8,v9....)

 --Extract employees whos empid is 1,4,5,7,9
 select * from Employee where EMP_ID in (1,4,5,7,9)
 select * from Employee where EMP_ID not in (1,4,5,7,9)



 --5. BETWEEN and NOT BTWEEN
 --It will help you to extract value in ranges 
 syntax:
 select * from table_name where Column_Name between Value1 and Value2;
 select * from table_name where Column_Name not between Value1 and Value2;

 select * from Employee where EMP_ID between 3 and 6;

 select * from Employee where EMP_ID not between 3 and 6;
 --Session-05
 --6. IS NULL and IS NOT NULL
 --7. LIKE 


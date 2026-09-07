use company;

CREATE TABLE EMPLOYEE_TRAINING
(
    EMP_ID INT PRIMARY KEY,
    EMP_NAME VARCHAR(50) NOT NULL,
    EMP_EMAIL VARCHAR(100) UNIQUE,
    EMP_CITY VARCHAR(30) DEFAULT 'PUNE',
    EMP_SALARY INT CHECK (EMP_SALARY >= 2000),
    EMP_DEPT VARCHAR(30),
    EMP_DOJ DATE DEFAULT GETDATE()
);

INSERT INTO EMPLOYEE_TRAINING
(EMP_ID, EMP_NAME, EMP_EMAIL, EMP_CITY, EMP_SALARY, EMP_DEPT, EMP_DOJ)
VALUES
(101,'Amit','amit@gmail.com','PUNE',4500,'IT','2024-01-10'),
(102,'Riya','riya@gmail.com','MUMBAI',5200,'HR','2024-02-15'),
(103,'Rohan','rohan@gmail.com','PUNE',6000,'IT','2023-11-20'),
(104,'Sneha','sneha@gmail.com','NAGPUR',4800,'FINANCE','2024-03-01'),
(105,'Raj','raj@gmail.com','KOTA',5500,'SALES','2023-09-12'),
(106,'Seema','seema@gmail.com','PUNE',4200,'HR','2024-04-05'),
(107,'Ravi','ravi@gmail.com','MUMBAI',7000,'SALES','2022-08-18'),
(108,'Pooja','pooja@gmail.com','NAGPUR',3900,'FINANCE','2024-05-10'),
(109,'Sachin','sachin@gmail.com','PUNE',5100,'IT','2023-07-22'),
(110,'Neha','neha@gmail.com','KOTA',4600,'HR','2024-06-01');

select* from employee_training;

create table DEPARTMENT_TRAINING(
DEPT_ID INT PRIMARY KEY,
DEPT_NAME VARCHAR(30) UNIQUE NOT NULL
);

INSERT INTO DEPARTMENT_TRAINING VALUES 
(1,'HR'),(2,'IT'),(3,'FINANCE'),(4,'SALES')

CREATE TABLE EMPLOYEE_FK_TRAINING 
(EMP_ID INT PRIMARY KEY,
EMP_NAME VARCHAR(50) NOT NULL,
DEPT_ID INT FOREIGN KEY REFERENCES DEPARTMENT_TRAINING(DEPT_ID)
);

INSERT INTO EMPLOYEE_TRAINING VALUES
(112, 'sakshi','pooja22@gmail.com','NAGPUR',7000,'FINANCE','2024-07-06')

/*Q1. Find Duplicate Records
Create a query to identify duplicate combinations of EMP_NAME, EMP_CITY and EMP_DEPT from EMPLOYEE_TRAINING.
•	Use GROUP BY, COUNT(*) and HAVING.
•	For practice, you may first insert one duplicate business record with a different EMP_ID.
*/

SELECT EMP_NAME,EMP_CITY,EMP_DEPT,COUNT(*) FROM EMPLOYEE_TRAINING
GROUP BY EMP_NAME,EMP_CITY,EMP_DEPT
HAVING COUNT(*) > 1

--Q2. Primary Key Validation
--Try inserting another record with EMP_ID = 101 and observe the result.
--•	Write the INSERT statement.
--•	Mention why the statement fails.
insert into EMPLOYEE_TRAINING values
(101,'shree','shree@gmail.com',default,4500,'IT','2025-07-26')
--above insert query gives error because at the time of creating table we created id primary key and we know that pk must be
--unique and not null that why it gives error of primary you are trying to insert is already available

--Q3. NOT NULL Validation
--Try inserting a record without EMP_NAME.
--•	Use the column list in INSERT.
--•	Observe the NOT NULL constraint behavior.
select * from EMPLOYEE_TRAINING

insert into EMPLOYEE_TRAINING (emp_id,emp_name,emp_city,emp_salary,emp_dept,emp_doj) values
(112,'sh@gmail.com','nagpur',2500,'HR','2022-02-20')--this possible bcoz emp_email may be null

insert into EMPLOYEE_TRAINING (emp_id,emp_email,emp_city,emp_salary,emp_dept,emp_doj) values
(112,'sh@gmail.com','nagpur',2500,'HR','2022-02-20') --it gives error because emp_name may not be null because we declare emp_name as not null

--Q4. UNIQUE Validation
--Try inserting a new employee using an existing email address.
--•	Use an existing EMP_EMAIL.
--•	Observe the UNIQUE constraint behavior.

insert into EMPLOYEE_TRAINING values
(113,'vandana','seema@gmail.com','pune',3000,'it','2022-02-23') --it gives error because email must be unique 

insert into EMPLOYEE_TRAINING values
(113,'vandana','vandana@gmail.com','pune',3000,'it','2022-02-23')

select * from EMPLOYEE_TRAINING

--Q5. DEFAULT Constraint
--Insert a new employee without providing EMP_CITY and EMP_DOJ.
--•	Use a column list.
--•	Verify that default values are populated.
insert into EMPLOYEE_TRAINING (emp_id,emp_name,emp_email,emp_salary,emp_dept) values
(114,'sachin','ssachin@gmail.com',4000,'sales') --yes default valuesmare populating

--Q6. CHECK Constraint
--Try inserting an employee with EMP_SALARY = 1500.
--•	Observe whether the CHECK condition allows the record.
--•	Then insert a valid salary value.
insert into EMPLOYEE_TRAINING values
(115,'vandana','vandana1@gmail.com','pune',1500,'it','2022-02-23') --error bcoz it uses check constraints which sal > 1500
insert into EMPLOYEE_TRAINING values
(115,'vandana','vandana1@gmail.com','pune',2500,'it','2022-02-23')
--Q7. Foreign Key – Valid Relationship
--Insert an employee into EMPLOYEE_FK_TRAINING using an existing DEPT_ID.
--•	Use DEPT_ID 1, 2, 3 or 4.
--•	Verify the inserted record.
select * from EMPLOYEE_FK_TRAINING
insert into EMPLOYEE_FK_TRAINING values
(5,'sachin',1),(2,'nitin',2),(3,'jayshree',4),(4,'maroti',4)

--Q8. Foreign Key – Invalid Relationship
--Try inserting an employee with DEPT_ID = 10.
--•	Observe the Foreign Key error.
--•	Explain which table/column is being referenced.
insert into EMPLOYEE_FK_TRAINING values
(6,'sachin',10) -- it gives error bcoz dept_id is a FK that  refereced to the dept_id of dept table

--Q9. Foreign Key – NULL Value
--Insert an employee with DEPT_ID as NULL.
--•	Verify whether the operation succeeds based on the table definition.
insert into EMPLOYEE_FK_TRAINING values
(7,'sachin',null) -- yes it succeed

--Q10. IDENTITY Table
--Create a CUSTOMER_TRAINING table with CUSTOMER_ID as IDENTITY(1001,1), CUSTOMER_NAME as NOT NULL and CITY with DEFAULT 'PUNE'.
--•	Insert at least 3 records without explicitly inserting CUSTOMER_ID.
--•	Display the generated IDs.
create table CUSTOMER_TRAINING 
(CUSTOMER_ID INT PRIMARY KEY IDENTITY (1002,1),
CUSTOMER_NAME VARCHAR(30) NOT NULL,
CITY VARCHAR(20) DEFAULT 'PUNE')

SELECT * FROM CUSTOMER_TRAINING
INSERT INTO CUSTOMER_TRAINING (CUSTOMER_NAME,CITY) VALUES 
('SACHIN',DEFAULT)
INSERT INTO CUSTOMER_TRAINING (CUSTOMER_NAME) VALUES 
('NITIN')
DELETE  FROM CUSTOMER_TRAINING WHERE CUSTOMER_ID=1003
INSERT INTO CUSTOMER_TRAINING (CUSTOMER_NAME,CITY) VALUES 
('AALOK','HYD')
--Q11. IDENTITY_INSERT Practice
--Create a practice statement showing how IDENTITY_INSERT can be turned ON to insert a specific identity value.
--•	Turn it ON.
--•	Insert one explicit ID value.
--•	Turn it OFF after the insert.
SET IDENTITY_INSERT CUSTOMER_TRAINING ON
INSERT INTO CUSTOMER_TRAINING (CUSTOMER_ID,CUSTOMER_NAME,CITY) VALUES
( 1003,'PILLU','PUNE') 
SET IDENTITY_INSERT CUSTOMER_TRAINING OFF
--Q12. Table Backup
--Create a backup of EMPLOYEE_TRAINING using SELECT INTO.
--•	Use a meaningful backup table name.
--•	Verify row count in both tables.
select * into employee_training_bkp_18082023 from EMPLOYEE_TRAINING;
select * from employee_table
select * from EMPLOYEE_TRAINING
select * from employee_training_bkp_18082023
--Q13. Copy Structure Only
--Create EMPLOYEE_EMPTY_COPY with only the structure of EMPLOYEE_TRAINING.
--•	Use SELECT INTO.
--•	Use WHERE 1 = 2.
--•	Verify that the table contains zero rows.
select * into employee_empty_copy from EMPLOYEE_TRAINING where 1=2;
select * from employee_empty_copy
--in above only stucture copy in employee_empty_copy

--Q14. Copy Selected Data
--Copy only IT department employees from EMPLOYEE_TRAINING into a new table.
--•	Create the destination structure first if required.
--•	Use INSERT INTO ... SELECT or SELECT INTO.
--•	Verify copied records.
select * from EMPLOYEE_TRAINING where emp_Dept = 'it';

insert into employee_empty_copy 
select * from EMPLOYEE_TRAINING where emp_Dept = 'it';
--in above query only  'it' emp copy into employee_empty_copy which already exist

select * into emp_deptt_data from EMPLOYEE_TRAINING where 1=1
select * from emp_deptt_data
--in above all data of EMPLOYEE_TRAINING are copy into emp_deptt_data which one creadted table now



--Q15. INFORMATION_SCHEMA – Tables
--Display metadata for all base tables available in the current database.
--•	Use INFORMATION_SCHEMA.TABLES.
--•	Filter if required.
select * from information_schema.tables

--Q16. INFORMATION_SCHEMA – Columns
--Display metadata for columns of EMPLOYEE_TRAINING.
--•	Use INFORMATION_SCHEMA.COLUMNS.
--•	Display column name and data type.
select * from information_schema.columns

--Q17. UPDATE – Controlled Update
--Update the city of employees belonging to HR department to 'PUNE'.
--•	Use a WHERE condition.
--•	Display the records before and after the update.

--s_uid
select 4+5; select 'where'
select * from employee_table, EMPLOYEE_TRAINING
select 7+null
select 8+''+4 -- o/p 12
select null + ' '
SELECT 5,null FROM EMPLOYEE 
select * from EMPLOYEE_TRAINING
update EMPLOYEE_TRAINING set emp_city = 'nagpur'
update EMPLOYEE_TRAINING set emp_city = 'pune'
where emp_Dept = 'hr'

--Q18. DELETE – Controlled Delete
--Delete one specific employee using EMP_ID.
--•	Use WHERE condition.
--•	Verify the record after DELETE.
delete from EMPLOYEE_TRAINING where emp_id = 103
select * from EMPLOYEE_TRAINING

--Q. Display last four employees in their sequence wise order (1....10) --O/P (7,8,9,10)
delete from EMPLOYEE_TRAINING where emp_id >= 
(select min(emp_id) from
(select top 4 emp_id from EMPLOYEE_TRAINING order by emp_id desc)
as new_table)

--Q19. ALTER TABLE – Add and Modify
--Add a PHONE_NUMBER column to EMPLOYEE_TRAINING and then increase its size.
--•	Use ALTER TABLE ADD.
--•	Use ALTER TABLE ALTER COLUMN.

--DDL --dr.cat
--syntax:
--DROP TABLE Table_Name; --To drop table
--DROP DATABASE Database_Name -- To drop database 

--Syntax:
--Change Column Name
--sp_rename 'SchemaName.TableName.OldColumnName', 'NewColumnName';
--Change Table Name
--sp_rename 'DATABASE_NAME.SchemaName(DBO).TableName(OldTableName)', 'NewTableName';
create table mart(
m_id int,
m_name varchar(30)
)
select * from mart
sp_rename 'dbo.mart.m_id','mart_id';
sp_rename 'company.dbo.mart','furniture_mart'
select * from furniture_mart
--1.
alter table EMPLOYEE_TRAINING add phone_no char(10)
select * from EMPLOYEE_TRAINING
sp_help EMPLOYEE_TRAINING
--2.
alter table EMPLOYEE_TRAINING alter column phone_no char(12)
--3. 

--4.
--Q20. ALTER TABLE – Drop and Rename
--Drop the PHONE_NUMBER column and rename EMP_CITY to CITY using SQL Server's sp_rename.
--•	First execute DROP COLUMN.
--•	Then use sp_rename.
--•	Use INFORMATION_SCHEMA.COLUMNS or sp_help to verify the final structure.
alter table EMPLOYEE_TRAINING drop column phone_no
sp_rename 'dbo.EMPLOYEE_TRAINING.emp_city','city'
sp_help EMPLOYEE_TRAINING
select * from information_schema.columns
alter table EMPLOYEE_TRAINING alter column EMP_DOJ varchar(10) --error but why i dont no
--We are changing EMP_ID column data type from varchar(10) to smallint 
alter table EMPLOYEE_TRAINING alter column EMP_salary smallint

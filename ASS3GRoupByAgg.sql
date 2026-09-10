use company;

create table EMP  
(
EMP_ID INT,
EMP_NAME VARCHAR(30),
CITY VARCHAR(20),
EMP_SAL DECIMAL
)

INSERT INTO EMP VALUES 
(1,'AMIT','PUNE',2000),
(2,'SUMIT','MUMBAI',2500),
(3,'ROHIT','RANCHI',3500),
(4,'RAHUL','CHENNAI',2700),
(5,'SUHANA','SANGLI',3000),
(6,'ROHAN','PATNA',4000),
(7,'VIVEK','BANGLORE',3500),
(8,'ANKUSH','MIRAJ',5000),
(9,'SHITAL','INDORE',4500),
(10,'VARUN','KOTA',6500)

SELECT * FROM EMP;

--AGGREGATE FUNCTION
--IN THIS THEIR MUST NEED TO PASS ONLY ONE ARGUMENT
--AVG AND SUM ARE APPLY TO ONLY NUMERIC AND APPROXIMATE NUMERIC VALUE
SELECT AVG(EMP_SAL) AS AVG_SAL FROM EMP;
SELECT SUM(EMP_SAL) AS TOTAL_SAL FROM EMP;

--MAX,MIN AND COUNT ARE APPLY FOR ALL TYPE OF DATA
SELECT MAX(EMP_SAL) AS MAX_SAL FROM EMP;
SELECT MIN(EMP_SAL) AS MIN_SAL FROM EMP;

SELECT COUNT(EMP_SAL) AS TOTAL_COUNT FROM EMP;
-- * SUPPORT TO  ONLY  COUNT FUNCTION
SELECT COUNT(*) AS [NUMBER OF EMP] FROM EMP;
-- IT GIVES ERROR BECAUSE HERE MULTIPLE ARG PASSED  
select COUNT (1,2,3,5) 
select COUNT('PUNE') + COUNT (123456789) 


ALTER TABLE EMP ADD EMP_DEPT VARCHAR(30);
--SP_HELP EMP;

UPDATE EMP SET EMP_DEPT = 'HR' WHERE EMP_ID=1;
UPDATE EMP SET EMP_DEPT = 'Finance' WHERE EMP_ID = 2;
UPDATE EMP SET EMP_DEPT = 'HR' WHERE EMP_ID = 3;
UPDATE EMP SET EMP_DEPT = 'Marketing' WHERE EMP_ID = 4;
UPDATE EMP SET EMP_DEPT = 'HR' WHERE EMP_ID = 5;
UPDATE EMP SET EMP_DEPT = 'Finance' WHERE EMP_ID = 6;
UPDATE EMP SET EMP_DEPT = 'Finance' WHERE EMP_ID = 7;
UPDATE EMP SET EMP_DEPT = 'Marketing' WHERE EMP_ID = 8;
UPDATE EMP SET EMP_DEPT = 'HR' WHERE EMP_ID = 9;
UPDATE EMP SET EMP_DEPT = 'Admin' WHERE EMP_ID = 10;

SELECT * FROM EMP;
--Find the total salary paid to each department.
SELECT EMP_DEPT, SUM(EMP_SAL) [TOTAL SALARY] FROM EMP 
GROUP BY EMP_DEPT;

--Find the average salary of each department.
SELECT EMP_DEPT, AVG(EMP_SAL) [AVG SALARY] FROM EMP 
GROUP BY EMP_DEPT;

--Find the maximum salary in each department.
SELECT EMP_DEPT, MAX(EMP_SAL) [MAX SALARY] FROM EMP 
GROUP BY EMP_DEPT;


--Find the number of employees in each department.
SELECT EMP_DEPT, COUNT(*) [TOTAL EMP] FROM EMP
GROUP BY EMP_DEPT;

--Find departments where the total salary is greater than 8000.
SELECT EMP_DEPT, SUM(EMP_SAL) AS [TOTAL SALARY] FROM EMP
GROUP BY EMP_DEPT
HAVING  SUM(EMP_SAL) > 8000 





--Important Rule
--Use WHERE for row-level filtering before grouping. Use HAVING for filtering grouped results based on aggregate values. Pay attention to NULL behavior, especially COUNT(*) versus COUNT(column).


CREATE TABLE EMPD(
EMP_ID INT,
EMP_NAME VARCHAR(50),
EMP_DEPT VARCHAR(30),
EMP_CITY VARCHAR(30),
EMP_SAL INT,
EMP_DOJ DATE,
EMP_EMAIL VARCHAR(100)
)

INSERT INTO EMPD 
(EMP_ID, EMP_NAME, EMP_DEPT, EMP_CITY, EMP_SAL, EMP_DOJ, EMP_EMAIL)
VALUES
(1,'Mohit','IT','PUNE',3000,'2021-01-14','mohit@gmail.com'),
(2,'Sumit','HR','MUMBAI',3500,'2021-03-01','sumit@gmail.com'),
(3,'Shital','IT','DELHI',3000,'2022-05-11',NULL),
(4,'Priyanka','FINANCE','NAGPUR',4000,'2021-08-14','priyanka@gmail.com'),
(5,'Praveen','IT','HYDERABAD',5500,'2020-05-28','praveen@gmail.com'),
(6,'Rajesh','SALES','KOTA',6500,'2022-07-14',NULL),
(7,'Rohit','SALES','KOTA',4500,'2022-09-14','rohit@gmail.com'),
(8,'Sumita','HR','WARDHA',2800,'2023-01-14','sumita@gmail.com'),
(9,'Amit','IT','PUNE',5200,'2022-12-10',NULL),
(10,'Ankit','SALES','MUMBAI',7200,'2023-02-18','ankit@gmail.com'),
(11,'Sneha','FINANCE','NAGPUR',4800,'2022-11-25','sneha@gmail.com'),
(12,'Raj','SALES','KOTA',6500,'2023-01-10','raj@gmail.com'),
(13,'Neha','IT','DELHI',3900,'2021-06-15',NULL),
(14,'Vikas','IT','PUNE',6100,'2020-11-20','vikas@gmail.com'),
(15,'Pooja','HR','MUMBAI',4400,'2022-04-18','pooja@gmail.com'),
(16,'Rakesh','FINANCE','HYDERABAD',5700,'2021-12-05',NULL),
(17,'Kiran','FINANCE','NAGPUR',3200,'2023-03-12','kiran@gmail.com'),
(18,'Meena','SALES','KOTA',7000,'2020-08-25','meena@gmail.com'),
(19,'Suresh','IT','PUNE',3600,'2021-09-17',NULL),
(20,'Nitin','HR','MUMBAI',4900,'2022-10-11','nitin@gmail.com'),
(21,'Rahul','IT','PUNE',NULL,'2023-04-20','rahul@gmail.com'),
(22,'Riya','FINANCE','NAGPUR',NULL,'2022-06-18',NULL),
(23,'Ramesh','SALES','KOTA',5800,NULL,'ramesh@gmail.com'),
(24,'Sunita','HR','DELHI',4200,NULL,NULL),
(25,'Rohan','IT','MUMBAI',5600,'2023-05-15','rohan@gmail.com'),
(26,'Seema','HR','PUNE',3900,'2023-06-20','seema@gmail.com'),
(27,'Ravi','SALES','NAGPUR',4700,'2022-08-12','ravi@gmail.com'),
(28,'Sonal','FINANCE','PUNE',6200,'2021-10-30','sonal@gmail.com'),
(29,'Sachin','IT','MUMBAI',5100,'2020-09-22',NULL),
(30,'Rekha','HR','KOTA',4300,'2022-02-14','rekha@gmail.com');

SELECT * FROM EMPD;

--Find the total number of employees in the EMPLOYEE table.
SELECT COUNT(*) AS TOTAL_EMPLOYEES FROM EMPD 

--Find the total number of employee records and the number of employees having a non-NULL salary.
--•	Display TOTAL_RECORDS and EMPLOYEES_WITH_SALARY.
--	Use COUNT(*) and COUNT(EMP_SAL).

SELECT COUNT(*) AS TOTAL_RECORDS , COUNT(EMP_SAL) AS EMPLOYEES_WITH_SALARY FROM EMPD;

--Display the number of employees in each department.
/* •	Display EMP_DEPT and TOTAL_EMPLOYEES.
•	Use GROUP BY EMP_DEPT.
•	Sort by TOTAL_EMPLOYEES descending.
*/
SELECT EMP_DEPT, COUNT(*) AS TOTAL_EMPLOYEES FROM EMPD GROUP BY EMP_DEPT ORDER BY COUNT(*) DESC;

--For each department, display total salary and average salary.
/*•	Display EMP_DEPT, TOTAL_SALARY and AVG_SALARY.
•	Use SUM(), AVG() and GROUP BY.
•	Sort by TOTAL_SALARY descending.
*/
SELECT EMP_DEPT,SUM(EMP_SAL) AS TOTAL_SAL, AVG(EMP_SAL) AS AVG_SAL FROM EMPD GROUP BY EMP_DEPT ORDER BY SUM(EMP_SAL) DESC ;

-- For each department, find the minimum and maximum available salary.
/*For each department, find the minimum and maximum available salary.
•	Display EMP_DEPT, MIN_SALARY and MAX_SALARY.
•	Use MIN(), MAX() and GROUP BY.
*/
SELECT EMP_DEPT, MIN(EMP_SAL) AS MIN_SALARY, MAX(EMP_SAL) AS MAX_SAL FROM EMPD GROUP BY EMP_DEPT;

/* 6 For employees whose salary is greater than 3500, find employee count and average salary for each department.
•	Use WHERE before GROUP BY.
•	Display EMP_DEPT, EMPLOYEE_COUNT and AVG_SALARY.
•	Sort by AVG_SALARY descending.
*/
SELECT EMP_DEPT, COUNT(*) AS EMPLOYEE_COUNT, AVG(EMP_SAL) AS AVG_SALARY FROM EMPD WHERE EMP_SAL > 3500 GROUP BY EMP_DEPT ORDER BY AVG(EMP_SAL)

/* 7 Find departments having more than 3 employees.
•	Display EMP_DEPT and TOTAL_EMPLOYEES.
•	Use GROUP BY and HAVING.
*/
select EMP_DEPT ,COUNT(*) AS TOTAL_EMPLOYEES FROM EMPD GROUP BY EMP_DEPT HAVING COUNT(*) > 3;

/*Q8. 
Find departments whose average salary is greater than 4500.
•	Display EMP_DEPT and AVG_SALARY.
•	Use GROUP BY and HAVING.
•	Sort by AVG_SALARY descending.
*/
SELECT EMP_DEPT, AVG(EMP_SAL) AS AVG_SALARY FROM EMPD GROUP BY EMP_DEPT ORDER BY AVG(EMP_SAL) DESC;
SELECT AVG((3000+3000+5500+5200+3900+6100+3600+5600+5100)/9)
SELECT* FROM EMPD WHERE EMP_DEPT = 'HR' AND EMP_CITY IN ('PUNE','MUMBAI','KOTA');
SELECT * FROM EMPD;
/*Q9. WHERE + GROUP BY + HAVING
For employees from PUNE, MUMBAI and KOTA only, calculate total salary for each department.
•	Salary must be >= 3500.
•	Show only departments whose total salary is > 12000.
•	Use IN, WHERE, GROUP BY and HAVING.
•	Sort by TOTAL_SALARY descending.
*/
SELECT EMP_DEPT,COUNT(*),SUM(EMP_SAL) AS TOTAL_SALARY FROM EMPD WHERE EMP_CITY IN ('PUNE','MUMBAI','KOTA') AND EMP_SAL >= 3500
GROUP BY EMP_DEPT;

/*Q10. LIKE + GROUP BY
Find the number of employees whose names start with 'R' for each department.
•	Use LIKE 'R%'.
•	Display EMP_DEPT and TOTAL_EMPLOYEES.
•	Group by department and sort by count descending.
*/

SELECT EMP_DEPT,COUNT(*) TOTAL_EMPLOYEES FROM EMPD WHERE EMP_NAME LIKE 'R%' GROUP BY EMP_DEPT ORDER BY TOTAL_EMPLOYEES DESC




/*Q11. NULL + GROUP BY + COUNT
For each department, display total employee records and number of employees having an email address.
•	Use COUNT(*) for total records.
•	Use COUNT(EMP_EMAIL) for non-NULL emails.
•	Sort by EMAIL_AVAILABLE descending.
*/
SELECT EMP_DEPT, COUNT(*) [TOTAL EMPLOYES],COUNT(EMP_EMAIL) [EMAIL AVAILABLE] 
FROM EMPD 
GROUP BY EMP_DEPT 
ORDER BY [EMAIL AVAILABLE]  DESC

SELECT EMP_DEPT,EMP_EMAIL, COUNT(*) [TOTAL EMPLOYES],COUNT(EMP_EMAIL) [EMAIL AVAILABLE] FROM EMPD GROUP BY EMP_DEPT,EMP_EMAIL ORDER BY EMP_DEPT DESC


/*Q12. Department Salary Calculation
For each department calculate total salary, average salary and annualized total salary.
•	ANNUAL_TOTAL_SALARY = SUM(EMP_SAL) * 12.
•	Show only departments with TOTAL_SALARY > 15000.
•	Use GROUP BY, HAVING and ORDER BY.
*/
SELECT SUM(EMP_SAL) AS [TOTAL_SAL],AVG(EMP_SAL) [AVERAGE SAL] 
FROM EMPD 
GROUP BY EMP_DEPT 
HAVING SUM(EMP_SAL) > 30000;

/*Q13. City Analysis
For each city, find employee count and average salary for employees whose salary is NOT NULL.
•	Use IS NOT NULL and GROUP BY.
•	Show only cities having at least 3 employees.
•	Sort by AVG_SALARY descending.
*/
SELECT *
FROM EMPD
ORDER BY EMP_CITY

SELECT EMP_CITY,COUNT(*) [TOTAL EMP], AVG(EMP_SAL) AS [AVG SALARY]  FROM EMPD
WHERE EMP_SAL IS NOT NULL
GROUP BY EMP_CITY
HAVING COUNT(*) > 3;


/*Q14. Business Challenge – High Value Departments
Identify departments meeting all the following conditions:
•	Salary is NOT NULL and between 3500 and 7000.
•	At least 4 qualifying employees.
•	Total qualifying salary > 18000.
•	Average qualifying salary > 4500.
•	Display EMP_DEPT, EMPLOYEE_COUNT, TOTAL_SALARY and AVG_SALARY.
•	Use WHERE, GROUP BY, HAVING and ORDER BY.
*/
SELECT EMP_DEPT FROM EMPD  
WHERE EMP_SAL IS NULL 
GROUP BY EMP_DEPT

SELECT  EMP_DEPT, COUNT(*) [TOTAL EMP],SUM(EMP_SAL) [TOTAL SAL], AVG(EMP_SAL) [AVG SAL] FROM EMPD
WHERE EMP_SAL IS NOT NULL AND EMP_SAL BETWEEN 3500 AND 7000
GROUP BY EMP_DEPT HAVING COUNT(*) >=4 AND SUM(EMP_SAL) > 25000 AND AVG(EMP_SAL) >4500

/*Q15. FINAL CHALLENGE – Department Performance Report
Create a department-level performance report using one SELECT statement.
•	Salary is NOT NULL.
•	City is PUNE, MUMBAI, KOTA or NAGPUR.
•	Name starts with R or S.
•	Salary is between 3500 and 7000.
•	Group by EMP_DEPT.
•	Calculate COUNT, SUM, AVG, MIN and MAX salary.
•	Keep departments with at least 2 qualifying employees.
•	Keep departments with TOTAL_SALARY > 9000.
•	Calculate ANNUAL_TOTAL_SALARY = SUM(EMP_SAL) * 12.
•	Sort by TOTAL_SALARY DESC and AVG_SALARY DESC.
•	Use WHERE, LIKE, IN, BETWEEN, IS NOT NULL, GROUP BY, aggregates, HAVING and ORDER BY.
*/
SELECT EMP_DEPT ,COUNT(*) [TOTAL EMP],SUM(EMP_SAL) [TOTAL SAL],AVG(EMP_SAL) AS [AVG SAL], MIN(EMP_SAL) AS [MIN SAL],MAX(EMP_SAL) [MAX SAL] ,
ANNUAL_TOTAL_SALARY = SUM(EMP_SAL) * 12 FROM EMPD 
WHERE EMP_SAL IS NOT NULL AND EMP_CITY IN ('PUNE','MUMBAI','KOTA','NAGPUR') AND EMP_NAME LIKE '[RS]%'
GROUP BY EMP_DEPT
HAVING COUNT(*)  > 2 AND SUM(EMP_SAL) > 9000
ORDER BY [TOTAL SAL] DESC, [AVG SAL] DESC

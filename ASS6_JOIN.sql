use company;
--PART A – 5 THEORETICAL INTERVIEW QUESTIONS
--Q1. What is a SQL JOIN?
--Explain why JOINs are used in relational databases and why data is commonly stored across multiple related
tables.
joins is used to extract the data when we need to extratct data from both table anf if their is relationship 
between them.
Its possible to store all data in one table but created more confusion we were not storing efficient record in hat 
manner 
--Q2. INNER JOIN vs LEFT JOIN
--Explain the difference between INNER JOIN and LEFT JOIN with respect to matched and unmatched records.
inner join extract only the matching records but left join extract all left table record and matched right 
side as well if it not match with left then it replace with null.

--Q3. LEFT JOIN vs RIGHT JOIN
--Explain the difference between LEFT JOIN and RIGHT JOIN. Can changing table order produce the same 
--business result?
left join extract left tble all record and right side matching record and in right join it will extract right 
side all record and only matching record og left side and replace the null value in unmatched record
No, if we change the table order then definetly it will change the result beause we are replacing right eith left then
it gives result according to that
let see one ex:
we have two table student and department if we join that see the result
select * from student;
select * from dept;
insert into dept values
(1,'HR'),
(2,'SALES'),(3,'IT')
SELECT * FROM STUDENT S LEFT JOIN DEPT D ON S.DEPT_ID = D.D_ID
SELECT * FROM STUDENT S RIGHT JOIN DEPT D ON S.DEPT_ID = D.D_ID
SELECT * FROM DEPT D LEFT JOIN STUDENT S ON S.DEPT_ID = D.D_ID
SELECT * FROM DEPT D RIGHT JOIN STUDENT S ON S.DEPT_ID = D.D_ID


--Q4. FULL OUTER JOIN
--Explain what a FULL OUTER JOIN returns for matched records, left-only records and right-only records.
--Q5. NULL Values After JOIN
--Why do NULL values appear after LEFT, RIGHT and FULL OUTER JOIN? How can IS NULL identify unmatched records?
FULL OUTER Join returns all the matched and unmatched record MEANS ALL THE LEFT AND RIGHT TABLE RECORDS and if their
are no entry for any column then it replace it with null
SELECT * FROM STUDENT S FULL JOIN DEPT D ON S.DEPT_ID = D.D_ID
yes, null showes the unmatched record


--PART B – DATABASE SETUP
--Business Scenario
--A company stores employee details and department master details separately. Some employees have no department assignment, while one department currently has no employees. This data supports all four JOIN types.
--Table 1: EMPLOYEE_JOIN
CREATE TABLE EMPLOYEE_JOIN
(
 EMP_ID INT PRIMARY KEY,
 EMP_NAME VARCHAR(50) NOT NULL,
 DEPT_ID INT NULL,
 EMP_CITY VARCHAR(30),
 EMP_SALARY INT
);

--Table 2: DEPARTMENT_JOIN
CREATE TABLE DEPARTMENT_JOIN
(
 DEPT_ID INT PRIMARY KEY,
 DEPT_NAME VARCHAR(50) NOT NULL,
 DEPT_LOCATION VARCHAR(30)
);

--Insert Department Records
INSERT INTO DEPARTMENT_JOIN VALUES
(10,'IT','PUNE'),
(20,'HR','MUMBAI'),
(30,'FINANCE','NAGPUR'),
(40,'SALES','KOTA'),
(50,'OPERATIONS','HYDERABAD'),
(60,'MARKETING','DELHI');

--Insert Employee Records
INSERT INTO EMPLOYEE_JOIN VALUES
(101,'Amit',10,'PUNE',5500),
(102,'Riya',20,'MUMBAI',4800),
(103,'Rohan',10,'PUNE',6500),
(104,'Sneha',30,'NAGPUR',5200),
(105,'Raj',40,'KOTA',7000),
(106,'Seema',20,'PUNE',4300),
(107,'Ravi',40,'MUMBAI',6200),
(108,'Pooja',30,'NAGPUR',5100),
(109,'Sachin',10,'PUNE',5900),
(110,'Neha',NULL,'DELHI',4500),
(111,'Kiran',50,'HYDERABAD',5400),
(112,'Meena',NULL,'KOTA',4700),
(113,'Rakesh',40,'KOTA',6800),
(114,'Sunita',20,'MUMBAI',4600);

SELECT * FROM EMPLOYEE_JOIN;
SELECT * FROM DEPARTMENT_JOIN;

--•	MARKETING has no employees.
--•	Neha and Meena have no department assignment.
--•	All other assigned DEPT_ID values match the department master.
 
--PART C – 15 BUSINESS SCENARIO SQL QUESTIONS
--Q6. Employee Department Directory
--HR needs only employees assigned to a valid department.
--•	Display EMP_ID, EMP_NAME, DEPT_NAME and DEPT_LOCATION.
--•	Use the JOIN that returns only matching records.
--•	Sort by department and employee name.
select EMP_ID, EMP_NAME, DEPT_NAME,DEPT_LOCATION from EMPLOYEE_JOIN as EJ JOIN DEPARTMENT_JOIN as DJ 
ON ej.dept_id = dj.dept_id
order by dept_name,emp_name ;

--Q7. Employee Profile Report
--Management needs employee name, city, salary and department details only for employees having a valid
--department.
--•	Display EMP_NAME, EMP_CITY, EMP_SALARY and DEPT_NAME.
--•	Sort by salary descending.
select  EMP_NAME,EMP_CITY,EMP_SALARY, DEPT_NAME from EMPLOYEE_JOIN as EJ JOIN DEPARTMENT_JOIN as DJ 
ON ej.dept_id = dj.dept_id
ORDER BY EMP_SALARY ;
--Q8. Department-wise Employee Count
--HR wants employee count for every department, including departments with zero employees.
--•	Display DEPT_NAME and TOTAL_EMPLOYEES.
--•	Use the appropriate OUTER JOIN.
--•	Use GROUP BY and ORDER BY.
SELECT DEPT_NAME,COUNT(EMP_NAME) AS TOTAL_EMPLOYEES FROM EMPLOYEE_JOIN EJ RIGHT JOIN DEPARTMENT_JOIN DJ
ON EJ.DEPT_ID = DJ.DEPT_ID
GROUP BY DEPT_NAME
ORDER BY TOTAL_EMPLOYEES
--Q9. Complete Employee Report
--Every employee must appear even if a department is not assigned.
--•	Display EMP_ID, EMP_NAME, DEPT_ID and DEPT_NAME.
--•	Choose the JOIN based on this requirement.
--•	Sort by EMP_ID.
SELECT EMP_ID, EMP_NAME, EJ.DEPT_ID ,DEPT_NAME FROM EMPLOYEE_JOIN EJ LEFT JOIN DEPARTMENT_JOIN DJ
ON EJ.DEPT_ID = DJ.DEPT_ID
ORDER BY EMP_ID

--Q10. Employees Without Department
--Identify employees who are not assigned to any department.
--•	Use an OUTER JOIN and IS NULL.
--•	Display EMP_ID, EMP_NAME and EMP_CITY.
SELECT EMP_ID, EMP_NAME,EMP_CITY,DEPT_NAME FROM EMPLOYEE_JOIN EJ LEFT JOIN DEPARTMENT_JOIN DJ
ON EJ.DEPT_ID = DJ.DEPT_ID 
WHERE EJ.DEPT_ID IS NULL

--Q11. Department Master Report
--Display every department with employee information where available.
--•	Ensure MARKETING appears even though it has no employees.
--•	Display DEPT_NAME, DEPT_LOCATION and EMP_NAME.
SELECT DEPT_NAME, DEPT_LOCATION,EMP_NAME FROM EMPLOYEE_JOIN EJ RIGHT JOIN DEPARTMENT_JOIN DJ
ON EJ.DEPT_ID = DJ.DEPT_ID
--Q12. Department Staffing Gap
--Find departments that currently have no employees.
--•	Use an OUTER JOIN and IS NULL.
--•	Display DEPT_ID, DEPT_NAME and DEPT_LOCATION.
SELECT EJ.DEPT_ID,DJ.DEPT_ID,DEPT_NAME, DEPT_LOCATION FROM EMPLOYEE_JOIN EJ RIGHT JOIN DEPARTMENT_JOIN DJ
ON EJ.DEPT_ID = DJ.DEPT_ID
WHERE EJ.DEPT_ID IS NULL

--Q13. RIGHT JOIN Practice
--The DEPARTMENT table is treated as the master list and every department must be displayed.
--•	Use RIGHT JOIN.
--•	Place EMPLOYEE_JOIN on the left side.
--•	Display DEPT_NAME, DEPT_LOCATION, EMP_ID and EMP_NAME.
SELECT DEPT_NAME, DEPT_LOCATION, EMP_ID,EMP_NAME FROM EMPLOYEE_JOIN EJ RIGHT JOIN DEPARTMENT_JOIN DJ
ON EJ.DEPT_ID = DJ.DEPT_ID
SELECT * FROM DEPARTMENT_JOIN
SELECT * FROM EMPLOYEE_JOIN

--Q14. Complete Organization Mapping
--Data governance needs matched records plus employees without departments and departments without employees.
--•	Use FULL OUTER JOIN.
--•	Display employee and department details.
--•	Do not remove NULL records.
SELECT EMP_ID,EMP_NAME,EMP_CITY,EMP_SALARY,DJ.DEPT_ID,DEPT_NAME,DEPT_LOCATION 
FROM EMPLOYEE_JOIN EJ FULL JOIN DEPARTMENT_JOIN DJ
ON EJ.DEPT_ID = DJ.DEPT_ID

--Q15. Join Reconciliation
--Identify records existing only on one side of the employee-department relationship.
--•	Use FULL OUTER JOIN.
--•	Return only unmatched records using appropriate IS NULL conditions.
SELECT *
FROM EMPLOYEE_JOIN EJ FULL JOIN DEPARTMENT_JOIN DJ
ON EJ.DEPT_ID = DJ.DEPT_ID
WHERE EJ.DEPT_ID IS NULL OR DJ.DEPT_ID IS NULL;
--Q16. High Salary Employees
--Compensation team needs employees earning more than 5500 with department details.
--•	Display EMP_NAME, EMP_SALARY and DEPT_NAME.
--•	Use WHERE EMP_SALARY > 5500.
--•	Sort by salary descending.
SELECT EMP_NAME, EMP_SALARY,DEPT_NAME
FROM EMPLOYEE_JOIN EJ  JOIN DEPARTMENT_JOIN DJ
ON EJ.DEPT_ID = DJ.DEPT_ID
WHERE EMP_SALARY > 5500
ORDER BY EMP_SALARY DESC;
--Q17. Top 5 Paid Employees
--Management wants the TOP 5 highest-paid employees with department and location.
--•	Use TOP 5.
--•	Display employee, salary, department and department location.
--•	Sort by EMP_SALARY DESC.
SELECT TOP 5 EMP_ID,EMP_NAME,EMP_CITY,EMP_SALARY,DEPT_NAME,DEPT_LOCATION FROM EMPLOYEE_JOIN EJ  JOIN DEPARTMENT_JOIN DJ
ON EJ.DEPT_ID = DJ.DEPT_ID
ORDER BY EMP_SALARY DESC
--Q18. Department Salary Analytics
--Finance needs department-wise employee count, total salary and average salary.
--•	Display DEPT_NAME, TOTAL_EMPLOYEES, TOTAL_SALARY and AVG_SALARY.
--•	Use aggregate functions and GROUP BY.
--•	Sort by total salary descending.
SELECT * FROM DEPARTMENT_JOIN
SELECT DEPT_NAME,COUNT(EMP_NAME) TOTAL_EMPLOYEES,SUM(EMP_SALARY) TOTAL_SALARY,AVG(EMP_SALARY) AVG_SALARY
FROM EMPLOYEE_JOIN EJ RIGHT JOIN DEPARTMENT_JOIN DJ
ON EJ.DEPT_ID = DJ.DEPT_ID
GROUP BY DEPT_NAME

--Q19. High Value Departments
--Find departments where average employee salary is greater than 5500.
--•	Use JOIN, GROUP BY and HAVING.
--•	Display DEPT_NAME and AVG_SALARY.
--•	Sort by average salary descending.
SELECT DEPT_NAME, AVG(EMP_SALARY) AVG_SALARY FROM EMPLOYEE_JOIN EJ RIGHT JOIN DEPARTMENT_JOIN DJ
ON EJ.DEPT_ID = DJ.DEPT_ID
GROUP BY DEPT_NAME
HAVING AVG(EMP_SALARY) > 5500

--Q20. FINAL – Workforce Coverage Dashboard
--Create a management-ready department workforce report.
--•	Include every department, including zero-employee departments.
--•	Display DEPT_NAME, TOTAL_EMPLOYEES, TOTAL_SALARY and AVG_SALARY.
--•	For employees, consider salary between 4500 and 7000.
--•	Show departments with at least 2 qualifying employees OR zero employees.
--•	Use JOIN, careful filtering, GROUP BY, HAVING and ORDER BY.
--•	Write one line explaining why your JOIN is appropriate.
SELECT * FROM EMPLOYEE_JOIN
SELECT * FROM DEPARTMENT_JOIN
--SELECT DEPT_NAME,COUNT(EMP_ID) TOTAL_EMPLOYEES, SUM(EMP_SALARY) TOTAL_SALARY, AVG(EMP_SALARY) AVG_SALARY
--FROM EMPLOYEE_JOIN EJ RIGHT JOIN DEPARTMENT_JOIN DJ 
--ON EJ.DEPT_ID = DJ.DEPT_ID
--WHERE EMP_SALARY BETWEEN 4500 AND 7000
--GROUP BY DEPT_NAME
--HAVING COUNT(EMP_NAME) >= 2 OR COUNT(EMP_NAME) = 0
 
SELECT DEPT_NAME,COUNT(EMP_ID) TOTAL_EMPLOYEES, SUM(EMP_SALARY) TOTAL_SALARY, AVG(EMP_SALARY) AVG_SALARY
FROM EMPLOYEE_JOIN EJ RIGHT JOIN DEPARTMENT_JOIN DJ 
ON EJ.DEPT_ID = DJ.DEPT_ID AND EMP_SALARY BETWEEN 4500 AND 7000
GROUP BY DEPT_NAME
HAVING COUNT(EMP_NAME) >= 2 OR COUNT(EMP_NAME) = 0
--PART D – INTERVIEW LEARNING FOCUS
--•	Choose JOIN based on business requirements, not memorized syntax.
--•	Understand which table must remain fully visible.
--•	Use INNER JOIN for matched records only.
--•	Use OUTER JOIN when missing relationships matter.
--•	Use IS NULL to identify unmatched records.
--•	Be able to explain your JOIN selection in business language.
--•	Combine JOINs with WHERE, TOP, ORDER BY, GROUP BY and HAVING.
--Submission Checklist
--•	☐ 5 theoretical questions answered.
--•	☐ 15 practical business scenarios completed.
--•	☐ Both tables created and records inserted.
--•	☐ INNER, LEFT, RIGHT and FULL OUTER JOIN practiced.
--•	☐ Unmatched records identified.
--•	☐ Aggregate JOIN questions completed.
--•	☐ Final dashboard challenge completed.
--Business Requirement → Identify Matching Need → Choose JOIN → Filter → Aggregate → Present Result

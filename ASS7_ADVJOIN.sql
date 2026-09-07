--PART B – DATABASE SETUP (3 TABLES)
--Business Scenario
--A company maintains employee information, department master data and salary grade information. Employees may report to another employee as their manager. Salary grades are assigned using salary ranges, making the dataset suitable for two-table joins, three-table joins, SELF JOIN and NON-EQUI JOIN practice.
--Table 1 – EMPLOYEE
CREATE TABLE EMPLOYEE_JOIN_ADV
(
 EMP_ID INT PRIMARY KEY,
 EMP_NAME VARCHAR(50) NOT NULL,
 DEPT_ID INT NULL,
 MANAGER_ID INT NULL,
 EMP_CITY VARCHAR(30),
 EMP_SALARY INT,
 EMP_EMAIL VARCHAR(100)
);
--Table 2 – DEPARTMENT
CREATE TABLE DEPARTMENT_JOIN_ADV
(
 DEPT_ID INT PRIMARY KEY,
 DEPT_NAME VARCHAR(50) NOT NULL,
 DEPT_LOCATION VARCHAR(30)
);
--Table 3 – SALARY_GRADE
CREATE TABLE SALARY_GRADE
(
 GRADE_ID INT PRIMARY KEY,
 GRADE_NAME VARCHAR(20) NOT NULL,
 MIN_SALARY INT,
 MAX_SALARY INT
);
--Insert Department Records
INSERT INTO DEPARTMENT_JOIN_ADV VALUES
(10,'IT','PUNE'),
(20,'HR','MUMBAI'),
(30,'FINANCE','NAGPUR'),
(40,'SALES','KOTA'),
(50,'OPERATIONS','HYDERABAD'),
(60,'MARKETING','DELHI');
--Insert Salary Grade Records
INSERT INTO SALARY_GRADE VALUES
(1,'JUNIOR',3000,4499),
(2,'ASSOCIATE',4500,5499),
(3,'SENIOR',5500,6499),
(4,'LEAD',6500,7499),
(5,'MANAGER',7500,9000);

--Insert Employee Records
INSERT INTO EMPLOYEE_JOIN_ADV VALUES
(101,'Amit',10,109,'PUNE',5500,'amit@gmail.com'),
(102,'Riya',20,110,'MUMBAI',4800,'riya@gmail.com'),
(103,'Rohan',10,109,'PUNE',6500,'rohan@gmail.com'),
(104,'Sneha',30,111,'NAGPUR',5200,'sneha@gmail.com'),
(105,'Raj',40,112,'KOTA',7000,'raj@gmail.com'),
(106,'Seema',20,110,'PUNE',4300,'seema@gmail.com'),
(107,'Ravi',40,112,'MUMBAI',6200,'ravi@gmail.com'),
(108,'Pooja',30,111,'NAGPUR',5100,'pooja@gmail.com'),
(109,'Sachin',10,NULL,'PUNE',8200,'sachin@gmail.com'),
(110,'Neha',20,NULL,'MUMBAI',7800,'neha@gmail.com'),
(111,'Kiran',30,NULL,'NAGPUR',7600,'kiran@gmail.com'),
(112,'Rakesh',40,NULL,'KOTA',8000,'rakesh@gmail.com'),
(113,'Meena',NULL,109,'DELHI',4700,NULL),
(114,'Sunita',50,112,'HYDERABAD',5400,'sunita@gmail.com'),
(115,'Rohan Kumar',10,109,'PUNE',5900,'rohank@gmail.com'),
(116,'Priya',NULL,NULL,'DELHI',NULL,'priya@gmail.com'),
(117,'Suresh',50,112,'HYDERABAD',4500,'suresh@gmail.com'),
(118,'Rahul',40,112,'KOTA',6800,NULL);
--Verify Data
SELECT * FROM EMPLOYEE_JOIN_ADV;
SELECT * FROM DEPARTMENT_JOIN_ADV;
SELECT * FROM SALARY_GRADE;

--Data Conditions for Practice
--•	MARKETING has no employees.
--•	Some employees have DEPT_ID as NULL.
--•	Some employees are managers and have MANAGER_ID as NULL.
--•	MANAGER_ID refers to EMP_ID in the same EMPLOYEE table.
--•	SALARY_GRADE is matched using salary ranges, not equality.
--•	One employee has EMP_SALARY as NULL for NULL-handling practice.
 
--PART C – 30 BUSINESS SCENARIO SQL QUESTIONS
--Q11. Employee Department Directory
--HR needs only employees who have a matching department.
--•	Use a two-table join.
--•	Display EMP_ID, EMP_NAME, DEPT_NAME and DEPT_LOCATION.
--•	Sort by department and employee name.
SELECT EMP_ID, EMP_NAME, DEPT_NAME,DEPT_LOCATION FROM EMPLOYEE_JOIN_ADV EJ JOIN DEPARTMENT_JOIN_ADV DJ
ON EJ.DEPT_ID = DJ.DEPT_ID
ORDER BY DEPT_NAME, EMP_NAME

--Q12. Complete Employee Department Report
--Management wants every employee displayed, even if a department is not assigned.
--•	Display EMP_ID, EMP_NAME, EMP_CITY and DEPT_NAME.
--•	Choose the correct OUTER JOIN.
--•	Sort by EMP_ID.
SELECT EMP_ID,EMP_NAME,EMP_CITY,DEPT_NAME FROM EMPLOYEE_JOIN_ADV EJ LEFT JOIN DEPARTMENT_JOIN_ADV DJ
ON EJ.DEPT_ID = DJ.DEPT_ID
ORDER BY EMP_ID

--Q13. Employees Without Department Assignment
--HR wants employees who do not currently have a matching department.
--•	Use an OUTER JOIN and IS NULL.
--•	Display EMP_ID, EMP_NAME and EMP_CITY.
SELECT EMP_ID,EMP_NAME,EMP_CITY,DEPT_NAME FROM EMPLOYEE_JOIN_ADV EJ LEFT JOIN DEPARTMENT_JOIN_ADV DJ
ON EJ.DEPT_ID = DJ.DEPT_ID
WHERE EJ.DEPT_ID IS NULL
--Q14. Department Master Coverage
--Every department must appear even when no employees are assigned.
--•	Display DEPT_ID, DEPT_NAME, EMP_ID and EMP_NAME.
--•	Ensure MARKETING appears.
SELECT DJ.DEPT_ID, DEPT_NAME,EMP_ID,EMP_NAME FROM EMPLOYEE_JOIN_ADV EJ RIGHT JOIN DEPARTMENT_JOIN_ADV DJ
ON EJ.DEPT_ID = DJ.DEPT_ID
--Q15. Department Staffing Gap
--Find departments that currently have zero employees.
--•	Use an OUTER JOIN and IS NULL.
--•	Display department details.
SELECT * FROM EMPLOYEE_JOIN_ADV EJ RIGHT JOIN DEPARTMENT_JOIN_ADV DJ
ON EJ.DEPT_ID = DJ.DEPT_ID
WHERE EJ.DEPT_ID IS NULL
--Q16. FULL OUTER JOIN Reconciliation
--Show matched records plus employees without departments and departments without employees.
--•	Use FULL OUTER JOIN.
--•	Display employee and department identifiers/names.
SELECT emp_id,emp_name,dj.dept_id,dept_name,dept_location FROM EMPLOYEE_JOIN_ADV EJ FULL JOIN DEPARTMENT_JOIN_ADV DJ
ON EJ.DEPT_ID = DJ.DEPT_ID

--Q17. Unmatched Relationship Report
--Identify only records existing on one side of Employee–Department relationship.
--•	Use FULL OUTER JOIN.
--•	Return only unmatched records.
SELECT * FROM EMPLOYEE_JOIN_ADV EJ full JOIN DEPARTMENT_JOIN_ADV DJ
ON EJ.DEPT_ID = DJ.DEPT_ID
where ej.dept_id is null
--Q18. High Salary Employee Department Report
--Compensation needs employees earning more than 5500 with department details.
--•	Use WHERE EMP_SALARY > 5500.
--•	Sort by salary descending.
SELECT * FROM EMPLOYEE_JOIN_ADV EJ LEFT JOIN DEPARTMENT_JOIN_ADV DJ
ON EJ.DEPT_ID = DJ.DEPT_ID
WHERE EMP_SALARY > 5500
ORDER BY EMP_SALARY DESC;
--Q19. Top 5 Employees with Department
--Management wants TOP 5 highest-paid employees with department details.
--•	Use TOP 5.
--•	Sort by EMP_SALARY DESC.
SELECT TOP 5 * FROM EMPLOYEE_JOIN_ADV EJ LEFT JOIN DEPARTMENT_JOIN_ADV DJ
ON EJ.DEPT_ID = DJ.DEPT_ID
ORDER BY EMP_SALARY DESC;

--Q20. Department Salary Analytics
--Finance wants employee count, total salary and average salary for each department.
--•	Use JOIN, COUNT, SUM, AVG and GROUP BY.
SELECT  EJ.DEPT_ID FROM EMPLOYEE_JOIN_ADV EJ RIGHT JOIN DEPARTMENT_JOIN_ADV DJ
ON EJ.DEPT_ID = DJ.DEPT_ID
GROUP BY EJ.DEPT_ID
SELECT  DEPT_NAME ,COUNT(EMP_NAME) EMPLOYEE_COUNT, SUM(EMP_SALARY) TOTAL_SALARY,AVG(EMP_SALARY) AVERAGE_SALARY
FROM EMPLOYEE_JOIN_ADV EJ RIGHT JOIN DEPARTMENT_JOIN_ADV DJ
ON EJ.DEPT_ID = DJ.DEPT_ID
GROUP BY DEPT_NAME
SELECT * FROM DEPARTMENT_JOIN_ADV
--Q21. Three-Table Employee Dashboard
--Combine Employee, Department and Salary Grade information.
--•	Display EMP_NAME, DEPT_NAME, EMP_SALARY and GRADE_NAME.
--•	Use equality relationship plus salary-range matching.
SELECT * FROM SALARY_GRADE
SELECT * FROM EMPLOYEE_JOIN_ADV 
SELECT EMP_NAME, DEPT_NAME, EMP_SALARY, GRADE_NAME FROM EMPLOYEE_JOIN_ADV EJ JOIN DEPARTMENT_JOIN_ADV DJ 
ON EJ.DEPT_ID = DJ.DEPT_ID JOIN SALARY_GRADE SG 
ON EJ.EMP_SALARY >= SG.MIN_SALARY AND EJ.EMP_SALARY <= SG.MAX_SALARY

--Q22. Three-Table Workforce Classification
--Show all employees with department details and salary grade.
--•	Include employees without departments.
--•	Handle NULL salary appropriately.
SELECT * FROM EMPLOYEE_JOIN_ADV EJ left JOIN DEPARTMENT_JOIN_ADV DJ 
ON EJ.DEPT_ID = DJ.DEPT_ID left JOIN SALARY_GRADE SG 
ON EJ.EMP_SALARY >= SG.MIN_SALARY AND EJ.EMP_SALARY <= SG.MAX_SALARY
order by emp_salary desc

--Q23. Department and Salary Grade Analysis
--Show employee distribution across departments and salary grades.
--•	Use all three tables.
--•	Display DEPT_NAME, GRADE_NAME and TOTAL_EMPLOYEES.
--•	Use GROUP BY.
SELECT DEPT_NAME,GRADE_NAME,count(emp_name) TOTAL_EMPLOYEES FROM EMPLOYEE_JOIN_ADV EJ left JOIN DEPARTMENT_JOIN_ADV DJ 
ON EJ.DEPT_ID = DJ.DEPT_ID left JOIN SALARY_GRADE SG 
ON EJ.EMP_SALARY between SG.MIN_SALARY AND  SG.MAX_SALARY
group by DEPT_NAME,GRADE_NAME

--Q24. High Value Three-Table Report
--Find employees in IT, SALES or OPERATIONS who belong to SENIOR, LEAD or MANAGER grades.
--•	Use all three tables.
--•	Use IN.
--•	Display employee, department, salary and grade.
SELECT EMP_ID,EMP_NAME,DEPT_NAME,EMP_SALARY,GRADE_NAME 
FROM EMPLOYEE_JOIN_ADV EJ left JOIN DEPARTMENT_JOIN_ADV DJ 
ON EJ.DEPT_ID = DJ.DEPT_ID left JOIN SALARY_GRADE SG 
ON EJ.EMP_SALARY >= SG.MIN_SALARY AND EJ.EMP_SALARY <= SG.MAX_SALARY
where dj.DEPT_NAME in ('IT', 'SALES') or sg.GRADE_NAME in ('SENIOR','LEAD','MANAGER')

--Q25. Top Paid Employees with Grade
--Return TOP 5 highest-paid employees with department and grade.
--•	Use all three tables.
--•	Exclude NULL salary from grade matching.
--•	Sort descending.
SELECT  TOP 5 EMP_ID,EMP_NAME,DEPT_NAME,EMP_SALARY,GRADE_NAME 
FROM EMPLOYEE_JOIN_ADV EJ left JOIN DEPARTMENT_JOIN_ADV DJ 
ON EJ.DEPT_ID = DJ.DEPT_ID left JOIN SALARY_GRADE SG 
ON EJ.EMP_SALARY >= SG.MIN_SALARY AND EJ.EMP_SALARY <= SG.MAX_SALARY
WHERE EMP_SALARY IS NOT NULL
ORDER BY EMP_SALARY DESC
--Q26. SELF JOIN – Employee Manager Directory
--Create an employee-manager hierarchy report.
--•	Use EMPLOYEE table twice.
--•	Display EMPLOYEE_NAME and MANAGER_NAME.
SELECT E1.EMP_ID,E1.EMP_NAME,E2.EMP_NAME MANAGER_NAME 
FROM EMPLOYEE_JOIN_ADV E1 , EMPLOYEE_JOIN_ADV E2
WHERE E1.MANAGER_ID = E2.EMP_ID
SELECT * FROM EMPLOYEE_JOIN_ADV
SELECT 18*18
--Q27. SELF JOIN – Employees Reporting to Sachin
--Find employees directly reporting to Sachin.
--•	Use SELF JOIN.
--•	Display employee and manager names.
SELECT E1.EMP_ID,E1.EMP_NAME,E2.EMP_NAME MANAGER_NAME 
FROM EMPLOYEE_JOIN_ADV E1 , EMPLOYEE_JOIN_ADV E2
WHERE E1.MANAGER_ID = E2.EMP_ID AND E2.EMP_NAME LIKE 'SACHIN'
--Q28. SELF JOIN – Employees Without Manager
--Find employees who do not report to a manager.
--•	Display EMP_ID and EMP_NAME.
--•	Use NULL logic appropriately.
SELECT E1.EMP_ID,E1.EMP_NAME
FROM EMPLOYEE_JOIN_ADV E1
WHERE E1.MANAGER_ID IS NULL
SELECT *
FROM EMPLOYEE_JOIN_ADV E1

SELECT E1.EMP_ID,E1.EMP_NAME,E2.EMP_NAME MANAGER_NAME ,E1.MANAGER_ID
FROM EMPLOYEE_JOIN_ADV E1 , EMPLOYEE_JOIN_ADV E2
WHERE E1.MANAGER_ID IS NULL
--Q29. SELF JOIN – Manager Team Size
--Find each manager and the number of direct reports.
--•	Use SELF JOIN.
--•	Use COUNT and GROUP BY.
SELECT  E2.EMP_NAME,COUNT(E2.EMP_NAME) NO_DIRECT_REPORTS
FROM EMPLOYEE_JOIN_ADV E1 , EMPLOYEE_JOIN_ADV E2
WHERE E1.MANAGER_ID = E2.EMP_ID
GROUP BY E2.EMP_NAME

--Q30. SELF JOIN – Same Manager Colleagues
--Find pairs of employees reporting to the same manager.
--•	Avoid pairing an employee with themselves.
--•	Avoid duplicate pairs.
SELECT e1.manager_id,count(e1.emp_name) 
FROM EMPLOYEE_JOIN_ADV E1 , EMPLOYEE_JOIN_ADV E2
WHERE E1.MANAGER_ID = E2.EMP_ID 
group by e1.manager_id

SELECT * FROM EMPLOYEE_JOIN_ADV E1 , EMPLOYEE_JOIN_ADV E2
select * from EMPLOYEE_JOIN_ADV

SELECT * FROM EMPLOYEE_JOIN_ADV E1 , EMPLOYEE_JOIN_ADV E2
WHERE E1.MANAGER_ID = E2.EMP_ID 
--Q31. CROSS JOIN – Employee Department Planning
--Generate every possible Employee × Department combination.
--•	Use CROSS JOIN.
--•	Display EMP_NAME and DEPT_NAME.
--•	Explain Cartesian product.
select EMP_NAME, DEPT_NAME from EMPLOYEE_JOIN_ADV e1 cross join DEPARTMENT_JOIN_ADV d1
--CT = cartesian product is the cross multiplication of the both yable i.e select 18*6
select * from department_join_adv
--Q32. CROSS JOIN – Location Simulation
--Generate every employee and department-location combination.
--•	Use CROSS JOIN.
--•	Display EMP_NAME and DEPT_LOCATION.
select EMP_NAME,DEPT_LOCATION from EMPLOYEE_JOIN_ADV e1 cross join DEPARTMENT_JOIN_ADV d1
where e1.DEPT_ID = d1.DEPT_ID

select EMP_NAME,DEPT_LOCATION from EMPLOYEE_JOIN_ADV e1 cross join DEPARTMENT_JOIN_ADV d1
where e1.DEPT_ID != d1.DEPT_ID
--Q33. CROSS JOIN – Count Combinations
--Calculate total Employee × Department combinations.
--•	Use CROSS JOIN and COUNT(*).
select count(*) from EMPLOYEE_JOIN_ADV e1 cross join DEPARTMENT_JOIN_ADV d1

--Q34. EQUI JOIN – Standard Relationship
--Match employees to departments using equal DEPT_ID values.
--•	Display EMP_NAME, DEPT_ID and DEPT_NAME.
select EMP_NAME,e1.DEPT_ID,DEPT_NAME from EMPLOYEE_JOIN_ADV e1 , DEPARTMENT_JOIN_ADV D1
where e1.DEPT_ID = d1.DEPT_ID
--Q35. EQUI JOIN – Department Employee Count
--Calculate employee count by department using equality relationship.
--•	Use GROUP BY.
select DEPT_NAME,count(*) emp_count from EMPLOYEE_JOIN_ADV e1 , DEPARTMENT_JOIN_ADV D1
where e1.DEPT_ID = d1.DEPT_ID
group by DEPT_NAME

--Q36. EQUI JOIN – HR and IT Employees
--Display HR or IT employees with department location.
--•	Use equality relationship and IN.
select emp_id,emp_name,e1.dept_id,dept_name,dept_location  from EMPLOYEE_JOIN_ADV e1 , DEPARTMENT_JOIN_ADV D1
where e1.DEPT_ID = d1.DEPT_ID and dept_name in ('hr','it')
--Q37. NON-EQUI JOIN – Salary Grade Mapping
--Map each employee with valid salary to the correct grade.
--•	Use EMP_SALARY BETWEEN MIN_SALARY AND MAX_SALARY.
--•	Display employee, salary and grade.
select emp_name,emp_Salary,grade_name from EMPLOYEE_JOIN_ADV e1 , SALARY_GRADE s1
where e1.EMP_SALARY BETWEEN s1.MIN_SALARY AND s1. MAX_SALARY
--Q38. NON-EQUI JOIN – Grade Distribution
--Find employee count in each salary grade.
--•	Use salary range matching.
--•	Use COUNT and GROUP BY.
select grade_name, count(*) emp_count from EMPLOYEE_JOIN_ADV e1 , SALARY_GRADE s1
where e1.EMP_SALARY BETWEEN s1.MIN_SALARY AND s1. MAX_SALARY
group by grade_name
--Q39. NON-EQUI JOIN – High Salary Grades
--Find employees in LEAD or MANAGER grade.
--•	Use salary range matching and IN.
--•	Sort salary descending.
select * from EMPLOYEE_JOIN_ADV e1 , SALARY_GRADE s1
where e1.EMP_SALARY BETWEEN s1.MIN_SALARY AND s1. MAX_SALARY and GRADE_NAME in ('LEAD','MANAGER')
order by emp_Salary
--check the ans

--Q40. FINAL – Organization Analytics Dashboard
--Create a management-ready report combining hierarchy, department and compensation classification.
--•	Display EMP_NAME, MANAGER_NAME, DEPT_NAME, EMP_SALARY and GRADE_NAME.
--•	Use SELF JOIN for manager.
--•	Use OUTER JOIN for department where appropriate.
--•	Use NON-EQUI JOIN for salary grade.
--•	Filter salary >= 4500 OR NULL salary.
--•	Sort by department and salary DESC.
--•	Write one line explaining the JOIN strategy.
select e1.EMP_NAME, e2.emp_name MANAGER_NAME, d.DEPT_NAME, e1.EMP_SALARY,s1.GRADE_NAME 
from EMPLOYEE_JOIN_ADV e1,EMPLOYEE_JOIN_ADV e2
where e1.manager_id = e2.emp_id left join department_join_adv d
on e1.dept_id = d.dept_id , SALARY_GRADE s1 
where emp_salary >= 4500 OR emp_salary is NULL 
order by dept_name, emp_salary

select e1.EMP_NAME, e2.emp_name MANAGER_NAME, d.DEPT_NAME, e1.EMP_SALARY,s1.GRADE_NAME 
from EMPLOYEE_JOIN_ADV e1 left join EMPLOYEE_JOIN_ADV e2
on e1.manager_id = e2.emp_id left join department_join_adv d
on e1.dept_id = d.dept_id left join SALARY_GRADE s1 
on e1.emp_salary between s1.MIN_SALARY and s1.MAX_SALARY
where e1.emp_salary >= 4500 OR e1.emp_salary is NULL 
order by dept_name, emp_salary

--PART D – CONCEPT COVERAGE
--•	Two-table joins: Employee ↔ Department.
--•	Three-table joins: Employee ↔ Department ↔ Salary Grade.
--•	SELF JOIN: Employee ↔ Manager within the same table.
--•	CROSS JOIN: Every possible Employee × Department combination.
--•	EQUI JOIN: Equal DEPT_ID relationship.
--•	NON-EQUI JOIN: Salary matched to MIN_SALARY and MAX_SALARY range.
--•	Previous concepts: WHERE, IN, IS NULL, TOP, ORDER BY, Aggregates, GROUP BY and HAVING.
--Interview Expectations
--•	Explain INNER, LEFT, RIGHT and FULL OUTER JOIN with business examples.
--•	Write SELF JOIN for employee-manager hierarchy.
--•	Explain Cartesian product and CROSS JOIN use case.
--•	Differentiate EQUI JOIN and NON-EQUI JOIN.
--•	Join two and three tables confidently.
--•	Combine JOINs with WHERE, IS NULL, IN, TOP, ORDER BY and aggregation.
--•	Explain ON vs WHERE behavior in OUTER JOIN scenarios.
--Submission Checklist
--•	☐ 10 theory questions answered.
--•	☐ 30 practical scenarios completed.
--•	☐ All 3 tables created successfully.
--•	☐ Two-table joins completed.
--•	☐ Three-table joins completed.
--•	☐ SELF JOIN scenarios completed.
--•	☐ CROSS JOIN scenarios completed.
--•	☐ EQUI and NON-EQUI JOIN scenarios completed.
--•	☐ Final dashboard challenge completed.
--Business Requirement → Identify Relationship → Choose JOIN → Filter → Aggregate → Validate → Explain



--Assignment (Notes)
--Salary Range to Band Mapping
CREATE TABLE Employee1 (
    EmpID INT, EmpName VARCHAR(50), Salary INT, Department VARCHAR(50)
);
CREATE TABLE SalaryBand (
    BandID INT, BandName VARCHAR(20), MinSalary INT, MaxSalary INT
);
--Insert into Employee
INSERT INTO Employee1 VALUES
(101, 'Amit Sharma', 18000, 'HR'),
(102, 'Neha Patel', 35000, 'Finance'),
(103, 'Rajesh Mehta', 55000, 'IT'),
(104, 'Suman Roy', 25000, 'Admin'),
(105, 'Kavita Iyer', 48000, 'Finance'),
(106, 'Manoj Desai', 70000, 'IT'),
(107, 'Pooja Singh', 95000, 'Sales'),
(108, 'Vinod Rao', 120000, 'Management'),
(109, 'Ritika Gupta', 22000, 'Support'),
(110, 'Alok Verma', 40000, 'HR');

--Insert into SalaryBand
INSERT INTO SalaryBand VALUES
(1, 'Low', 0, 25000),
(2, 'Mid', 25001, 50000),
(3, 'High', 50001, 100000),
(4, 'Executive', 100001, 200000);

select * from Employee1
select * from SalaryBand
--Mapping Scores to Grade Ranges
CREATE TABLE Student1 (
    RollNo INT, StudentName VARCHAR(50), Score INT
);
CREATE TABLE GradeMaster (
    Grade CHAR(1), MinScore INT, MaxScore INT
);
INSERT INTO Student1 VALUES
(1, 'Suresh Raina', 95),
(2, 'Anjali Nair', 82),
(3, 'Rahul Bose', 76),
(4, 'Poonam Yadav', 65),
(5, 'Mohit Sharma', 45),
(6, 'Meera Bansal', 88),
(7, 'Ajay Dev', 58),
(8, 'Tanvi Sinha', 38),
(9, 'Deepak Hooda', 99),
(10, 'Nidhi Verma', 70);

INSERT INTO GradeMaster VALUES
('A', 90, 100),
('B', 75, 89),
('C', 60, 74),
('D', 40, 59),
('F', 0, 39);

select * from Student1
select * from GradeMaster
--Tax Bracket Classification
CREATE TABLE Citizen (
    CitizenID INT, Name VARCHAR(50), AnnualIncome DECIMAL(10,2)
);
CREATE TABLE TaxBracket (
    BracketID INT, TaxRate DECIMAL(5,2), MinIncome DECIMAL(10,2), MaxIncome DECIMAL(10,2)
);

select * from Citizen
select * from TaxBracket

INSERT INTO Employee1 VALUES
(101, 'Amit Sharma', 18000, 'HR'),
(102, 'Neha Patel', 35000, 'Finance'),
(103, 'Raj Mehta', 55000, 'IT'),
(104, 'Suman Roy', 25000, 'Admin'),
(105, 'Kavita Iyer', 48000, 'Finance'),
(106, 'Manoj Desai', 70000, 'IT'),
(107, 'Pooja Singh', 95000, 'Sales'),
(108, 'Vinod Rao', 120000, 'Management'),
(109, 'Ritika Gupta', 22000, 'Support'),
(110, 'Alok Verma', 40000, 'HR');

INSERT INTO SalaryBand VALUES
(1, 'Low', 0, 25000),
(2, 'Mid', 25001, 50000),
(3, 'High', 50001, 100000),
(4, 'Executive', 100001, 200000);

--Time Range Mapping (Shifts)
CREATE TABLE Attendance (
    EmpID INT, EmpName VARCHAR(50), CheckIn TIME
);
CREATE TABLE ShiftTimings (
    ShiftID INT, ShiftName VARCHAR(20), StartTime TIME, EndTime TIME
);
INSERT INTO Attendance VALUES
(1, 'Rahul Dravid', '07:45'),
(2, 'Seema Rani', '09:10'),
(3, 'Arjun Kapoor', '14:00'),
(4, 'Isha Negi', '17:50'),
(5, 'Vivek Joshi', '08:30'),
(6, 'Priti Agarwal', '10:00'),
(7, 'Tarun Bhatt', '18:15'),
(8, 'Sweta Roy', '13:30'),
(9, 'Ganesh Gaitonde', '20:05'),
(10, 'Namrata Rao', '11:45');

INSERT INTO ShiftTimings VALUES
(1, 'Morning', '07:00', '09:00'),
(2, 'General', '09:01', '17:00'),
(3, 'Evening', '17:01', '21:00');
select * from Attendance
select * from ShiftTimings
--Interest Rate Slabs in Banking
CREATE TABLE LoanApplications (
    AppID INT, ApplicantName VARCHAR(50), LoanAmount DECIMAL(10,2)
);

CREATE TABLE InterestSlabs (
    SlabID INT, InterestRate DECIMAL(4,2), MinAmount DECIMAL(10,2), MaxAmount DECIMAL(10,2)
);

INSERT INTO LoanApplications VALUES
(1, 'Sakshi Kumari', 100000),
(2, 'Nitin Deshmukh', 300000),
(3, 'Rupa Nair', 600000),
(4, 'Siddharth Jain', 900000),
(5, 'Lata Sharma', 450000),
(6, 'Kunal Soni', 200000),
(7, 'Bhavana Reddy', 800000),
(8, 'Girish Shetty', 1500000),
(9, 'Tina Fernandes', 2500000),
(10, 'Akhil Chawla', 350000);

INSERT INTO InterestSlabs VALUES
(1, 7.00, 0, 200000),
(2, 7.50, 200001, 500000),
(3, 8.00, 500001, 1000000),
(4, 8.50, 1000001, 2000000),
(5, 9.00, 2000001, 10000000);

select * from LoanApplications
select * from InterestSlabs

--50 Assignment Questions
--Salary Band Scenario
--1.	Map each employee to their salary band.
select * from SalaryBand
select * from Employee1

select * from employee1 e join SalaryBand s
on e.Salary between s.MinSalary and s.MaxSalary
--ORRRRRR
select * from Employee1 e1 , SalaryBand s1
where e1.Salary BETWEEN s1.MinSalary AND s1.MaxSalary
--2.	List employees eligible for promotion (salary near band ceiling).
select * from Employee1 e1 , SalaryBand s1
where e1.Salary BETWEEN s1.MinSalary AND s1.MaxSalary AND E1.SALARY = s1.MaxSalary

--3.	Count employees in each band.
select BandName,count(e1.EmpName) [no. of emp]  from Employee1 e1 , SalaryBand s1
where e1.Salary BETWEEN s1.MinSalary AND s1.MaxSalary
group by s1.bandname

--4.	Get departments with employees in more than one band.
select E.DEPARTMENT,E.EMPNAME  from Employee1 E , SalaryBand S
where E.Salary BETWEEN S.MinSalary AND S.MaxSalary
GROUP BY E.DEPARTMENT,E.EMPNAME

--5.	Find employees not falling into any band (if any).
select * from employee1 e left join SalaryBand s
on e.Salary between s.MinSalary and s.MaxSalary
where s.bandid is null

--6.	Show band name with salary difference for each employee.
select *, (s.maxsalary - e.salary) [sal diff] from employee1 e  join SalaryBand s
on e.Salary between s.MinSalary and s.MaxSalary

--7.	List high-band employees in Finance department.
select * from employee1 e  join SalaryBand s
on e.Salary between s.MinSalary and s.MaxSalary
where e.department = 'finance' and s.bandname = 'high'
--8.	Show average salary per band.
select S.bandname, avg(e.salary) [AVG SAL] from employee1 e left join SalaryBand s
on e.Salary between s.MinSalary and s.MaxSalary
group by s.bandname
--9.	Find top 3 highest-paid employees and their bands.
select TOP 5 EMPNAME,BANDNAME,SALARY from employee1 e left join SalaryBand s
on e.Salary between s.MinSalary and s.MaxSalary
ORDER BY E.SALARY DESC
--10.	Show total number of employees in "High" and "Executive" bands.
--Grade Mapping Scenario
select BANDNAME, COUNT(EMPNAME) from employee1 e left join SalaryBand s
on e.Salary between s.MinSalary and s.MaxSalary
WHERE S.BANDNAME IN ('HIGH','EXECUTIVE')
GROUP BY S.BANDNAME


select * from Student1
select * from GradeMaster
--11.	Assign grades to all students based on score.
SELECT * FROM STUDENT1 S,GRADEMASTER G
WHERE S.SCORE BETWEEN G.MinScore AND G.MaxScore 
--12.	List students with Grade 'A'.
SELECT * FROM STUDENT1 S,GRADEMASTER G
WHERE S.SCORE BETWEEN G.MinScore AND G.MaxScore AND G.GRADE = 'A'
--13.	Count students per grade.
SELECT GRADE, COUNT(STUDENTNAME) FROM STUDENT1 S,GRADEMASTER G
WHERE S.SCORE BETWEEN G.MinScore AND G.MaxScore 
GROUP BY GRADE
--14.	Show average score for Grade B students.
SELECT AVG(SCORE) FROM (SELECT * FROM STUDENT1 S,GRADEMASTER G
WHERE S.SCORE BETWEEN G.MinScore AND G.MaxScore AND G.GRADE = 'B') AS T1

--OR
--BEST APROACH
SELECT G.GRADE,AVG(S.SCORE) FROM STUDENT1 S,GRADEMASTER G
WHERE S.SCORE BETWEEN G.MinScore AND G.MaxScore 
GROUP BY GRADE
HAVING G.GRADE = 'B'
--15.	Find students who failed (Grade 'F').
SELECT * FROM STUDENT1 S,GRADEMASTER G
WHERE S.SCORE BETWEEN G.MinScore AND G.MaxScore AND G.GRADE = 'F'
--16.	Show number of students who scored more than 60.
SELECT COUNT(STUDENTNAME) [NO. OD STU WHOS SCORE > 60] FROM STUDENT1 S,GRADEMASTER G
WHERE S.SCORE BETWEEN G.MinScore AND G.MaxScore AND S.SCORE > 60

--17.	List students who are borderline for higher grade.
SELECT * FROM STUDENT1 S,GRADEMASTER G
WHERE S.SCORE BETWEEN G.MinScore AND G.MaxScore AND S.SCORE = G.MAXSCORE

--18.	Find grade-wise highest scorer.
SELECT GRADE, MAX(S.SCORE) [HIGHEST SCORE] FROM STUDENT1 S,GRADEMASTER G
WHERE S.SCORE BETWEEN G.MinScore AND G.MaxScore 
GROUP BY G.GRADE
--19.	Show students with grades between B and D.
SELECT * FROM STUDENT1 S,GRADEMASTER G
WHERE S.SCORE BETWEEN G.MinScore AND G.MaxScore AND G.GRADE BETWEEN 'B' AND 'D'
--20.	List students who need improvement (Grade 'C' and below).
SELECT * FROM STUDENT1 S,GRADEMASTER G
WHERE S.SCORE BETWEEN G.MinScore AND G.MaxScore AND G.GRADE >= 'C'

select * from Citizen
select * from TaxBracket
--Tax Bracket Scenario
--21.	Classify citizens into their respective tax brackets.
--22.	List citizens who pay 0% tax.
--23.	Show count of taxpayers per bracket.
--24.	Calculate estimated tax amount for each citizen.
--25.	Find citizens eligible for 30% tax.
--26.	Find average income in 5% tax bracket.
--27.	List citizens who moved to a new bracket after raise (simulate).
--28.	Compare citizens just above and below 5L bracket.
--29.	List names whose tax rate is greater than 10%.
--30.	Rank brackets by number of citizens in them.

select * from Attendance
select * from ShiftTimings
--Shift Mapping:
--1.	Map each employee to their corresponding shift based on Check-In time.
SELECT * FROM ATTENDANCE A , ShiftTimings SH
WHERE A.CHECKIN BETWEEN SH.STARTTIME AND SH.ENDTIME
--2.	List all employees who are in the Morning shift.
SELECT * FROM ATTENDANCE A , ShiftTimings SH
WHERE A.CHECKIN BETWEEN SH.STARTTIME AND SH.ENDTIME AND SH.ShiftName = 'MORNING'

--3.	Count the number of employees in each shift.
SELECT SH.ShiftName, COUNT(EMPNAME) [NO OF EMP] FROM ATTENDANCE A , ShiftTimings SH
WHERE A.CHECKIN BETWEEN SH.STARTTIME AND SH.ENDTIME
GROUP BY SH.ShiftName

--4.	Identify employees who check-in after 10:00 AM but before the Evening shift.
SELECT EMPNAME,CHECKIN,SHIFTNAME,STARTTIME,ENDTIME FROM ATTENDANCE A , ShiftTimings SH
WHERE A.CHECKIN BETWEEN SH.STARTTIME AND SH.ENDTIME
AND A.CHECKIN > '10:00' AND A.CHECKIN <
(SELECT STARTTIME FROM ShiftTimings WHERE SHIFTNAME = 'EVENING')
--5.	Find employees not falling into any defined shift range.
SELECT * FROM ATTENDANCE A LEFT JOIN  ShiftTimings SH
ON A.CHECKIN BETWEEN SH.STARTTIME AND SH.ENDTIME
WHERE SHIFTNAME IS NULL
--6.	Display employees along with how many minutes early or late they are for their shift start time.
SELECT *, DATEDIFF(MI,CHECKIN,STARTTIME) [MINUTE EARLY OR LATE] FROM ATTENDANCE A , ShiftTimings SH
WHERE A.CHECKIN BETWEEN SH.STARTTIME AND SH.ENDTIME
--7.	Get the list of employees with Check-In times closer (within 10 mins) to shift start times.
SELECT *, DATEDIFF(MI,CHECKIN,STARTTIME) [MINUTE EARLY OR LATE] FROM ATTENDANCE A LEFT JOIN ShiftTimings SH
ON A.CHECKIN BETWEEN SH.STARTTIME AND SH.ENDTIME 
WHERE DATEDIFF(MI,CHECKIN,STARTTIME) > -10
--8.	Show departments (assume added column) that mostly fall under Evening shift.
SELECT * FROM ATTENDANCE A LEFT JOIN  ShiftTimings SH
ON A.CHECKIN BETWEEN SH.STARTTIME AND SH.ENDTIME
--9.	Identify shift with the earliest Check-In by any employee.
SELECT ShiftName FROM ATTENDANCE A LEFT JOIN  ShiftTimings SH
ON A.CHECKIN BETWEEN SH.STARTTIME AND SH.ENDTIME
WHERE A.CHECKIN < SH.StartTime
GROUP BY SHIFTNAME
--10.	Get average Check-In time per shift.
SELECT ShiftName, AVG(CHECKIN) [AVG CHECKIN TIME] FROM ATTENDANCE A LEFT JOIN  ShiftTimings SH
ON A.CHECKIN BETWEEN SH.STARTTIME AND SH.ENDTIME
GROUP BY SHIFTNAME

SELECT * FROM ATTENDANCE A LEFT JOIN  ShiftTimings SH
ON A.CHECKIN BETWEEN SH.STARTTIME AND SH.ENDTIME

--Interest Rate Mapping
select * from LoanApplications;
select * from InterestSlabs;
--1.	Map each loan application to its respective interest rate slab.
select * from LoanApplications L left JOIN InterestSlabs I 
ON l.LoanAmount between I.MinAmount and I.MaxAmount

--2.	List all applicants who fall under the 7.5% interest slab.
select l.ApplicantName, L.LoanAmount,I.InterestRate from LoanApplications L left JOIN InterestSlabs I 
ON l.LoanAmount between I.MinAmount and I.MaxAmount
where I.InterestRate <= 7.5
--3.	Count how many loan applications fall under each interest slab.
select I.InterestRate, count(L.ApplicantName)  [Loan Applicants] from LoanApplications L left JOIN InterestSlabs I 
ON l.LoanAmount between I.MinAmount and I.MaxAmount
group by I.InterestRate
--4.	Find applicants eligible for the highest interest rate.
select * from LoanApplications L left JOIN InterestSlabs I 
ON l.LoanAmount between I.MinAmount and I.MaxAmount
where L.LoanAmount >=
(select max(MinAmount) from InterestSlabs)

select * from InterestSlabs
--5.	Calculate total loan amount per interest rate slab.
select I.SlabID, sum(L.LoanAmount) [Total AMT as per slab] from LoanApplications L left JOIN InterestSlabs I 
ON l.LoanAmount between I.MinAmount and I.MaxAmount
group by I.SlabID

--6.	Display applicants with loan amounts just below the next slab cutoff.
select * from LoanApplications L  JOIN InterestSlabs I 
ON l.LoanAmount between I.MinAmount and I.MaxAmount
where l.LoanAmount = i.MaxAmount

--7.	Find the average loan amount for each slab.
select I.SlabID, avg(L.LoanAmount) [AVG per slab] from LoanApplications L  JOIN InterestSlabs I 
ON l.LoanAmount between I.MinAmount and I.MaxAmount
group by I.SlabID
--8.	List applicants whose loan amounts do not fall under any defined slab (if any).
select * from LoanApplications L  JOIN InterestSlabs I 
ON l.LoanAmount between I.MinAmount and I.MaxAmount
where I.SlabID is null

--9.	Rank the slabs by number of loan applications.
select I.SlabID, count(L.AppID) [No. of loan applicants] from LoanApplications L  JOIN InterestSlabs I 
ON l.LoanAmount between I.MinAmount and I.MaxAmount
group by SlabID
order by count(L.AppID) desc
--10.	For each applicant, calculate the expected interest payable on their loan.
select *, (L.LoanAmount * I.InterestRate/100) * 12 as Interest_payble from LoanApplications L  JOIN InterestSlabs I 
ON l.LoanAmount between I.MinAmount and I.MaxAmount

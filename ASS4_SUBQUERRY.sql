use company;

select * from EMPD;

select distinct * from EMPD;

select distinct EMP_SAL from EMPD;

select *,distinct EMP_SAL from EMPD; --this is invalid

select distinct EMP_SAL,emp_dept from EMPD;
select distinct EMP_SAL,emp_dept from EMPD order by emp_Sal;
select distinct EMP_SAL,emp_dept from EMPD order by emp_dept,emp_Sal;

select top (5) * from empd;
select top (5) * from empd order by emp_sal desc;
select top (5)  emp_name,eMp_sal from empd order by emp_sal desc;

--subquery 
--find the 2nd max sal from table
select max(emp_sal) from empd 
where emp_sal <
(select max(emp_sal) from empd);

select * from empd;

--find the 10 th max sal
select min(emp_sal) from empd 
where emp_sal in
(select top 10 emp_sal from empd order by emp_sal desc);

--find 10 thth min
select max(emp_sal) [10 th min] from empd
where emp_sal in
(select top 10 emp_sal from empd order by emp_sal )

select max(emp_sal) [10 th main] from empd
where emp_sal not in
(select top 10 emp_sal from empd order by emp_sal ) --wrong ans which i except

select emp_sal from empd order by emp_sal;

select * from empd 
where emp_sal = (
select max(emp_sal) [10 th min] from empd
where emp_sal in
(select top 10 emp_sal from empd order by emp_sal ))

--how to find duplicate
select emp_dept ,count(*) from empd group by emp_Dept having count(*) > 1;

select * from empd;
--assignment 4

--Q1. DISTINCT – Unique Locations
--Display all distinct cities where employees are located.
--•	Use DISTINCT EMP_CITY.
--•	Sort alphabetically.
select distinct emp_city  from empd order by emp_city

--Q2. DISTINCT – Department/City Footprint
--Display unique EMP_DEPT and EMP_CITY combinations.
--•	Use DISTINCT.
--•	Sort by department, then city.
SELECT DISTINCT EMP_DEPT, EMP_CITY FROM EMPD ORDER BY EMP_DEPT,EMP_CITY;

--Q3. TOP – Compensation Review
--Management wants the TOP 5 highest-paid employees.
--•	Display ID, name, department and salary.
--•	Exclude NULL salary.
--•	Use TOP 5 and ORDER BY salary DESC.
SELECT TOP 5 EMP_ID,EMP_NAME,EMP_DEPT, EMP_SAL 
FROM EMPD 
WHERE EMP_SAL IS NULL
ORDER BY EMP_SAL DESC;

--Q4. TOP + DISTINCT – Salary Bands
--Return the TOP 5 highest distinct salary values.
--•	Use TOP and DISTINCT.
--•	Return only the salary value.
--•	Sort highest to lowest.


SELECT DISTINCT TOP 5 EMP_SAL FROM EMPD ORDER BY EMP_SAL DESC;

--Q5. Department Benchmark
--Create department-level employee count, total salary and average salary.
--•	Use COUNT, SUM, AVG and GROUP BY.
--•	Sort by average salary descending.
SELECT EMP_DEPT,COUNT(*) [TOTAL EMP], SUM(EMP_SAL) [TOTAL SAL], AVG(EMP_SAL) [AVG SAL]
FROM EMPD
GROUP BY EMP_DEPT
ORDER BY [AVG SAL] DESC

--Q6. Subquery – Above Company Average
--Find employees earning more than the overall average salary.
--•	Use a scalar subquery for AVG(EMP_SAL).
--•	Exclude NULL salary.
--•	Sort salary descending.
SELECT AVG(EMP_SAL) FROM EMPD 
SELECT * FROM EMPD WHERE EMP_SAL > 5825;


SELECT * FROM EMPD WHERE EMP_SAL > (
SELECT AVG(EMP_SAL) FROM EMPD ) ORDER BY EMP_SAL DESC;

--Q7. Subquery – Maximum Salary
--Find every employee earning the maximum salary.
--•	Use MAX() in a subquery.
--•	Do not assume only one employee can tie.
--•	Sort by name.
SELECT * FROM EMPD 
WHERE EMP_SAL = 
(SELECT MAX(EMP_SAL) FROM EMPD) ORDER BY EMP_NAME;

--Q8. Subquery + GROUP BY/HAVING – Strong Departments
--Find departments whose average salary is greater than the overall company average.
--•	Use GROUP BY and AVG.
--•	Compare department AVG with a subquery.
--•	Use HAVING.
--•	Sort average salary descending.
select emp_dept, avg(emp_sal) as dept_avg_Sal from empd group by emp_Dept
having avg(emp_sal) > 
(SELECT AVG(EMP_SAL) [AVG SAL] FROM EMPD) order by avg(emp_sal) desc;

--Q9. Correlated Subquery – Above Department Average
--Find employees whose salary is greater than the average salary of their own department.
--•	Use a correlated subquery.
--•	Exclude NULL salaries.
--•	Sort by department and salary descending.
 
 select emp_name,emp_sal from empd where emp_Sal > 
(select avg(emp_sal) [avg emp sal] from empd where emp_dept = empd.emp_dept)
select emp_name,emp_sal from empd

--Q10. TOP + Subquery – Top Above-Average Employees
--Return TOP 3 employees whose salary is above the overall average.
--•	Use a subquery for the overall average.
--•	Use TOP 3 and ORDER BY salary DESC.
select top 3 * from empd 
where emp_Sal >
(Select avg(emp_Sal) from empd )order by emp_sal desc

--Q11. DISTINCT + Subquery – High-Earner Cities
--Return distinct cities containing at least one employee above the overall average salary.
--•	Use DISTINCT.
--•	Use a subquery for the company average.
--•	Exclude NULL salary.
select distinct emp_city from empd
where emp_sal >
(select avg(emp_sal) as [avg_sal] from empd)

select distinct emp_city from empd
where emp_sal >  
(select avg(emp_sal) as [avg_sal] from empd)

where
(select emp_city,count(*) from empd group by emp_city) > 2;

--Q12. Subquery + HAVING – High Payroll Departments
--Find departments whose total salary is greater than the average of all department totals.
--•	Use GROUP BY and SUM.
--•	Compare each department total against a subquery representing average department total.
--•	Use HAVING.
select emp_dept, sum(emp_sal) [total sal] from empd group by emp_dept 
having sum(emp_sal) > 
(select avg(emp_sal) from empd where emp_dept = empd.emp_Dept )

--Q13. Business Case – Compensation Outliers
--Find potential high-salary outliers.
--•	Salary NOT NULL and above company average.
--•	City IN PUNE, MUMBAI, KOTA, NAGPUR.
--•	Name starts with R or S.
--•	Use LIKE, IN, IS NOT NULL and subquery.
--•	Sort salary DESC.
select * from empd 
where emp_Sal is not null and emp_Sal > (select avg(emp_Sal) from empd) and emp_city in ('pune','mumbai','kota','nagpur') and 
emp_name like '[rs]%' order by emp_sal desc

--Q14. Interview Challenge – Second Highest Distinct Salary
--Find the second-highest DISTINCT salary without Window Functions.
--•	Use DISTINCT and a subquery.
--•	Do not use TOP 2 alone.
--•	Handle duplicate highest salaries correctly.
--•	Return only the second-highest salary.
select distinct max(emp_sal) as [second highest sal] from empd 
where emp_sal <
(select max(emp_sal) from empd)

--Q15. FINAL – Hiring & Compensation Analysis
--Return TOP 5 employees above their department average for a targeted hiring/compensation review.
--•	Salary NOT NULL and BETWEEN 3500 and 7000.
--•	City IN PUNE, MUMBAI, KOTA, NAGPUR.
--•	Name starts with R or S.
--•	Use TOP 5.
--•	Use a correlated subquery for department AVG.
--•	Calculate ANNUAL_SALARY = EMP_SAL * 12.
--•	Use LIKE, IN, BETWEEN, IS NOT NULL, subquery and ORDER BY.
--•	No JOIN, CTE, CASE or Window Functions.
select emp_dept,avg(emp_Sal) from empd group by emp_dept
select top 5 * from empd


select top 5 * , annual_Sal = emp_Sal * 12 from empd   where emp_sal in (select avg(emp_Sal) from empd group by emp_dept) and
emp_sal is not null and emp_sal between 3500 and 7000 and emp_city in ('pune','mumbai','kota','nagpur')
and emp_name like '[rs]%' order by emp_sal desc

select top 5 * , annual_Sal = emp_Sal * 12 from empd   where emp_sal > (select avg(emp_Sal) from empd where emp_Dept = empd.emp_dept) and
emp_sal is not null and emp_sal between 3500 and 7000 and emp_city in ('pune','mumbai','kota','nagpur')
and emp_name like '[rs]%' order by emp_sal desc

select avg(
select sum(emp_sal) from empd group by emp_dept) from empd



-- self practice
--Find the employees whose salary is greater than the average salary of all employees.
select emp_name, emp_sal from empd
where emp_Sal > 
(select avg(emp_sal) from empd) order by emp_sal desc

--Find the employee(s) who have the highest salary in the company.
select * from empd
where emp_sal = 
(select max(emp_sal) from empd)

--order by
select * from empd order by emp_Sal desc

--Find the employee(s) who have the second-highest salary in the company.
select max(emp_sal) from empd
where emp_Sal <
(select max(emp_sal) from empd)



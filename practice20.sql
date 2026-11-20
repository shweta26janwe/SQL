
CREATE TABLE EEMP2 (
    EMP_ID INT PRIMARY KEY,
    EMP_NAME VARCHAR(50),
    CITY VARCHAR(50),
    EMP_SAL INT,
    DEPT_ID INT
);

INSERT INTO EEMP2 VALUES
(1, 'Amit', 'Pune', 60000, 101),
(2, 'Rahul', 'Mumbai', 35000, 102),
(3, 'Priya', 'Pune', 75000, 101),
(4, 'Sneha', 'Nagpur', 28000, 103),
(5, 'Vijay', 'Mumbai', 45000, 102),
(6, 'Neha', 'Pune', 52000, 101),
(7, 'Rohan', 'Nagpur', 30000, 103),
(8, 'Pooja', 'Mumbai', 65000, 102),
(9, 'Karan', 'Pune', 25000, 104),
(10, 'Anjali', 'Nagpur', 80000, 101),
(11, 'Suresh', 'Mumbai', 40000, 102),
(12, 'Meena', 'Pune', 55000, 101),
(13, 'Akash', 'Nagpur', 32000, 103),
(14, 'Kavita', 'Mumbai', 70000, 102),
(15, 'Nikhil', 'Pune', 48000, 104),
(16, 'Swati', 'Nagpur', 58000, 101),
(17, 'Manoj', 'Mumbai', 27000, 103),
(18, 'Riya', 'Pune', 90000, 101);

CREATE TABLE DDEPT2 (
    DEPT_ID INT PRIMARY KEY,
    DEPT_NAME VARCHAR(50)
);

INSERT INTO DDEPT2 VALUES
(101, 'IT'),
(102, 'HR'),
(103, 'Sales'),
(104, 'Finance'),
(105, 'Marketing');

SELECT * FROM EEMP2;

SELECT * FROM DDEPT2;

--Q1. GROUP BY + HAVING

--Find departments having:
--- More than 3 employees.
--- Average salary greater than 30,000.
--- Maximum salary greater than 50,000.
select D.DEPT_NAME , count(*) as emp_count, avg(emp_Sal) AvgSal,max(emp_Sal) MaxSal from EEMP2 E join DDEPT2 D 
on E.DEPT_ID = D.DEPT_ID
group by D.DEPT_NAME
having count(*) > 3 and avg(emp_Sal)>30000 and max(emp_Sal) > 50000

--Q2. Subquery
--Find employees whose salary is greater than the average salary of their own department.
select * from EEMP2 E  
having E.emp_sal > (select avg(E2.emp_Sal) from EEMP2 E2 where E.DEPT_ID=E2.DEPT_ID)
--Q3. CASE + Aggregate
--Display employee name, salary, and salary category:
--- Salary greater than 50,000 → High
--- Salary between 30,000 and 50,000 → Medium
--- Salary below 30,000 → Low
--Also display the department name.
select EMP_NAME,EMP_SAL,
case when Emp_sal>50000 then 'High'
when EMP_SAL between 30000 and 50000 then 'Medium'
else 'Low'
end
as Sal_Cat, D.DEPT_NAME from EEMP2 E join DDEPT2 D on E.DEPT_ID = D.DEPT_ID 

--Q4. JOIN + Subquery
--Find the highest-paid employee from each department. Display employee name, department name, and salary.
select emp_name,D.dept_name,emp_sal from EEMP2 E join DDEPT2 D on E.DEPT_ID = D.DEPT_ID 
where emp_sal in (
select max(E.emp_sal) Highest_paid from EEMP2 E join DDEPT2 D on E.DEPT_ID = D.DEPT_ID  
group by D.DEPT_NAME)

--Q5. Window Function – DENSE_RANK
--Find the second-highest distinct salary in each department using DENSE_RANK().
with DR as (
select *, DENSE_RANK() over(partition by dept_id order by emp_sal desc) dense_Rankk  from EEMP2)
select *from DR where dense_Rankk = 2

--Q6. Window Function – LAG
--Display each employee's:
--- Employee name
--- Salary
--- Previous employee's salary
--- Difference between current and previous salary.
--Use LAG() and order employees by salary.
select EMP_NAME,emp_sal, lag(emp_sal) over(order by emp_id) prev_emp_sal,diff = emp_sal-lag(emp_sal) over(order by emp_id)
from EEMP2 

--Q7. EXISTS
--Find departments that do not have any employees.
select dept_id from DDEPT2 d
where not exists (select 1 from EEMP2 e where d.dept_id = e.dept_id)


--Q8. ANY / ALL
--Find employees whose salary is greater than ALL employees working in the HR department.
select * from EEMP2
where emp_Sal > all(select emp_sal from EEMP2 E join DDEPT2 D on E.DEPT_ID = D.DEPT_ID where D.DEPT_NAME = 'HR')

--Q9. Advanced Challenge

--Display the following information for every employee:
--EMP_NAME
--DEPT_NAME
--SALARY
--DEPT_AVG_SALARY
--SALARY_RANK
--SALARY_CATEGORY

select emp_name,dept_name,emp_sal,avg(emp_sal) over(partition by dept_name) Dept_avg_sal,
rank() over(partition by dept_name order by emp_Sal) Sal_rank,
case when emp_sal >50000 then 'High'
when emp_sal > 20000 then 'Medium'
else 'Low'
end
as sal_cat from EEMP2 E left join DDEPT2 D on E.DEPT_ID = D.DEPT_ID

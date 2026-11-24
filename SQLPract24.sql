select * from EEMP2
select * from DDEPT2

--Second-highest salary in each department
--Write a query to find the second-highest salary in each department. 
--Display EmpName, DeptName and Salary. Use DENSE_RANK().
with rankingtable as (
select emp_name,dept_name,emp_Sal, DENSE_RANK() over(partition by d.dept_id order by emp_Sal desc) Ranking
from EEMP2 E join DDEPT2 D on E.DEPT_ID = D.DEPT_ID)
select * from rankingtable
where ranking=2

--Employees earning more than department average
--Find employees whose salary is greater than the average salary of their respective departments. 
--Display employee name, department and salary.
select e1.emp_name,dept_id,emp_sal,emp_Sal avg_Sal from EEMP2 e1
where emp_Sal  > (select avg(emp_sal) from EEMP2 e2 where e1.DEPT_ID = e2.dept_id)

--Department-wise highest salary
--Find the highest-paid employee in each department. 
--If multiple employees have the same highest salary, display all of them.
with highTable as (
select *,DENSE_RANK() over(partition by dept_id order by emp_sal desc) rankk from EEMP2 
) select * from highTable where rankk =2


--Employees without a department
--Find all departments that do not have any employees. Display DeptID and DeptName.
select * from DDEPT2 d 
where not exists (select 1 from EEMP2 e where e.DEPT_ID= d.DEPT_ID)

--Salary category using CASE
--Create a salary_category column: salary >= 70000 as High, salary between 
--50000 and 69999 as Medium, and below 50000 as Low.
select *,
case when emp_Sal >= 70000 then 'High'
when emp_Sal between 50000 and 69999 then 'Medium' 
when emp_sal < 50000 then 'Low'
end as category from EEMP2


--Department salary summary
--Display each department's name, total employees, average salary and total salary. 
--Include departments with zero employees.
select d.dept_name,sum(e.emp_id) total_emp,avg(e.emp_sal) avg_salary, sum(e.emp_sal) total_sal from eemp2 e right join
ddept2 d on e.dept_id = d.dept_id group by d.dept_name

--Find duplicate salaries
--Find salaries that are earned by more than one employee. 
--Display Salary and the number of employees receiving that salary.
select emp_sal, count(emp_sal) No_Of_emp from eemp2 group by emp_sal
having count(emp_sal)>2

--Third-highest distinct salary
--Find the third-highest distinct salary from the EMP table. Use a window function.
with rankingTable as
(select *,dense_rank() over(order by emp_sal desc) ranking from eemp2)
select * from rankingTable
where ranking = 3

select * from EEmployee
--Employee and manager names
--Write a self-join query to display each employee's name along with their manager's name.
select * from EEmployee e join EEmployee e2 on e.ManagerID = e2.EmployeeID

--Running total of salaries
--Display EmpName, Salary and a running total of salary ordered by EmpID using a window function.
select *, sum(emp_sal) over(order by emp_id) RunningSal from eemp2

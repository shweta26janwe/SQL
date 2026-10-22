use company
CREATE TABLE DDepartment (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50) NOT NULL
);

CREATE TABLE EEmployee (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50) NOT NULL,
    DepartmentID INT,
    Salary DECIMAL(10, 2),
    ManagerID INT,

    FOREIGN KEY (DepartmentID)
        REFERENCES DDepartment(DepartmentID),

    FOREIGN KEY (ManagerID)
        REFERENCES EEmployee(EmployeeID)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT NOT NULL,
    Amount DECIMAL(10, 2),
    OrderDate DATE,
    Status VARCHAR(20)
);

INSERT INTO DDepartment (DepartmentID, DepartmentName)
VALUES
    (1, 'IT'),
    (2, 'HR'),
    (3, 'Finance'),
    (4, 'Marketing');

INSERT INTO EEmployee
    (EmployeeID, EmployeeName, DepartmentID, Salary, ManagerID)
VALUES
    (105, 'Neha', 2, 85000, NULL);

INSERT INTO EEmployee
    (EmployeeID, EmployeeName, DepartmentID, Salary, ManagerID)
VALUES
    (101, 'Amit', 1, 45000, 105),
    (102, 'Priya', 2, 60000, 105),
    (103, 'Rahul', 1, 55000, 101),
    (104, 'Sneha', 3, 70000, 105);

INSERT INTO Orders
    (OrderID, CustomerID, Amount, OrderDate, Status)
VALUES
    (1, 201, 5000, '2026-01-10', 'Completed'),
    (2, 202, 8000, '2026-01-12', 'Pending'),
    (3, 201, 12000, '2026-02-05', 'Completed'),
    (4, 203, 4000, '2026-02-10', 'Cancelled'),
    (5, 202, 15000, '2026-03-01', 'Completed');

SELECT * FROM DDepartment;

SELECT * FROM EEmployee;

SELECT * FROM Orders;

--1.Find departments whose average employee salary is greater than 55,000.
--Display the department name and average salary.
select D.DepartmentName, avg(E.Salary) as average_Salary from EEmployee E join DDepartment D 
on E.DepartmentID=D.DepartmentID
group by D.DepartmentName
having avg(E.Salary) > 55000
--2.Using a CTE, calculate each customer's total completed order amount and 
--return only customers whose total exceeds 10,000.

select CustomerID,sum(Amount) Total from Orders
where Status = 'Completed'
group by CustomerID
having sum(Amount) > 10000

with newT as
(
select CustomerID,sum(Amount) Total from Orders
where Status = 'Completed'
group by CustomerID

)select * from newT 
where Total > 10000

--3.Find the second-highest salary in each department. If multiple employees share that salary, return all of them.
with RankTable as (
select D.DepartmentID,D.DepartmentName,E.EmployeeName,Salary,DENSE_RANK() over(partition by D.DepartmentID 
order by Salary desc) SalRank from EEmployee E join DDepartment D 
on E.DepartmentID=D.DepartmentID
) select * from RankTable
where SalRank =2

--4.Find departments that currently have no employees.
select * from  DDepartment D 
where  not exists (select 1 from EEmployee E where E.DepartmentID=D.DepartmentID)

--5.Find employees who earn more than the overall average employee salary.
select * from EEmployee
where Salary > (select avg(Salary) from EEmployee)
--6.Display each employee's name, department ID, salary, 
--and the difference between their salary and their department's average salary.
with DeptAvgTable as (
select E.EmployeeName,D.DepartmentID,Salary,avg(Salary) over(partition by 
D.DepartmentID) AVG_PER_DEPT from EEmployee E join DDepartment D
on E.DepartmentID=D.DepartmentID
)
select *, Diff = Salary - AVG_PER_DEPT from 
DeptAvgTable 


where Salary > (select avg(Salary) from EEmployee E where E.DepartmentID=D.DepartmentID)

select * from EEmployee

--7.Find the total completed sales amount for each month in 2026.
select month(OrderDate) Months,avg(Amount) SalesAmt from Orders
where Status = 'Completed'
group by month(OrderDate);
--8.Using a CTE, find the top two highest-paid employees in each department.
with TopEmp as (
select EmployeeName,DepartmentID,Salary, DENSE_RANK() over(partition by DepartmentID order by Salary desc) 
Ranks from EEmployee
)
select * from TopEmp where Ranks <= 2
--9.Display each employee's name alongside their manager's name. Employees without managers should also appear.
select E1.EmployeeID,E1.EmployeeName,E1.ManagerID,E2.EmployeeName
from EEmployee E1 left join EEmployee E2 on E1.ManagerID = E2.EmployeeID
--10.For each customer, display the number of 
--completed orders, pending orders, and cancelled 
--orders.

select CustomerID,
sum(case
when Status = 'Completed'
then 1 else 0 
end) as NoOfCompletedOrders,
sum(case
when Status = 'Pending' then 1 else 0 end ) as
NoOfPendingOrders,
sum(case 
when Status = 'Cancelled' then 1 else 0 end ) as
NoOFCancelledORdes
from Orders
group by CustomerID



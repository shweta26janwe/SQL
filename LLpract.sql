
CREATE DATABASE LeadLag_Practice;
GO

USE LeadLag_Practice;
GO

CREATE TABLE Employees
(
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    DepartmentID INT,
    Salary DECIMAL(10,2),
    JoiningDate DATE
);

CREATE TABLE MonthlySales
(
    SaleID INT PRIMARY KEY,
    EmployeeID INT,
    SaleMonth DATE,
    SalesAmount DECIMAL(12,2)
);
INSERT INTO Employees
(EmployeeID, EmployeeName, DepartmentID, Salary, JoiningDate)
VALUES
(101, 'Amit',   10, 85000, '2021-01-10'),
(102, 'Rahul',  10, 65000, '2022-03-15'),
(103, 'Sneha',  10, 72000, '2023-06-20'),
(104, 'Priya',  20, 90000, '2020-02-12'),
(105, 'Neha',   20, 60000, '2023-01-05'),
(106, 'Vikas',  20, 75000, '2022-08-18'),
(107, 'Rohit',  30, 55000, '2023-04-10'),
(108, 'Pooja',  30, 50000, '2024-01-15');

INSERT INTO MonthlySales
(SaleID, EmployeeID, SaleMonth, SalesAmount)
VALUES
(1,  101, '2026-01-01', 50000),
(2,  101, '2026-02-01', 65000),
(3,  101, '2026-03-01', 60000),
(4,  101, '2026-04-01', 80000),

(5,  102, '2026-01-01', 30000),
(6,  102, '2026-02-01', 35000),
(7,  102, '2026-03-01', 32000),
(8,  102, '2026-04-01', 45000),

(9,  103, '2026-01-01', 40000),
(10, 103, '2026-02-01', 42000),
(11, 103, '2026-03-01', 50000),
(12, 103, '2026-04-01', 48000),

(13, 104, '2026-01-01', 60000),
(14, 104, '2026-02-01', 55000),
(15, 104, '2026-03-01', 70000),
(16, 104, '2026-04-01', 75000),

(17, 105, '2026-01-01', 25000),
(18, 105, '2026-02-01', 30000),
(19, 105, '2026-03-01', 28000),
(20, 105, '2026-04-01', 35000),

(21, 106, '2026-01-01', 45000),
(22, 106, '2026-02-01', 50000),
(23, 106, '2026-03-01', 48000),
(24, 106, '2026-04-01', 55000);

SELECT * FROM Employees;
SELECT * FROM MonthlySales;

--Example 1: Previous Employee Salary
select *,lag(salary) over(order by employeeId) PreviousEmpSal from Employees
--Example 2: Next Employee Salary
select *,lead(salary) over(order by employeeId) NextEmpSal from Employees;
--11. Compare Current Salary with Previous Salary
with PrevSalTab as (
select *,lag(salary) over(order by employeeId) PreviousEmpSal from Employees
)
select * ,comparision = PreviousEmpSal - salary from PrevSalTab

--12. Using LAG with a Default Value
select *,lag(salary,1,0) over(order by employeeId) PreviousEmpSal from Employees

--13. Level 2 – LAG with PARTITION BY
--Example 5: Previous Salary Within Each Department
select *,lag(salary,1,0) over(partition by departmentid order by employeeId) PreviousEmpSal from Employees

--14. LEAD with PARTITION BY
--Example 6: Next Salary Within Each Department
select *,lead(salary) over(partition by departmentid order by employeeId) NextEmpSal from Employees;

--15. Moderate – Monthly Sales Comparison
--Example 7: Current Month vs Previous Month
select *, comp = Total-PrevMonthTotal from (
select *,lag(Total) over(order by month) as PrevMonthTotal from (
select year(saleMonth) year ,month(saleMonth) Month,sum(salesAmount) Total  from MonthlySales
group by year(saleMonth),month(saleMonth)) as a) as b

SELECT
    EmployeeID,
    SaleMonth,
    SalesAmount,
    LAG(SalesAmount) OVER
    (
        PARTITION BY EmployeeID
        ORDER BY SaleMonth
    ) AS PreviousMonthSales
FROM MonthlySales
ORDER BY EmployeeID, SaleMonth;

select * from MonthlySales

--16. Moderate – Calculate Month-over-Month Change
--Example 8: Sales Difference and Percentage Change

select *,lag(SalesAmount) ovrer(order by ) from MonthlySales M

select * from MonthlySales


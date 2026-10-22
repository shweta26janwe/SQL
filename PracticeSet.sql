-- STEP 1: CREATE DATABASE
-- ============================================================

IF DB_ID('DataAnalyst_Assignment') IS NULL
BEGIN
    CREATE DATABASE DataAnalyst_Assignment;
END
GO

USE DataAnalyst_Assignment;
GO


-- ============================================================
-- STEP 2: DROP TABLES IF THEY ALREADY EXIST
-- ============================================================

DROP TABLE IF EXISTS dbo.Payments;
DROP TABLE IF EXISTS dbo.Orders;
DROP TABLE IF EXISTS dbo.SalesTarget;
DROP TABLE IF EXISTS dbo.Product;
DROP TABLE IF EXISTS dbo.Customer;
DROP TABLE IF EXISTS dbo.Employee;
DROP TABLE IF EXISTS dbo.Department;
GO


-- ============================================================
-- STEP 3: CREATE DEPARTMENT TABLE
-- ============================================================

CREATE TABLE dbo.Department
(
    DepartmentID   INT PRIMARY KEY,
    DepartmentName VARCHAR(50) NOT NULL,
    Location       VARCHAR(50) NOT NULL
);
GO


-- ============================================================
-- INSERT DEPARTMENT DATA
-- ============================================================

INSERT INTO dbo.Department
(
    DepartmentID,
    DepartmentName,
    Location
)
VALUES
(1, 'IT',         'Pune'),
(2, 'Finance',    'Mumbai'),
(3, 'Sales',      'Bengaluru'),
(4, 'HR',         'Pune'),
(5, 'Operations', 'Hyderabad');
GO


-- ============================================================
-- STEP 4: CREATE EMPLOYEE TABLE
-- ============================================================

CREATE TABLE dbo.Employee
(
    EmployeeID       INT PRIMARY KEY,
    EmployeeName     VARCHAR(100) NOT NULL,
    DepartmentID     INT NOT NULL,
    ManagerID        INT NULL,
    JoiningDate      DATE NOT NULL,
    Salary           DECIMAL(12,2) NOT NULL,
    EmploymentStatus VARCHAR(20) NOT NULL,

    CONSTRAINT FK_Employee_Department
        FOREIGN KEY (DepartmentID)
        REFERENCES dbo.Department(DepartmentID),

    CONSTRAINT FK_Employee_Manager
        FOREIGN KEY (ManagerID)
        REFERENCES dbo.Employee(EmployeeID)
);
GO


-- ============================================================
-- INSERT EMPLOYEE DATA
-- ============================================================

INSERT INTO dbo.Employee
(
    EmployeeID,
    EmployeeName,
    DepartmentID,
    ManagerID,
    JoiningDate,
    Salary,
    EmploymentStatus
)
VALUES
(101, 'Amit',   1, NULL, '2021-04-12',  95000, 'Active'),
(102, 'Neha',   1, 101,  '2022-08-15',  82000, 'Active'),
(103, 'Ravi',   1, 101,  '2023-01-20',  82000, 'Active'),
(104, 'Priya',  2, NULL, '2020-06-10', 105000, 'Active'),
(105, 'Karan',  2, 104,  '2022-02-18',  72000, 'Active'),
(106, 'Sneha',  3, NULL, '2021-09-01',  90000, 'Active'),
(107, 'Vikas',  3, 106,  '2023-05-11',  65000, 'Active'),
(108, 'Anita',  4, NULL, '2019-11-25',  78000, 'Active'),
(109, 'Rahul',  5, NULL, '2022-03-17',  88000, 'Active'),
(110, 'Meera',  3, 106,  '2024-01-08',  65000, 'Inactive');
GO


-- ============================================================
-- STEP 5: CREATE CUSTOMER TABLE
-- ============================================================

CREATE TABLE dbo.Customer
(
    CustomerID      INT PRIMARY KEY,
    CustomerName    VARCHAR(100) NOT NULL,
    City            VARCHAR(50) NULL,
    CustomerSegment VARCHAR(20) NOT NULL,
    SignupDate      DATE NOT NULL
);
GO


-- ============================================================
-- INSERT CUSTOMER DATA
-- ============================================================

INSERT INTO dbo.Customer
(
    CustomerID,
    CustomerName,
    City,
    CustomerSegment,
    SignupDate
)
VALUES
(201, 'Aarav',  'Pune',   'Premium',  '2023-01-10'),
(202, 'Ananya', 'Mumbai', 'Standard', '2023-03-15'),
(203, 'Rohan',  'Nashik', 'Premium', '2023-05-21'),
(204, 'Sneha',  'Pune',   'Standard', '2024-01-11'),
(205, 'Arjun',  'Nagpur', 'Premium',  '2024-02-19'),
(206, 'Meera',  NULL,     'Standard', '2024-04-05'),
(207, 'Aarav',  'Nashik', 'Standard', '2024-05-12');
GO


-- ============================================================
-- STEP 6: CREATE PRODUCT TABLE
-- ============================================================

CREATE TABLE dbo.Product
(
    ProductID   INT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Category    VARCHAR(50) NOT NULL,
    UnitPrice   DECIMAL(12,2) NOT NULL
);
GO


-- ============================================================
-- INSERT PRODUCT DATA
-- ============================================================

INSERT INTO dbo.Product
(
    ProductID,
    ProductName,
    Category,
    UnitPrice
)
VALUES
(301, 'Laptop',   'Electronics', 75000),
(302, 'Monitor',  'Electronics', 25000),
(303, 'Keyboard', 'Accessories',  3000),
(304, 'Mouse',    'Accessories',  1500),
(305, 'Desk',     'Furniture',   12000),
(306, 'Chair',    'Furniture',    8000);
GO


-- ============================================================
-- STEP 7: CREATE ORDERS TABLE
-- ============================================================

CREATE TABLE dbo.Orders
(
    OrderID     INT PRIMARY KEY,
    CustomerID  INT NOT NULL,
    ProductID   INT NOT NULL,
    OrderDate   DATE NOT NULL,
    Quantity    INT NOT NULL,
    UnitPrice   DECIMAL(12,2) NOT NULL,
    OrderStatus VARCHAR(20) NOT NULL,

    CONSTRAINT FK_Orders_Customer
        FOREIGN KEY (CustomerID)
        REFERENCES dbo.Customer(CustomerID),

    CONSTRAINT FK_Orders_Product
        FOREIGN KEY (ProductID)
        REFERENCES dbo.Product(ProductID)
);
GO


-- ============================================================
-- INSERT ORDERS DATA
-- ============================================================

INSERT INTO dbo.Orders
(
    OrderID,
    CustomerID,
    ProductID,
    OrderDate,
    Quantity,
    UnitPrice,
    OrderStatus
)
VALUES
(5001, 201, 301, '2025-01-05', 1, 75000, 'Completed'),
(5002, 201, 303, '2025-01-18', 2,  3000, 'Completed'),
(5003, 202, 302, '2025-02-10', 2, 25000, 'Completed'),
(5004, 203, 304, '2025-02-15', 3,  1500, 'Cancelled'),
(5005, 203, 305, '2025-03-01', 2, 12000, 'Completed'),
(5006, 204, 306, '2025-03-12', 4,  8000, 'Completed'),
(5007, 205, 301, '2025-04-07', 1, 75000, 'Completed'),
(5008, 206, 302, '2025-04-19', 1, 25000, 'Pending'),
(5009, 207, 303, '2025-05-08', 5,  3000, 'Completed'),
(5010, 201, 302, '2025-05-20', 1, 25000, 'Completed'),
(5011, 202, 306, '2025-06-03', 2,  8000, 'Completed'),
(5012, 205, 304, '2025-06-18', 2,  1500, 'Completed');
GO


-- ============================================================
-- STEP 8: CREATE PAYMENTS TABLE
-- ============================================================

CREATE TABLE dbo.Payments
(
    PaymentID     INT PRIMARY KEY,
    OrderID       INT NOT NULL,
    PaymentDate   DATE NOT NULL,
    PaymentAmount DECIMAL(12,2) NOT NULL,
    PaymentStatus VARCHAR(20) NOT NULL,
    PaymentMode   VARCHAR(30) NOT NULL,

    CONSTRAINT FK_Payments_Orders
        FOREIGN KEY (OrderID)
        REFERENCES dbo.Orders(OrderID)
);
GO


-- ============================================================
-- INSERT PAYMENTS DATA
-- ============================================================

INSERT INTO dbo.Payments
(
    PaymentID,
    OrderID,
    PaymentDate,
    PaymentAmount,
    PaymentStatus,
    PaymentMode
)
VALUES
(9001, 5001, '2025-01-05', 75000, 'Success',  'UPI'),
(9002, 5002, '2025-01-18',  6000, 'Success',  'Card'),
(9003, 5003, '2025-02-10', 50000, 'Success',  'Card'),
(9004, 5004, '2025-02-15',  4500, 'Refunded', 'Card'),
(9005, 5005, '2025-03-01', 24000, 'Success',  'UPI'),
(9006, 5006, '2025-03-12', 32000, 'Success',  'NetBanking'),
(9007, 5007, '2025-04-07', 75000, 'Success',  'Card'),
(9008, 5008, '2025-04-19', 25000, 'Pending',  'UPI'),
(9009, 5009, '2025-05-08', 15000, 'Success',  'UPI'),
(9010, 5010, '2025-05-20', 25000, 'Success',  'Card'),
(9011, 5011, '2025-06-03', 16000, 'Success',  'UPI'),
(9012, 5012, '2025-06-18',  3000, 'Success',  'Card');
GO


-- ============================================================
-- STEP 9: CREATE SALESTARGET TABLE
-- ============================================================

CREATE TABLE dbo.SalesTarget
(
    TargetID      INT PRIMARY KEY,
    DepartmentID  INT NOT NULL,
    TargetMonth   DATE NOT NULL,
    TargetAmount  DECIMAL(12,2) NOT NULL,

    CONSTRAINT FK_SalesTarget_Department
        FOREIGN KEY (DepartmentID)
        REFERENCES dbo.Department(DepartmentID)
);
GO


-- ============================================================
-- INSERT SALES TARGET DATA
-- ============================================================

INSERT INTO dbo.SalesTarget
(
    TargetID,
    DepartmentID,
    TargetMonth,
    TargetAmount
)
VALUES
(1, 3, '2025-01-01', 100000),
(2, 3, '2025-02-01', 120000),
(3, 3, '2025-03-01', 125000),
(4, 3, '2025-04-01', 130000),
(5, 3, '2025-05-01', 135000),
(6, 3, '2025-06-01', 140000);
GO


-- ============================================================
-- STEP 10: VERIFY DATA
-- ============================================================

SELECT * FROM dbo.Department;
SELECT * FROM dbo.Employee;
SELECT * FROM dbo.Customer;
SELECT * FROM dbo.Product;
SELECT * FROM dbo.Orders;
SELECT * FROM dbo.Payments;
SELECT * FROM dbo.SalesTarget;
GO


-- ============================================================
-- STEP 11: VERIFY RECORD COUNTS
-- ============================================================

SELECT 'Department' AS TableName, COUNT(*) AS RecordCount
FROM dbo.Department

UNION ALL

SELECT 'Employee', COUNT(*) FROM dbo.Employee

UNION ALL

SELECT 'Customer', COUNT(*) FROM dbo.Customer

UNION ALL

SELECT 'Product', COUNT(*) FROM dbo.Product

UNION ALL

SELECT 'Orders', COUNT(*) FROM dbo.Orders

UNION ALL

SELECT 'Payments', COUNT(*) FROM dbo.Payments

UNION ALL

SELECT 'SalesTarget', COUNT(*) FROM dbo.SalesTarget;
GO

--SECTION A – SQL – 40 QUESTIONS
--1. Display all customers along with their city and customer segment.
select CustomerName,City,CustomerSegment from Customer

--2. Find all completed orders and calculate order value as Quantity × UnitPrice.
select *, Order_Value = Quantity*UnitPrice from Orders
where OrderStatus = 'Completed'
--3. Find customers who live in Pune or Nashik.
select * from Customer
where City in ('Pune','Nashik')


--4. Display customers whose name starts with A.
select * from Customer
where CustomerName like 'A%'
--5. Find orders placed between January and March 2025.
select *,datename(month,OrderDate) as Month from Orders
where month(OrderDate) between 1 and 3 
--6. Find customers whose city is NULL and display Unknown instead.
select *,isnull(City,'Unknown') city from Customer

update Customer set city = 'Unknown'
where city is null
select * from Customer
--7. Display products ordered by UnitPrice highest to lowest.
select * from Product
order by UnitPrice desc
--8. Find total number of orders for each customer, including customers with no orders.
select C.CustomerID,count(*) as Total_NO_Orders 
from Customer C join Orders O on C.CustomerID = O.CustomerID
group by C.CustomerID
--9. Find total completed sales amount for each customer.
select C.CustomerID,sum(O.UnitPrice * O.Quantity) [Total Sales] from Customer C join Orders O on C.CustomerID = O.CustomerID
where OrderStatus = 'Completed'
group by C.CustomerID
select * from Orders
select * from SalesTarget
--10. Find customers whose completed sales amount is greater than 50000.
select C.CustomerID,sum(O.UnitPrice * O.Quantity) [Total Sales] from Customer C join Orders O on C.CustomerID = O.CustomerID
where OrderStatus = 'Completed'
group by C.CustomerID
having sum(O.UnitPrice * O.Quantity) > 50000
--11. Find average product price for each product category.
select  Category,avg(UnitPrice) as Avg_Price from Product
group by Category
--12. Find the highest-priced product in each category.
select  Category,max(UnitPrice) as Highest_Priced_Product from Product
group by Category
--13. Display employees with their department names and salaries.
select EmployeeID,EmployeeName,DepartmentName,Salary
from Employee E join Department D on E.DepartmentID = D.DepartmentID

--14. Find employees whose salary is greater than the average salary.
select * from Employee
where Salary > (select avg(Salary) from Employee)
--15. Find the second-highest distinct employee salary.
select distinct max(Salary) from Employee
where Salary < (select max(Salary) from Employee)

order by Salary desc
--16. Find departments having at least 2 employees.
select D.DepartmentName,count(EmployeeID) No_Of_EMP 
from Employee E join Department D on E.DepartmentID = D.DepartmentID
group by D.DepartmentName
having count(EmployeeID)>2
--17. Display each employee and manager name using a self join.
select E1.EmployeeID,E1.EmployeeName,E2.EmployeeName as Manager_Name 
from Employee E1 join Employee E2 on E1.ManagerID =E2.EmployeeID

--18. Find departments that currently have no inactive employee.
select distinct D.DepartmentName from Department D join Employee E on E.DepartmentID=D.DepartmentID
where not exists (select 1 from Employee E2 where E2.DepartmentID = D.DepartmentID and
EmploymentStatus = 'Inactive')

--19. Find customers who have never placed an order.
select * from Customer C join Orders O on C.CustomerID = O.CustomerID
where exists (Select 1 from Customer C1 
where C1.CustomerID = O.CustomerID and O.OrderStatus = 'Pending')

--20. Find customers who have at least one completed order.
select Distinct C.CustomerID,C.CustomerName,O.OrderStatus
from Customer C join Orders O on C.CustomerID = O.CustomerID
where exists (Select 1 from Customer C1 
where C1.CustomerID = O.CustomerID and O.OrderStatus = 'Completed')

--21. Find total completed order value by month.
select month(OrderDate),count(OrderID) from Orders
where OrderStatus = 'Completed'
group by month(OrderDate)

select * from Orders
--22. Find the top 3 customers based on completed sales value.
select Top 3 C.CustomerID,C.CustomerName,sum(Quantity*UnitPrice) Total
from Customer C join Orders O on C.CustomerID = O.CustomerID
where OrderStatus = 'Completed'
group by C.CustomerID,C.CustomerName
order by sum(Quantity*UnitPrice) desc

select * from Customer
select * from Orders
--23. Find duplicate customer names and their count.
select CustomerName, count(CustomerID) Count from Customer
group by CustomerName
having count(CustomerID) > 1
--24. Display each order with customer name, product name, 
--quantity and calculated order value.
select C.CustomerName,P.ProductName,O.Quantity, order_val = O.Quantity*O.UnitPrice
from Customer C join Orders O on C.CustomerID = O.CustomerID 
join Product P on P.ProductID = O.ProductID

select * from Product
select * from Orders
--25. Find completed orders whose value is greater than the average completed order value.
select * from Orders
where Quantity*UnitPrice > (select avg(Quantity*UnitPrice) from Orders 
where OrderStatus = 'Completed')
--26. Use CASE to classify customers as High Value when completed sales are at least 75000,
--otherwise Regular.
select *,case when Quantity*UnitPrice >= 75000 then 'High Value'
else 'Regular'
end as Clasification
from Customer C join Orders O on C.CustomerID=O.CustomerID
where OrderStatus='Completed'
select * from Orders

select C.CustomerID, C.CustomerName,sum(Quantity*UnitPrice) Price,
case when sum(Quantity*UnitPrice) >= 75000 then 'High Value'
else 'Regular'
end as Clasification
from Customer C join Orders O on C.CustomerID=O.CustomerID
where OrderStatus='Completed'
group by C.CustomerID, C.CustomerName
--27. Use COALESCE to display missing customer cities as Not Provided.
select *, coalesce(City,'Unknown') city from Customer 
select * from Customer
--28. Find the latest order date for every customer.
select CustomerID,max(OrderDate) LatestOrderDate from Orders
group by CustomerID
--29. For every customer, show each order and the previous order value using LAG().
select *,lag(Quantity*UnitPrice)  over(partition by C.CustomerID order by O.OrderDate) 
from Customer C join Orders O on C.CustomerID = O.CustomerID
--30. Rank employees by salary within each department using RANK().
select *,rank() over(partition by DepartmentID order by Salary desc)  Ranks from Employee
--31. Show employee salary rank without gaps using DENSE_RANK().
select *,dense_rank() over(order by Salary desc) Ranks 
from Employee

--32. Assign a unique row number to employees within each department based on joining date.
select *,row_number() over(partition by DepartmentID order by JoiningDate )  
Ranks from Employee

--33. For every customer, show the next order date using LEAD().
select *, Lead(OrderDate) over(partition by C.CustomerID order by OrderDate) NextOrderDate 
from Customer C join Orders O on C.CustomerID=O.CustomerID

--34. Show each completed order and the difference between its value and the previous order
--value for the same customer.
with Diff as
(select  C.CustomerID,
        O.OrderID,
        O.OrderDate,
        O.Quantity * O.UnitPrice AS OrderValue, lag(Quantity*UnitPrice) over(partition by C.CustomerID order by OrderDate) 
PreviousOrderValue 
from Customer C join Orders O on C.CustomerID=O.CustomerID
where OrderStatus = 'Completed') 
select CustomerID,
    OrderID,
    OrderDate,
    OrderValue,
    PreviousOrderValue,OrderValue - PreviousOrderValue as Differences  from Diff;


--35. Using a CTE, calculate total completed sales by customer and return customers 
--above 50000.


WITH filterr AS (
    SELECT
        C.CustomerID,
        COUNT(C.CustomerID) AS Total,
        SUM(Quantity * UnitPrice) AS TTotal
    FROM Customer C
    JOIN Orders O
        ON C.CustomerID = O.CustomerID
    WHERE OrderStatus = 'Completed'
    GROUP BY C.CustomerID
)
SELECT *
FROM filterr
WHERE TTotal > 50000;

select * from Orders;
--36. Using a CTE, find the highest-paid employee in every department.
with HighPaid as (
select max(Salary) Highest from Employee 
group by DepartmentID)
select * from HighPaid h join Employee e on e.EmployeeID = h.employeeId 
AND E.Salary = H.HighestSalary;


WITH HighPaid AS
(
    SELECT
        DepartmentID,
        MAX(Salary) AS HighestSalary
    FROM Employee
    GROUP BY DepartmentID
)
SELECT E.*
FROM Employee E
JOIN HighPaid H
    ON E.DepartmentID = H.DepartmentID
    AND E.Salary = H.HighestSalary;
--37. Find products that have never been ordered.
select * from Product P 
where exists (select 1 from Orders O where P.ProductID = O.ProductID)

select * from Product P 
where not exists (select 1 from Orders O where P.ProductID = O.ProductID)

select * from Product
select * from Orders;
--38. Find customers whose completed sales are greater than every completed sale
--made by customer 202.
with NewTable as (
select c.CustomerID,c.CustomerName,o.OrderID,O.Quantity*O.UnitPrice as Price from Customer c join Orders O on c.CustomerID = O.CustomerID
where OrderStatus = 'Completed')
select CustomerID,CustomerName,OrderID,Price from NewTable 
where Price > all(select Quantity*UnitPrice from Orders 
where customerId = 202) ;

--39. Compare monthly completed sales against SalesTarget and show target, 
--actual and variance.
select * from SalesTarget

--40. Identify customers whose completed sales increased from their previous order 
--using LAG().
with IncreTable as 
(
select C.CustomerName,O.OrderID,O.OrderDate,O.OrderStatus,CurrPrice = Quantity*UnitPrice,
lag(Quantity*UnitPrice) over(partition by c.customerId 
order by OrderDate) PrevSal from Customer C join Orders O on C.customerID = O.customerID
where OrderStatus = 'Completed'
),
DiffTable as (
select CustomerName,OrderID,OrderDate,OrderStatus,CurrPrice,PrevSal,
DiffIn = CurrPrice - PrevSal from IncreTable
)
select CustomerName,OrderID,OrderDate,OrderStatus,CurrPrice,PrevSal,DiffIn
from DiffTable
where DiffIn > 0



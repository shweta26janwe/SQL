-- 1. LEARNING OBJECTIVES
--•	Understand CASE for conditional classification and derived values.
--•	Understand COALESCE for selecting the first available non-NULL value.
--•	Differentiate simple CASE and searched CASE.
--•	Understand correlated and non-correlated subqueries.
--•	Use EXISTS and NOT EXISTS for presence and absence checks.
--•	Understand ANY and ALL when comparing one value with a set returned by a subquery.
--•	Compare JOIN, EXISTS, NOT EXISTS and correlated subqueries based on the requirement.
--•	Combine today's concepts with all previously covered SQL topics.
--2. THEORY NOTES – TODAY'S TOPICS
--2.1 CASE Expression
--CASE is a conditional expression that returns a value based on one or more conditions. It is useful for deriving categories, statuses, labels and business classifications.
--Searched CASE:
--CASE
--    WHEN condition1 THEN result1
--    WHEN condition2 THEN result2
--    ELSE default_result
--END
--Simple CASE compares one expression with multiple possible values:
--CASE expression
--    WHEN value1 THEN result1
--    WHEN value2 THEN result2
--    ELSE default_result
--END
--The first matching condition determines the returned result. If no condition matches and ELSE is not supplied, the result can be NULL.
--2.2 COALESCE
--COALESCE returns the first non-NULL expression from a list. It is useful when a value may be available in multiple columns and the query should select the first available value.
--COALESCE(expression1, expression2, expression3)
--It can also provide a fallback value before calculations when a NULL value should be treated as an appropriate alternative.
--2.3 Correlated Subquery
--A correlated subquery is an inner query that refers to a column from the outer query. Its result therefore depends on the current outer row.
--A non-correlated subquery can normally execute independently. A correlated subquery is useful when the comparison value must change according to the current row, such as comparing an employee's salary with the average salary of that employee's department.
--For teaching purposes, trace it as: outer row → related inner rows → calculated comparison → decision for that outer row.
--2.4 EXISTS
--EXISTS checks whether the subquery returns at least one row. The important point is the existence of a matching row, not the actual value returned by the inner SELECT. It is useful when the requirement is to determine whether a related record exists.
--2.5 NOT EXISTS
--NOT EXISTS is the opposite existence test. It returns the outer row when the related subquery returns no matching rows. It is useful for missing relationships, orphan records and reconciliation checks.
--2.6 ANY and ALL
--ANY compares a value with the set returned by a subquery. The comparison succeeds when it is true for at least one returned value.
--ALL compares a value with the set returned by a subquery. The comparison succeeds only when it is true for every returned value.
--Operator	Meaning	Simple interpretation
--> ANY	Greater than at least one value	Can exceed the smallest qualifying value.
--> ALL	Greater than every value	Must exceed the largest qualifying value.
--< ANY	Less than at least one value	Must be below at least one returned value.
--< ALL	Less than every value	Must be below all returned values.
--2.7 EXISTS vs JOIN
--JOIN is normally used when columns from both related tables are needed. EXISTS is useful when the requirement is only to establish whether a related row exists. Multiple matching child rows can increase JOIN result rows, while an existence check focuses on whether a match is present.
--2.8 Performance and Data-Quality Considerations
--•	Do not assume correlated subqueries are always faster than JOINs, GROUP BY or window functions.
--•	Inspect execution plans when performance matters on large datasets.
--•	EXISTS and NOT EXISTS are useful for reconciliation and parent-child validation.
--•	Handle NULL values deliberately when using conditional and comparison logic.
--•	Validate table grain and duplicate rows when multiple tables are involved.
--3. TOPICS COVERED TILL DATE
--•	SELECT, aliases and calculated columns
--•	Comparison operators (=, >, <, >=, <=, <>, !=)
--•	AND, OR, NOT
--•	IN, NOT IN, BETWEEN, NOT BETWEEN
--•	Arithmetic operators (+, -, *, /, %)
--•	DISTINCT and TOP
--•	LIKE, IS NULL, IS NOT NULL
--•	ORDER BY
--•	Aggregate functions
--•	GROUP BY and HAVING
--•	Subqueries – non-correlated and filtering subqueries
--•	INNER, LEFT, RIGHT and FULL OUTER JOIN
--•	SELF JOIN, CROSS JOIN, EQUI JOIN and NON-EQUI JOIN
--•	UNION, UNION ALL, INTERSECT and EXCEPT
--•	GETDATE, SYSDATETIME, CURRENT_TIMESTAMP
--•	YEAR, MONTH, DAY, DATENAME, DATEPART
--•	DATEADD, DATEDIFF, EOMONTH
--•	FORMAT, CAST and CONVERT
--•	LEN, DATALENGTH, LEFT, RIGHT, SUBSTRING
--•	CHARINDEX, PATINDEX, REPLACE, STUFF, REPLICATE, TRANSLATE, REVERSE
--•	LTRIM, RTRIM, TRIM, UPPER, LOWER, ASCII, CHAR, UNICODE, NCHAR
--•	STRING_SPLIT, STRING_AGG, CONCAT, CONCAT_WS
--•	ROUND, ABS, CEILING, FLOOR, SQRT, POWER
--•	IIF, CHOOSE, ISNULL, COALESCE, CASE
--•	Correlated subqueries, EXISTS, NOT EXISTS, ANY and ALL

--DATASET SETUP – SQL SERVER / SSMS
--Run this script before attempting the assignment. The records intentionally include NULLs, missing relationships, department-level salary differences, customers without orders, products without orders, and comparison values for ANY/ALL.
--DEPARTMENT_SET10
CREATE TABLE DEPARTMENT_SET10 (
    DEPT_ID INT PRIMARY KEY,
    DEPT_NAME VARCHAR(50)
);
INSERT INTO DEPARTMENT_SET10 VALUES
(10,'IT'),(20,'HR'),(30,'Finance'),(40,'Testing'),(50,'Operations'),(60,'Research');

EMPLOYEE_SET10
CREATE TABLE EMPLOYEE_SET10 (
    EMP_ID INT PRIMARY KEY,
    EMP_NAME VARCHAR(80),
    DEPT_ID INT NULL,
    SALARY DECIMAL(12,2),
    PERFORMANCE_SCORE INT,
    EMAIL VARCHAR(100) NULL,
    SALARY_ADJUSTMENT DECIMAL(12,2) NULL
);

INSERT INTO EMPLOYEE_SET10 VALUES
(101,'Amit Sharma',10,50000.00,82,'amit.sharma@gmail.com',1500.25),
(102,'Priya Patil',10,70000.50,91,'priya.patil@gmail.com',-750.75),
(103,'Rahul Verma',20,60000.00,76,'rahul.verma@outlook.com',500.00),
(104,'Sneha Kulkarni',20,80000.75,95,'sneha.kulkarni@gmail.com',2250.50),
(105,'Neha Joshi',30,55000.25,68,'neha.joshi@yahoo.com',NULL),
(106,'Karan Mehta',30,90000.00,88,'karan.mehta@gmail.com',1250.00),
(107,'Rohan Shah',40,45000.50,72,'rohan.shah@outlook.com',-500.25),
(108,'Pooja Nair',40,65000.00,84,'pooja.nair@gmail.com',1000.00),
(109,'Vikas Rao',NULL,72000.25,79,'vikas.rao@yahoo.com',NULL),
(110,'Meera Desai',50,110000.00,97,'meera.desai@gmail.com',3250.75),
(111,'Arjun Singh',10,40000.00,61,NULL,-250.50),
(112,'Kavya Iyer',60,125000.00,93,'kavya.iyer@gmail.com',5000.00);

CUSTOMER_SET10
CREATE TABLE CUSTOMER_SET10 (
    CUSTOMER_ID INT PRIMARY KEY,
    CUSTOMER_NAME VARCHAR(80),
    CITY VARCHAR(50),
    EMAIL VARCHAR(100) NULL,
    PHONE VARCHAR(20) NULL,
    ALT_EMAIL VARCHAR(100) NULL,
    ALT_PHONE VARCHAR(20) NULL,
    CUSTOMER_TYPE VARCHAR(30)
);
INSERT INTO CUSTOMER_SET10 VALUES
(201,'Aditya Kumar','Mumbai','aditya@gmail.com','9876500001',NULL,NULL,'Premium'),
(202,'Bhavna Shah','Pune',NULL,'9876500002','bhavna.alt@gmail.com',NULL,'Regular'),
(203,'Chetan Rao','Delhi','chetan@outlook.com',NULL,NULL,'9123400003','Corporate'),
(204,'Divya Nair','Mumbai',NULL,NULL,'divya.alt@yahoo.com','9123400004','Premium'),
(205,'Eshan Patil','Nashik','eshan@gmail.com','9876500005',NULL,NULL,'Regular'),
(206,'Farah Khan','Pune','farah@company.com',NULL,NULL,'9123400006','Corporate'),
(207,'Gaurav Joshi','Bangalore','gaurav@gmail.com','9876500007',NULL,NULL,'Premium'),
(208,'Hema Desai','Mumbai',NULL,NULL,NULL,'9123400008','Regular');

PRODUCT_SET10
CREATE TABLE PRODUCT_SET10 (
    PRODUCT_ID INT PRIMARY KEY,
    PRODUCT_NAME VARCHAR(100),
    CATEGORY VARCHAR(50),
    PRICE DECIMAL(12,2),
    STOCK_QTY INT,
    SUPPLIER_ID INT NULL
);
INSERT INTO PRODUCT_SET10 VALUES
(301,'Laptop Pro','Electronics',85000.50,15,501),
(302,'Wireless Mouse','Electronics',1250.75,120,502),
(303,'Office Chair','Furniture',9500.00,8,503),
(304,'Desk','Furniture',15000.25,0,NULL),
(305,'Monitor 27','Electronics',22000.00,35,501),
(306,'Keyboard','Electronics',2750.50,60,502),
(307,'Notebook Pack','Stationery',450.25,200,504),
(308,'Printer','Electronics',18500.75,5,NULL),
(309,'Conference Table','Furniture',45000.00,2,503),
(310,'Webcam','Electronics',6500.25,0,502);

ORDER_SET10
CREATE TABLE ORDER_SET10 (
    ORDER_ID INT PRIMARY KEY,
    CUSTOMER_ID INT,
    PRODUCT_ID INT,
    ORDER_AMOUNT DECIMAL(12,2),
    ORDER_DATE DATE,
    ORDER_STATUS VARCHAR(30)
);
INSERT INTO ORDER_SET10 VALUES
(401,201,301,85000.50,'2026-01-12','Completed'),
(402,201,302,1250.75,'2026-02-15','Completed'),
(403,202,303,9500.00,'2026-02-20','Pending'),
(404,203,305,44000.00,'2026-03-05','Completed'),
(405,205,307,900.50,'2026-03-18','Completed'),
(406,206,306,2750.50,'2026-04-11','Cancelled'),
(407,207,301,170001.00,'2026-05-09','Completed'),
(408,201,305,22000.00,'2026-06-14','Completed'),
(409,203,302,2501.50,'2026-07-22','Completed'),
(410,205,304,15000.25,'2026-08-03','Pending'),
(411,206,308,18500.75,'2025-12-19','Completed'),
(412,207,306,5501.00,'2026-08-21','Completed');

TARGET_CUSTOMER_SET10
CREATE TABLE TARGET_CUSTOMER_SET10 (
    CUSTOMER_ID INT PRIMARY KEY,
    CUSTOMER_NAME VARCHAR(80)
);
INSERT INTO TARGET_CUSTOMER_SET10 VALUES
(201,'Aditya Kumar'),(202,'Bhavna Shah'),(203,'Chetan Rao'),
(205,'Eshan Patil'),(207,'Gaurav Joshi');

EMPLOYEE_ACTIVITY_SET10
CREATE TABLE EMPLOYEE_ACTIVITY_SET10 (
    ACTIVITY_ID INT PRIMARY KEY,
    EMP_ID INT,
    ACTIVITY_DATE DATE,
    ACTIVITY_TYPE VARCHAR(40)
);
INSERT INTO EMPLOYEE_ACTIVITY_SET10 VALUES
(601,101,'2026-08-01','Training'),
(602,102,'2026-08-02','Project'),
(603,104,'2026-08-03','Project'),
(604,106,'2026-08-04','Review'),
(605,108,'2026-08-05','Training'),
(606,110,'2026-08-06','Project'),
(607,112,'2026-08-07','Research');

--SECTION B – 15 QUESTIONS: CASE, COALESCE AND PREVIOUS TOPICS
--Q11. Display each employee's name, department and a derived employment category based on salary range.
use bank;
select * from EMPLOYEE_SET10
select * from DEPARTMENT_SET10
select E.EMP_NAME,D.DEPT_NAME,E.SALARY, CASE WHEN E.SALARY <= 50000 THEN 'FRESHER'
WHEN E.SALARY BETWEEN 50000 AND 100000 THEN 'EXPERIENCED' 
ELSE 'WELL EXPERIENCED' 
END AS EMP_CATEGORY from EMPLOYEE_SET10 E LEFT JOIN DEPARTMENT_SET10 D
ON E.DEPT_ID = D.DEPT_ID

--Q12. Display each employee's name and a derived performance label based on performance score.
select EMP_NAME,PERFORMANCE_SCORE,IIF(PERFORMANCE_SCORE > 70,'WELL PERFORMED','GOOD PERFORMANCE ') PERFORMANCE_LABEL
from EMPLOYEE_SET10


--Q13. Display each customer's name and one preferred contact value using the available contact details.
SELECT CUSTOMER_NAME,COALESCE(EMAIL,PHONE,ALT_EMAIL,ALT_PHONE) CONTACT FROM CUSTOMER_SET10
SELECT CUSTOMER_NAME,COALESCE(PHONE,ALT_PHONE) CONTACT FROM CUSTOMER_SET10
SELECT * FROM CUSTOMER_SET10
--Q14. Display each product's name, category and a derived stock status based on current stock quantity.
SELECT PRODUCT_NAME,CATEGORY,PRICE,STOCK_QTY, 
CASE WHEN STOCK_QTY = 0 THEN 'NO STOCK'
WHEN STOCK_QTY < 20 THEN 'LIMITAED STOCK'
WHEN STOCK_QTY < 80 THEN 'BETTER STCK'
ELSE 'HIGH STOCK' 
END STOCK_STATUS 
FROM PRODUCT_SET10
--Q15. Display each order's order ID, amount and a derived order-size classification using multiple amount ranges.
SELECT ORDER_ID,ORDER_AMOUNT,
CASE WHEN ORDER_AMOUNT > 100000 THEN 'HIGH AMOUNT ORDER'
WHEN ORDER_AMOUNT > 20000 THEN 'REGULAR AMOUNT ORDER'
ELSE 'LOW AMOUNT ORDER'
END ORDER_SIZE
FROM ORDER_SET10
--Q16. Find employees whose salary is greater than the average salary of all employees.
select * from EMPLOYEE_SET10
where SALARY > (SELECT AVG(SALARY) FROM EMPLOYEE_SET10)

--Q17. Find customers whose total order value is greater than the average total order value across customers.
SELECT CUSTOMER_ID, SUM(ORDER_AMOUNT) [TOTAL ORDER AMT],AVG(ORDER_AMOUNT) FROM ORDER_SET10
GROUP BY CUSTOMER_ID
HAVING SUM(ORDER_AMOUNT) > (SELECT AVG(ORDER_AMOUNT) FROM ORDER_SET10)

SELECT CUSTOMER_ID, SUM(ORDER_AMOUNT) [TOTAL ORDER AMT],AVG(ORDER_AMOUNT) FROM ORDER_SET10
GROUP BY CUSTOMER_ID
HAVING SUM(ORDER_AMOUNT) >= AVG(ORDER_AMOUNT)
--Q18. Display departments together with the number of employees belonging to each department.
SELECT D.DEPT_ID,D.DEPT_NAME,COUNT(E.EMP_ID) [NO OF EMPLOYEES] FROM EMPLOYEE_SET10 E RIGHT JOIN  DEPARTMENT_SET10 D
ON E.DEPT_ID = D.DEPT_ID
GROUP BY D.DEPT_ID,D.DEPT_NAME
--Q19. Display all employees and their department names, including employees whose department relationship is missing.
SELECT * FROM EMPLOYEE_SET10 E LEFT JOIN  DEPARTMENT_SET10 D
ON E.DEPT_ID = D.DEPT_ID

--Q20. Find products whose price falls within the range represented by the supplied product-price data.
SELECT *,
CASE WHEN PRICE > 50000 THEN 'COSTLY PRODUCT'
WHEN PRICE > 10000 THEN 'MIDIUM CAST PRODUCT'
ELSE 'CHEEP PRODUCT'
END PRODUCT_CATEGORY FROM PRODUCT_SET10
--Q21. Find customers whose email addresses belong to the supplied email domain pattern.
SELECT *, SUBSTRING(COALESCE(EMAIL,ALT_EMAIL),CHARINDEX('@',COALESCE(EMAIL,ALT_EMAIL))+1,
PATINDEX('%.COM',COALESCE(EMAIL,ALT_EMAIL)) - 1 - CHARINDEX('@',COALESCE(EMAIL,ALT_EMAIL))) DOMAIN FROM CUSTOMER_SET9
WHERE COALESCE(EMAIL,ALT_EMAIL) LIKE  '%GMAIL%'

SELECT * FROM CUSTOMER_SET10
WHERE COALESCE(EMAIL,ALT_EMAIL) LIKE '%GMAIL%'
--Q22. Display the current year's orders with the order year, month name and day.
SELECT *, YEAR(ORDER_DATE) YEAR,MONTH(ORDER_DATE) MONTH ,DAY(ORDER_DATE)  DAY FROM ORDER_SET10
WHERE YEAR(ORDER_DATE) = YEAR(GETDATE())
--Q23. Display employee names in uppercase and extract the domain portion from their email addresses.
SELECT *,UPPER(EMP_NAME) [NAME IN UPPERCASE],substring(email,charindex('@',email)+1,
patindex('%.com%',email)-1 - charindex('@',email)) Domain FROM EMPLOYEE_SET10
SELECT * FROM EMPLOYEE_SET10
--Q24. Display each employee's salary rounded to two decimal places and also show the absolute value of the 
--salary adjustment.
SELECT *, ABS(ROUND(SALARY,2)),ABS(SALARY) FROM EMPLOYEE_SET10
--Q25. Using employee and department data, display employees with their department name and 
--classify their salary into meaningful categories.
select e.EMP_NAME,d.DEPT_NAME,salary,iif(salary>50000,'high salary','low salary') salary_category 
from EMPLOYEE_SET10 e join DEPARTMENT_SET10 d
on e.DEPT_ID = d.DEPT_ID


--SECTION C – 10 QUESTIONS: CORRELATED SUBQUERY, EXISTS, NOT EXISTS, ANY AND ALL
--Q26. Find employees whose salary is greater than the average salary of their own department.
SELECT * FROM EMPLOYEE_SET10 E 
WHERE SALARY > (SELECT AVG(SALARY) 
FROM EMPLOYEE_SET10 E1 WHERE E.DEPT_ID = E1.DEPT_ID)
--Q27. Find employees whose salary is less than the average salary of their own department.
SELECT * FROM EMPLOYEE_SET10 E 
WHERE SALARY < (SELECT AVG(SALARY) 
FROM EMPLOYEE_SET10 E1 WHERE E.DEPT_ID = E1.DEPT_ID)
--Q28. Find employees who earn the highest salary within their own department.
select * from EMPLOYEE_SET10 e1
where SALARY in 
(select max(salary) from EMPLOYEE_SET10 e2 where e1.dept_id =e2.DEPT_ID )

select DEPT_ID,max(salary) from EMPLOYEE_SET10
group by DEPT_ID
--Q29. Find employees who earn the lowest salary within their own department.
select * from EMPLOYEE_SET10 e1
where SALARY in 
(select min(salary) from EMPLOYEE_SET10 e2 
where e1.dept_id =e2.DEPT_ID )
--Q30. Find departments that have at least one employee.
select DEPT_NAME,count(EMP_ID) [N0. of EMP] from EMPLOYEE_SET10 E join DEPARTMENT_SET10 D 
on E.DEPT_ID = D.DEPT_ID
group by DEPT_NAME
having count(EMP_ID) >= 1

select DEPT_ID from DEPARTMENT_SET10 d
where  exists (select * from EMPLOYEE_SET10 e where d.dept_id = e.dept_id)
--Q31. Find departments that currently have no employees.
select DEPT_ID,count(EMP_ID) [N0. of EMP] from EMPLOYEE_SET10
group by DEPT_ID
having count(EMP_ID) = 0

select * from DEPARTMENT_SET10 d
where  not exists (select * from EMPLOYEE_SET10 e where d.dept_id = e.dept_id)


--Q32. Find customers who have placed at least one order.
select * from CUSTOMER_SET10
select * from ORDER_SET10
select * from CUSTOMER_SET10 c
where exists (select * from ORDER_SET10 o where c.CUSTOMER_ID=o.CUSTOMER_ID)

select * from CUSTOMER_SET10 c join ORDER_SET10 o on c.CUSTOMER_ID=o.CUSTOMER_ID
where exists (select * from ORDER_SET10 o where c.CUSTOMER_ID=o.CUSTOMER_ID) --this wiil give ans but best way is to use 
--exist because we only want the customer which at least 1 order not no. of order

--Q33. Find customers who have never placed an order.
select * from CUSTOMER_SET10 c
where not exists (select ORDER_ID from ORDER_SET10 o where c.CUSTOMER_ID=o.CUSTOMER_ID)

--Q34. Find products that have at least one order associated with them.
select * from PRODUCT_SET10 P
where exists (select * from ORDER_SET10 O where P.PRODUCT_ID = O.PRODUCT_ID )
--Q35. Find products that have never appeared in an order.
select * from PRODUCT_SET10 P
where not exists (select * from ORDER_SET10 O where P.PRODUCT_ID = O.PRODUCT_ID )

--SECTION D – 5 QUESTIONS: ANY AND ALL
--Q36. Find employees whose salary is greater than at least one salary in the HR department.
select * from EMPLOYEE_SET10
where salary > any(select salary from EMPLOYEE_SET10 E join DEPARTMENT_SET10 D on E.DEPT_ID = D.DEPT_ID
where d.DEPT_NAME = 'HR')

select salary from EMPLOYEE_SET10 E join DEPARTMENT_SET10 D on E.DEPT_ID = D.DEPT_ID
where d.DEPT_NAME = 'HR'
--Q37. Find employees whose salary is greater than every salary in the HR department.
select * from EMPLOYEE_SET10
where salary > all(select salary from EMPLOYEE_SET10 E join DEPARTMENT_SET10 D on E.DEPT_ID = D.DEPT_ID
where d.DEPT_NAME = 'HR')
--Q38. Find employees whose salary is lower than at least one salary in the IT department.
select * from EMPLOYEE_SET10
where salary < any(select salary from EMPLOYEE_SET10 E join DEPARTMENT_SET10 D on E.DEPT_ID = D.DEPT_ID
where d.DEPT_NAME = 'IT')

select salary from EMPLOYEE_SET10 E join DEPARTMENT_SET10 D on E.DEPT_ID = D.DEPT_ID
where d.DEPT_NAME = 'IT'
--Q39. Find employees whose salary is lower than every salary in the IT department.
select * from EMPLOYEE_SET10
where salary < all(select salary from EMPLOYEE_SET10 E join DEPARTMENT_SET10 D on E.DEPT_ID = D.DEPT_ID
where d.DEPT_NAME = 'IT')

--Q40. Compare employee salaries with salaries in a selected department and produce a result that 
--clearly distinguishes employees exceeding at least one comparison value from employees exceeding 
--every comparison value.
select * from EMPLOYEE_SET10
where exists (
select * from EMPLOYEE_SET10
where salary < any(select salary from EMPLOYEE_SET10 E join DEPARTMENT_SET10 D on E.DEPT_ID = D.DEPT_ID
where d.DEPT_NAME = 'IT'))

select *,case 
when salary > all(select salary from EMPLOYEE_SET10 E join DEPARTMENT_SET10 D on E.DEPT_ID = D.DEPT_ID
where d.DEPT_NAME = 'HR') then 'emp exceding all'
when  salary > any(select salary from EMPLOYEE_SET10 E join DEPARTMENT_SET10 D on E.DEPT_ID = D.DEPT_ID
where d.DEPT_NAME = 'HR') then 'emp exceeding one'
else 'not exceeding any one'
end EMP_category
from EMPLOYEE_SET10
--SECTION E – 5 INTEGRATED CHALLENGE QUESTIONS
--Q41. Using the supplied customer and order data, identify customers with no related orders and 
--display an appropriate contact value using the available contact columns.
select CUSTOMER_NAME,city,customer_type, coalesce(phone,alt_phone) Contact from CUSTOMER_SET10 C
where not exists 
( select * from ORDER_SET10 O where C.CUSTOMER_ID = O.CUSTOMER_ID)
select * from ORDER_SET10
--Q42. Using employee and department data, identify employees whose salary is above their 
--department average and classify the result into meaningful salary bands.
select * from EMPLOYEE_SET10
select * from DEPARTMENT_SET10
select *, case when salary > 70000 then 'high salary'
else 'low salary'
end Band 
from EMPLOYEE_SET10 E
where E.SALARY > (select avg(salary) 
from EMPLOYEE_SET10 D where E.DEPT_ID = D.DEPT_ID)

SELECT * FROM EMPLOYEE_SET10 E 
WHERE SALARY > (SELECT AVG(SALARY) 
FROM EMPLOYEE_SET10 E1 WHERE E.DEPT_ID = E1.DEPT_ID)
--Q43. Using product and order data, identify products that have no related orders and classify 
--each product based on its current stock level.
select *, case when STOCK_QTY > 100 then 'high stock'
when STOCK_QTY > 20 then 'Midium stock'
else 'low stock'
end  as stock_level
from PRODUCT_SET10 P
where not exists (select * from ORDER_SET10 O where P.PRODUCT_ID = O.PRODUCT_ID )

--Q44. Find source customer records for which no corresponding target customer record exists.
select * from CUSTOMER_SET10 C
where not exists (select * from TARGET_CUSTOMER_SET10 T where C.CUSTOMER_ID = T.CUSTOMER_ID)
select * from TARGET_CUSTOMER_SET10
--Q45. Build one integrated query using the supplied tables that combines conditional classification, 
--NULL handling, a row-dependent comparison, an existence check and a set-based salary comparison.



SELECT c.CUSTOMER_NAME, City,CUSTOMER_ID
FROM CUSTOMER_SET10 c
WHERE customer_id in  (
    SELECT o.CUSTOMER_ID
    FROM ORDER_SET10 o
    WHERE o.CUSTOMER_ID = c.CUSTOMER_ID
);



select ISNULL(NULL,'NO Value')--No value

select ISNULL(1234,'NO Value') --O/P -1234

select ISNULL('','NO Value') --O/P -blank Space

select ISNULL('xtfyguhkg','NO Value') --O/P-xtfyguhkg


--4. Create the Training Data in SQL
CREATE TABLE employees (
    emp_id INT,
    emp_name VARCHAR(50),
    dept_id INT,
    salary INT
);

INSERT INTO employees VALUES
(101, 'Amit', 10, 50000),
(102, 'Priya', 10, 70000),
(103, 'Rahul', 20, 60000),
(104, 'Sneha', 20, 80000),
(105, 'Neha', 30, 55000),
(106, 'Karan', 30, 90000);

CREATE TABLE departments (
    dept_id INT,
    dept_name VARCHAR(50)
);

INSERT INTO departments VALUES
(10, 'IT'),
(20, 'HR'),
(30, 'Finance');

CREATE TABLE customers (
    customer_id INT,
    customer_name VARCHAR(50)
);

INSERT INTO customers VALUES
(1, 'Amit'),
(2, 'Priya'),
(3, 'Rahul'),
(4, 'Sneha');

CREATE TABLE orders (
    order_id INT,
    customer_id INT,
    amount INT
);

INSERT INTO orders VALUES
(501, 1, 5000),
(502, 1, 3000),
(503, 3, 7000);



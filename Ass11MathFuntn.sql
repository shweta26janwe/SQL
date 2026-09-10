
use bank;
--SQL Server / SSMS | Execute the scripts below before attempting the questions
--1. CUSTOMER_SET9
CREATE TABLE CUSTOMER_SET9 (
    CUSTOMER_ID INT PRIMARY KEY,
    CUSTOMER_NAME VARCHAR(100),
    CITY VARCHAR(50),
    CUSTOMER_TYPE VARCHAR(30),
    EMAIL VARCHAR(100) NULL,
    PHONE VARCHAR(20) NULL,
    ALT_EMAIL VARCHAR(100) NULL,
    ALT_PHONE VARCHAR(20) NULL
);

INSERT INTO CUSTOMER_SET9 VALUES
(101,'Amit Sharma','Mumbai','Premium','amit.sharma@gmail.com','9876500011',NULL,'9123400011'),
(102,'Priya Patil','Pune','Corporate','priya.patil@outlook.com',NULL,'priya.alt@gmail.com','9123400012'),
(103,'Rahul Verma','Mumbai','Regular','rahul.verma@gmail.com','9876500013',NULL,NULL),
(104,'Sneha Kulkarni','Delhi','Premium',NULL,'9876500014','sneha.k@gmail.com',NULL),
(105,'Vikas Joshi','Pune','Regular','vikas.joshi@gmail.com',NULL,NULL,'9123400015'),
(106,'Neha Deshmukh','Nashik','Corporate','neha.d@company.com','9876500016','neha.alt@company.com',NULL),
(107,'Rohan Mehta','Bangalore','Premium','rohan.mehta@gmail.com','9876500017',NULL,NULL),
(108,'Pooja Shah','Mumbai','Corporate','pooja.shah@yahoo.com','9876500018',NULL,'9123400018'),
(109,'Karan Singh','Hyderabad','Regular','karan.singh@gmail.com','9876500019',NULL,NULL),
(110,'Meera Nair','Pune','Premium',NULL,NULL,'meera.nair@gmail.com','9123400020');

--2. ACCOUNT_SET9
CREATE TABLE ACCOUNT_SET9 (
    ACCOUNT_ID INT PRIMARY KEY,
    CUSTOMER_ID INT,
    ACCOUNT_NO VARCHAR(20),
    ACCOUNT_TYPE VARCHAR(30),
    ACCOUNT_BALANCE DECIMAL(15,3),
    OPENING_DATE DATE
);

INSERT INTO ACCOUNT_SET9 VALUES
(201,101,'AC10001','Savings',125000.456,'2020-04-15'),
(202,101,'AC10002','Current',725000.789,'2018-07-20'),
(203,102,'AC10003','Savings',350000.125,'2022-01-10'),
(204,103,'AC10004','Current',950000.650,'2017-11-05'),
(205,104,'AC10005','Salary',180000.555,'2023-06-18'),
(206,105,'AC10006','Savings',275000.999,'2021-09-25'),
(207,106,'AC10007','Current',1250000.875,'2016-03-12'),
(208,107,'AC10008','Savings',620000.444,'2019-12-01'),
(209,108,'AC10009','Salary',45000.125,'2024-02-14'),
(210,109,'AC10010','Current',875000.333,'2015-08-30'),
(211,110,'AC10011','Savings',510000.666,'2020-10-11'),
(212,104,'AC10012','Current',150000.250,'2025-01-08');


--3. TRANSACTION_SET9
CREATE TABLE TRANSACTION_SET9 (
    TRANSACTION_ID INT PRIMARY KEY,
    ACCOUNT_ID INT,
    TRANSACTION_TYPE VARCHAR(20),
    TRANSACTION_AMOUNT DECIMAL(15,3),
    TRANSACTION_DATE DATETIME
);

INSERT INTO TRANSACTION_SET9 VALUES
(301,201,'Credit',1250.456,'2026-01-15 10:30:00'),
(302,201,'Debit',275.125,'2026-02-18 12:10:00'),
(303,202,'Credit',52500.789,'2026-03-05 09:15:00'),
(304,202,'Debit',12500.333,'2025-12-28 16:45:00'),
(305,203,'Credit',7800.555,'2026-04-11 11:20:00'),
(306,204,'Debit',15250.875,'2026-05-19 14:35:00'),
(307,205,'Credit',999.499,'2026-06-07 10:05:00'),
(308,206,'Debit',4500.125,'2026-07-21 15:25:00'),
(309,207,'Credit',125000.650,'2026-08-03 09:50:00'),
(310,208,'Debit',7250.999,'2026-08-17 17:10:00'),
(311,209,'Credit',350.555,'2025-11-23 13:40:00'),
(312,210,'Debit',87500.444,'2026-09-01 10:00:00'),
(313,211,'Credit',11250.777,'2026-09-02 12:30:00'),
(314,212,'Debit',625.250,'2026-09-03 18:15:00');


--4. PAYMENT_SET9
CREATE TABLE PAYMENT_SET9 (
    PAYMENT_ID INT PRIMARY KEY,
    CUSTOMER_ID INT,
    AMOUNT_DUE DECIMAL(15,3),
    AMOUNT_PAID DECIMAL(15,3) NULL,
    PAYMENT_DATE DATE NULL
);

INSERT INTO PAYMENT_SET9 VALUES
(401,101,12500.456,12500.456,'2026-01-31'),
(402,102,25000.789,22000.555,'2026-02-28'),
(403,103,17500.125,NULL,NULL),
(404,104,32000.650,32000.650,'2026-03-31'),
(405,105,8500.333,7000.111,'2026-04-30'),
(406,106,45000.875,NULL,NULL),
(407,107,15000.999,15500.500,'2026-05-31'),
(408,108,27500.125,25000.125,'2026-06-30'),
(409,109,9500.555,9500.555,'2026-07-31'),
(410,110,40000.444,NULL,NULL);

--5. BALANCE_ADJUSTMENT_SET9
CREATE TABLE BALANCE_ADJUSTMENT_SET9 (
    ADJUSTMENT_ID INT PRIMARY KEY,
    ACCOUNT_ID INT,
    ADJUSTMENT_AMOUNT DECIMAL(15,3)
);

INSERT INTO BALANCE_ADJUSTMENT_SET9 VALUES
(501,201,1250.456),
(502,202,-2750.125),
(503,203,3500.750),
(504,204,-12500.875),
(505,205,-750.333),
(506,206,2250.999),
(507,207,-45000.555),
(508,208,8750.125);

--6. CREDIT_SCORE_SET9
CREATE TABLE CREDIT_SCORE_SET9 (
    CUSTOMER_ID INT PRIMARY KEY,
    CREDIT_SCORE INT,
    TOTAL_DEBT DECIMAL(15,3)
);

INSERT INTO CREDIT_SCORE_SET9 VALUES
(101,720,125000.555),
(102,680,350000.125),
(103,590,525000.789),
(104,760,85000.333),
(105,625,275000.650),
(106,810,450000.875),
(107,705,150000.444),
(108,650,625000.999),
(109,560,750000.555),
(110,735,200000.125);

--7. EMPLOYEE_SET9
CREATE TABLE EMPLOYEE_SET9 (
    EMP_ID INT PRIMARY KEY,
    EMP_NAME VARCHAR(100),
    MANAGER_ID INT NULL,
    SALARY DECIMAL(15,3),
    DEPT_ID INT
);

INSERT INTO EMPLOYEE_SET9 VALUES
(1,'Arun Kumar',NULL,1200000.500,10),
(2,'Bhavna Rao',1,850000.250,10),
(3,'Chetan Shah',1,650000.750,20),
(4,'Divya Nair',2,450000.125,20),
(5,'Eshan Patil',2,300000.999,30),
(6,'Farah Khan',3,575000.555,30),
(7,'Gaurav Joshi',3,925000.333,40),
(8,'Hema Desai',7,725000.875,40);

--8. DEPARTMENT_SET9
CREATE TABLE DEPARTMENT_SET9 (
    DEPT_ID INT PRIMARY KEY,
    DEPT_NAME VARCHAR(50)
);

INSERT INTO DEPARTMENT_SET9 VALUES
(10,'Technology'),
(20,'Data'),
(30,'Testing'),
(40,'Operations'),
(50,'HR');

--9. SALARY_GRADE_SET9
CREATE TABLE SALARY_GRADE_SET9 (
    GRADE_ID INT PRIMARY KEY,
    GRADE_NAME VARCHAR(20),
    MIN_SALARY DECIMAL(15,3),
    MAX_SALARY DECIMAL(15,3)
);

INSERT INTO SALARY_GRADE_SET9 VALUES
(1,'Grade A',0,400000),
(2,'Grade B',400000.001,700000),
(3,'Grade C',700000.001,1000000),
(4,'Grade D',1000000.001,2000000);

--10. CUSTOMER_LIST_A_SET9
CREATE TABLE CUSTOMER_LIST_A_SET9 (CUSTOMER_ID INT);
INSERT INTO CUSTOMER_LIST_A_SET9 VALUES
(101),(102),(103),(104),(105),(106),(110);

--11. CUSTOMER_LIST_B_SET9
CREATE TABLE CUSTOMER_LIST_B_SET9 (CUSTOMER_ID INT);
INSERT INTO CUSTOMER_LIST_B_SET9 VALUES
(102),(104),(106),(107),(108),(109);

SELECT * FROM CUSTOMER_LIST_A_SET9
select * from CUSTOMER_LIST_B_SET9
select * from SALARY_GRADE_SET9
select * from DEPARTMENT_SET9
select * from EMPLOYEE_SET9
select * from CREDIT_SCORE_SET9
select * from BALANCE_ADJUSTMENT_SET9
select * from payment_set9
select * from transaction_set9
select * from account_Set9
select * from customer_set9
--SECTION A – 10 IMPORTANT SQL INTERVIEW THEORY QUESTIONS
--Q1. Explain the difference between NULL, blank/empty string and zero. How would you handle each in SQL Server?
--Q2. Explain the difference between ISNULL and COALESCE. Discuss a situation where choosing the correct one matters.
--Q3. Explain the difference between CASE and IIF and when you would prefer one over the other.
--Q4. Explain the difference between ROUND, FLOOR and CEILING with suitable numeric examples.
--Q5. Explain the difference between WHERE and HAVING and how aggregation changes their usage.
--Q6. Explain the difference between INNER JOIN, LEFT JOIN, RIGHT JOIN and FULL OUTER JOIN. How do you decide which one is required?
--Q7. What is a subquery? Explain the difference between a subquery used for filtering and one used as a derived result.
--Q8. Explain UNION, UNION ALL, INTERSECT and EXCEPT. What conditions must be satisfied to use them?
--Q9. Explain the difference between FORMAT, CAST and CONVERT in SQL Server, including when each should be used.
--Q10. A SQL query returns results but the row count is unexpectedly higher after adding a JOIN. 
--Explain how you would investigate the issue.
--SECTION B – 20 QUESTIONS: PREVIOUSLY COVERED TOPICS
--Q11. Display all customers whose city is Mumbai or Pune and whose customer type is not Regular.
select * from CUSTOMER_SET9
select * from CUSTOMER_SET9
where city in ('Mumbai','Pune') and CUSTOMER_TYPE <> 'Regular'

--Q12. Display all unique cities from the customer table.
select distinct city from CUSTOMER_SET9
--Q13. Find the top 5 accounts with the highest account balance.
select TOP 5 * from ACCOUNT_SET9
order by ACCOUNT_BALANCE DESC
--Q14. Find accounts whose balance is between ₹2,00,000 and ₹10,00,000.
SELECT * FROM ACCOUNT_SET9
WHERE ACCOUNT_BALANCE BETWEEN 200000 AND 1000000
--Q15. Find customers whose email address contains gmail.
SELECT * FROM CUSTOMER_SET9 C
WHERE C.EMAIL LIKE '%GMAIL%'
--Q16. Find records where phone number or email address is missing.
SELECT * FROM CUSTOMER_SET9 C
WHERE C.PHONE IS NULL OR C.EMAIL IS NULL
--Q17. Display accounts ordered by account type and then by balance from highest to lowest.
SELECT * FROM ACCOUNT_SET9 
ORDER BY ACCOUNT_TYPE ,ACCOUNT_BALANCE DESC
--Q18. Calculate the total, average, minimum and maximum account balance.
SELECT SUM(ACCOUNT_BALANCE),AVG(ACCOUNT_BALANCE),MIN(ACCOUNT_BALANCE),MAX(ACCOUNT_BALANCE) FROM ACCOUNT_SET9
--Q19. Find the number of accounts for each account type.
SELECT ACCOUNT_TYPE,COUNT(ACCOUNT_ID) [NO. OF ACCOUNT] FROM ACCOUNT_SET9 
GROUP BY ACCOUNT_TYPE
--Q20. Find account types whose average balance is greater than ₹5,00,000.
SELECT ACCOUNT_TYPE,AVG(ACCOUNT_BALANCE) [AVG BALANCE] FROM ACCOUNT_SET9
GROUP BY ACCOUNT_TYPE
HAVING AVG(ACCOUNT_BALANCE) > 500000

--Q21. Display customer name, account number, account type and balance for customers having accounts.
SELECT C.CUSTOMER_ID,C.CUSTOMER_NAME,A.ACCOUNT_NO,A.ACCOUNT_TYPE,A.ACCOUNT_BALANCE
FROM CUSTOMER_SET9 C  JOIN ACCOUNT_SET9 A
ON C.CUSTOMER_ID = A.CUSTOMER_ID
--Q22. Display all customers and their account numbers, including customers without accounts.
SELECT C.CUSTOMER_ID,C.CUSTOMER_NAME,A.ACCOUNT_NO
FROM CUSTOMER_SET9 C  LEFT JOIN ACCOUNT_SET9 A
ON C.CUSTOMER_ID = A.CUSTOMER_ID
--Q23. Display customer name, account number, transaction type and transaction amount using the customer, 
--account and transaction tables.
SELECT C.CUSTOMER_NAME,A.ACCOUNT_NO,T.TRANSACTION_TYPE,T.TRANSACTION_AMOUNT
FROM CUSTOMER_SET9 C  LEFT JOIN ACCOUNT_SET9 A
ON C.CUSTOMER_ID = A.CUSTOMER_ID JOIN 
TRANSACTION_SET9 T 
ON  A.ACCOUNT_ID = T.ACCOUNT_ID
--Q24. Find customers whose account balance is greater than the average account balance.
SELECT C.CUSTOMER_NAME,A.ACCOUNT_NO, A.ACCOUNT_BALANCE
FROM CUSTOMER_SET9 C  LEFT JOIN ACCOUNT_SET9 A
ON C.CUSTOMER_ID = A.CUSTOMER_ID
WHERE ACCOUNT_BALANCE > (SELECT AVG(ACCOUNT_BALANCE) FROM ACCOUNT_SET9)
--Q25. Find transactions whose amount is greater than the average transaction amount.
SELECT * FROM TRANSACTION_SET9
WHERE TRANSACTION_AMOUNT > (SELECT AVG(TRANSACTION_AMOUNT) FROM TRANSACTION_SET9)
--Q26. Using an employee-style table if available, display employees together with their manager names.
SELECT E1.EMP_ID,E1.EMP_NAME,E2.EMP_NAME AS MANAGER_NAME,E2.MANAGER_ID FROM EMPLOYEE_SET9 E1, EMPLOYEE_SET9 E2
WHERE E1.MANAGER_ID = E2.EMP_ID
--Q27. Using the salary-grade table, assign the appropriate grade to each employee based on the salary range.
SELECT * FROM SALARY_GRADE_SET9
SELECT * FROM EMPLOYEE_SET9
SELECT * FROM EMPLOYEE_SET9 E JOIN SALARY_GRADE_SET9 S
ON E.SALARY BETWEEN S.MIN_SALARY AND S.MAX_SALARY
--Q28. Compare two customer ID lists and find IDs present in the first list but not the second, 
--using an appropriate SET operator.
SELECT C1.CUSTOMER_ID FROM CUSTOMER_LIST_A_SET9 C1
EXCEPT
SELECT C2.CUSTOMER_ID FROM CUSTOMER_LIST_B_SET9 C2
--Q29. Find transactions from the current year and display the year, month name and day of the transaction.
SELECT *,YEAR(TRANSACTION_DATE) YEAR, DATENAME(MONTH, TRANSACTION_DATE) MONTH,DATENAME(WEEKDAY,TRANSACTION_DATE) DAY
FROM TRANSACTION_SET9
WHERE YEAR(TRANSACTION_DATE) = YEAR(GETDATE())
--Q30. Extract the domain portion from each customer email address and display the customer name, email and domain.
SELECT CUSTOMER_NAME,EMAIL,SUBSTRING(EMAIL,CHARINDEX('@',EMAIL)+1,LEN(EMAIL)-4-CHARINDEX('@',EMAIL)) DOMAIN 
FROM CUSTOMER_SET9
SELECT *,LEN(EMAIL)-4-CHARINDEX('@',EMAIL) FROM CUSTOMER_SET9

--SECTION C – 20 QUESTIONS: TODAY’S TOPICS
--Q31. For each transaction amount, display the original amount and a value rounded to two decimal places.
SELECT TRANSACTION_DATE,ROUND(TRANSACTION_AMOUNT,2) [ROUNDED VALUE] FROM TRANSACTION_SET9
SELECT TRANSACTION_DATE,ROUND(TRANSACTION_AMOUNT,2,0) [ROUNDED VALUE] FROM TRANSACTION_SET9
SELECT TRANSACTION_DATE,ROUND(TRANSACTION_AMOUNT,2,7) [ROUNDED VALUE] FROM TRANSACTION_SET9


SELECT TRANSACTION_DATE,ROUND(TRANSACTION_AMOUNT,-2) [ROUNDED VALUE] FROM TRANSACTION_SET9
SELECT TRANSACTION_DATE,ROUND(TRANSACTION_AMOUNT,-2,0) [ROUNDED VALUE] FROM TRANSACTION_SET9
SELECT TRANSACTION_DATE,ROUND(TRANSACTION_AMOUNT,-2,7) [ROUNDED VALUE] FROM TRANSACTION_SET9


--Q32. For each transaction amount, display the amount rounded to the nearest whole number.
SELECT TRANSACTION_DATE,ROUND(TRANSACTION_AMOUNT,0) [ROUNDED VALUE] FROM TRANSACTION_SET9

--Q33. For each transaction amount, display the value after removing the decimal portion without rounding.
SELECT TRANSACTION_DATE,CAST(TRANSACTION_AMOUNT AS INT) [ROUNDED VALUE] FROM TRANSACTION_SET9

--Q34. For each account balance adjustment in a table containing positive and negative values, display its absolute value.
SELECT *,ABS(TRANSACTION_AMOUNT) [ABS VALUE] FROM TRANSACTION_SET9
--Q35. For each transaction amount, display the smallest whole number greater than or equal to the amount.
SELECT *,CEILING(TRANSACTION_AMOUNT) [SMALLEST WHOLE VALUE] FROM TRANSACTION_SET9
--Q36. For each transaction amount, display the largest whole number less than or equal to the amount.
SELECT *,FLOOR(TRANSACTION_AMOUNT) [LARGEST WHOLE VALUE] FROM TRANSACTION_SET9

--Q37. Calculate the square root of each credit score and display the original score and calculated value.
SELECT CREDIT_SCORE,SQRT(CREDIT_SCORE) SQRT FROM CREDIT_SCORE_SET9
--Q38. Calculate the square of each credit score.
SELECT CREDIT_SCORE,SQUARE(CREDIT_SCORE) SQUARE FROM CREDIT_SCORE_SET9

--Q39. For each payment, calculate the outstanding amount and then apply an appropriate rounding operation to the result.
SELECT *,AMOUNT_DUE-ISNULL(AMOUNT_PAID,0) AS OUTSTANDING_AMOUNT, ROUND((AMOUNT_DUE-AMOUNT_PAID),0) FROM PAYMENT_SET9
--Q40. For every account, classify the balance into two categories based on a condition you define from the supplied data.
SELECT *, IIF((ACCOUNT_BALANCE > 500000),'HIGH','LOW' ) STATUS FROM ACCOUNT_SET9
--Q41. For each transaction, derive a value from a numbered list based on the month number of the transaction date.
SELECT *, CHOOSE(MONTH(TRANSACTION_DATE),'JANUARY','FEBRUARY','MARCH','APRIL','MAY','JUNE','JULY',
'AUGUST','SEPTEMBER','OCTOBER','NOVEMBER','DECEMBER') TXN_MONTH FROM TRANSACTION_SET9
--Q42. Display all payments and replace missing payment amounts with an appropriate value before further calculation.
SELECT *,ISNULL(CAST(AMOUNT_PAID AS VARCHAR),'AMOUNT IS NULL') AMT_NOT_PAID FROM PAYMENT_SET9
SELECT *,COALESCE(CAST(AMOUNT_PAID AS VARCHAR),NULL,'AMOUNT IS NULL') AMT_NOT_PAID FROM PAYMENT_SET9

--Q43. Create a single contact value by selecting the first available value from multiple customer contact columns.
SELECT *, COALESCE(PHONE,ALT_PHONE) AS PHONE_NO FROM CUSTOMER_SET9
SELECT *, COALESCE(EMAIL,PHONE,ALT_PHONE) AS PHONE_NO FROM CUSTOMER_SET9
SP_HELP CUSTOMER_SET9
SELECT *, COALESCE(EMAIL,ID,PHONE,ALT_PHONE) AS PHONE_NO FROM CUSTOMER_SET9 --IF WE USE DIFF DATATYPE THE IT RETURN ERROR

SELECT * FROM CUSTOMER_SET9
--Q44. Classify accounts into three balance categories based on thresholds you define.
SELECT *, CASE WHEN ACCOUNT_BALANCE<=500000 THEN 'LOW'
               WHEN ACCOUNT_BALANCE BETWEEN 500001 AND 1000000 THEN 'MIDDLE'
               ELSE 'HIGH'
          END AS CATEGORIES 
FROM ACCOUNT_SET9 
--Q45. Determine a payment status by comparing the amount paid with the amount due.
SELECT *, CASE WHEN ISNULL(AMOUNT_PAID,0) = 0 THEN 'PAYMENT NOT PAID'
                WHEN AMOUNT_PAID < AMOUNT_DUE THEN 'PARTIALLY PAID'
                ELSE 'FULLY PAID'
                END AS STATUS
                FROM PAYMENT_SET9 
--Q46. Classify transactions into categories according to their amounts using multiple conditions.
SELECT * ,CASE WHEN TRANSACTION_AMOUNT<=50000 THEN 'LOW'
               WHEN TRANSACTION_AMOUNT BETWEEN 50001 AND 100000 THEN 'MIDDLE'
               ELSE 'HIGH'
          END AS CATEGORIES FROM TRANSACTION_SET9
--Q47. Classify accounts based on the number of years since account opening.
SELECT *,DATEDIFF(YEAR,OPENING_DATE,GETDATE()) AGE, IIF(DATEDIFF(YEAR,OPENING_DATE,GETDATE()) >= 5,'OLD ACCOUNT',
'NEW ACCOUNT') CLASSIFICATION  FROM ACCOUNT_SET9
--Q48. Classify customers using credit score and debt information, applying suitable mathematical 
--calculations where necessary.
SELECT * FROM CUSTOMER_SET9
SELECT * FROM CREDIT_SCORE_SET9
SELECT *, CASE WHEN CREDIT_SCORE > 750 AND TOTAL_DEBT < 100000 THEN 'LOW RISK'
                WHEN CREDIT_SCORE > 500 AND TOTAL_dEBT < 500000 THEN 'MODERATE RISK'
                ELSE 'HIGH RISK' 
                END AS RIST_POSSIBLITY FROM CREDIT_SCORE_SET9
--Q49. Calculate customer-level totals and classify customers based on the resulting total values.
SELECT  C.CUSTOMER_ID,c.CUSTOMER_NAME,sum(ACCOUNT_BALANCE) [total balance], iif(sum(ACCOUNT_BALANCE) <= 100000,'balance is low',
'balance is high') status FROM CUSTOMER_SET9 C
LEFT JOIN ACCOUNT_SET9 A
ON C.CUSTOMER_ID = A.CUSTOMER_ID
group by C.CUSTOMER_ID,c.CUSTOMER_NAME

SELECT  C.CUSTOMER_ID,c.CUSTOMER_NAME,sum(ISNULL(ACCOUNT_BALANCE,0)) [total balance], iif(sum(ISNULL(ACCOUNT_BALANCE,0))
<= 100000,'balance is low','balance is high') status FROM CUSTOMER_SET9 C
LEFT JOIN ACCOUNT_SET9 A
ON C.CUSTOMER_ID = A.CUSTOMER_ID
group by C.CUSTOMER_ID,c.CUSTOMER_NAME
--Q50. Using the supplied tables, create one query that combines NULL handling, conditional logic and at least
--two mathematical calculations to produce a final result at customer level.
select CUSTOMER_NAME ,city,coalesce(phone,alt_phone) Phone_no,coalesce(email,alt_email) Email, a.ACCOUNT_NO,
a.ACCOUNT_BALANCE,FLOOR(ACCOUNT_BALANCE) [FLOOR VALUE OF BAL],
format(opening_date,'dd MMMM yyyy') Opening_date,t.transaction_id, abs(transaction_amount) transaction_amount,
cast(transaction_date as date) transaction_date, IIF(ACCOUNT_BALANCE<=100000,'MORE AMOUNT','LESS AMOUNT')
from CUSTOMER_SET9 C left join ACCOUNT_SET9 a
on c.CUSTOMER_ID = a.CUSTOMER_ID  join TRANSACTION_SET9 t
on a.ACCOUNT_ID = t.ACCOUNT_ID


--Candidate Checklist
--•	Execute all queries in SQL Server / SSMS.
--•	Do not use hints from the question statements.
--•	Use only concepts covered up to today.
--•	Validate results with the source rows before finalizing each query.
--•	For multi-table questions, check duplicate rows caused by joins.
--•	Use clear column aliases and readable SQL
 
DATASET – SET 9
SQL Server / SSMS | Execute the scripts below before attempting the questions
1. CUSTOMER_SET9
CREATE TABLE CUSTOMER_SET9 (
    CUSTOMER_ID INT PRIMARY KEY,
    CUSTOMER_NAME VARCHAR(100),
    CITY VARCHAR(50),
    CUSTOMER_TYPE VARCHAR(30),
    EMAIL VARCHAR(100) NULL,
    PHONE VARCHAR(20) NULL,
    ALT_EMAIL VARCHAR(100) NULL,
    ALT_PHONE VARCHAR(20) NULL
);

INSERT INTO CUSTOMER_SET9 VALUES
(101,'Amit Sharma','Mumbai','Premium','amit.sharma@gmail.com','9876500011',NULL,'9123400011'),
(102,'Priya Patil','Pune','Corporate','priya.patil@outlook.com',NULL,'priya.alt@gmail.com','9123400012'),
(103,'Rahul Verma','Mumbai','Regular','rahul.verma@gmail.com','9876500013',NULL,NULL),
(104,'Sneha Kulkarni','Delhi','Premium',NULL,'9876500014','sneha.k@gmail.com',NULL),
(105,'Vikas Joshi','Pune','Regular','vikas.joshi@gmail.com',NULL,NULL,'9123400015'),
(106,'Neha Deshmukh','Nashik','Corporate','neha.d@company.com','9876500016','neha.alt@company.com',NULL),
(107,'Rohan Mehta','Bangalore','Premium','rohan.mehta@gmail.com','9876500017',NULL,NULL),
(108,'Pooja Shah','Mumbai','Corporate','pooja.shah@yahoo.com','9876500018',NULL,'9123400018'),
(109,'Karan Singh','Hyderabad','Regular','karan.singh@gmail.com','9876500019',NULL,NULL),
(110,'Meera Nair','Pune','Premium',NULL,NULL,'meera.nair@gmail.com','9123400020');
2. ACCOUNT_SET9
CREATE TABLE ACCOUNT_SET9 (
    ACCOUNT_ID INT PRIMARY KEY,
    CUSTOMER_ID INT,
    ACCOUNT_NO VARCHAR(20),
    ACCOUNT_TYPE VARCHAR(30),
    ACCOUNT_BALANCE DECIMAL(15,3),
    OPENING_DATE DATE
);

INSERT INTO ACCOUNT_SET9 VALUES
(201,101,'AC10001','Savings',125000.456,'2020-04-15'),
(202,101,'AC10002','Current',725000.789,'2018-07-20'),
(203,102,'AC10003','Savings',350000.125,'2022-01-10'),
(204,103,'AC10004','Current',950000.650,'2017-11-05'),
(205,104,'AC10005','Salary',180000.555,'2023-06-18'),
(206,105,'AC10006','Savings',275000.999,'2021-09-25'),
(207,106,'AC10007','Current',1250000.875,'2016-03-12'),
(208,107,'AC10008','Savings',620000.444,'2019-12-01'),
(209,108,'AC10009','Salary',45000.125,'2024-02-14'),
(210,109,'AC10010','Current',875000.333,'2015-08-30'),
(211,110,'AC10011','Savings',510000.666,'2020-10-11'),
(212,104,'AC10012','Current',150000.250,'2025-01-08');
3. TRANSACTION_SET9
CREATE TABLE TRANSACTION_SET9 (
    TRANSACTION_ID INT PRIMARY KEY,
    ACCOUNT_ID INT,
    TRANSACTION_TYPE VARCHAR(20),
    TRANSACTION_AMOUNT DECIMAL(15,3),
    TRANSACTION_DATE DATETIME
);

INSERT INTO TRANSACTION_SET9 VALUES
(301,201,'Credit',1250.456,'2026-01-15 10:30:00'),
(302,201,'Debit',275.125,'2026-02-18 12:10:00'),
(303,202,'Credit',52500.789,'2026-03-05 09:15:00'),
(304,202,'Debit',12500.333,'2025-12-28 16:45:00'),
(305,203,'Credit',7800.555,'2026-04-11 11:20:00'),
(306,204,'Debit',15250.875,'2026-05-19 14:35:00'),
(307,205,'Credit',999.499,'2026-06-07 10:05:00'),
(308,206,'Debit',4500.125,'2026-07-21 15:25:00'),
(309,207,'Credit',125000.650,'2026-08-03 09:50:00'),
(310,208,'Debit',7250.999,'2026-08-17 17:10:00'),
(311,209,'Credit',350.555,'2025-11-23 13:40:00'),
(312,210,'Debit',87500.444,'2026-09-01 10:00:00'),
(313,211,'Credit',11250.777,'2026-09-02 12:30:00'),
(314,212,'Debit',625.250,'2026-09-03 18:15:00');
4. PAYMENT_SET9
CREATE TABLE PAYMENT_SET9 (
    PAYMENT_ID INT PRIMARY KEY,
    CUSTOMER_ID INT,
    AMOUNT_DUE DECIMAL(15,3),
    AMOUNT_PAID DECIMAL(15,3) NULL,
    PAYMENT_DATE DATE NULL
);

INSERT INTO PAYMENT_SET9 VALUES
(401,101,12500.456,12500.456,'2026-01-31'),
(402,102,25000.789,22000.555,'2026-02-28'),
(403,103,17500.125,NULL,NULL),
(404,104,32000.650,32000.650,'2026-03-31'),
(405,105,8500.333,7000.111,'2026-04-30'),
(406,106,45000.875,NULL,NULL),
(407,107,15000.999,15500.500,'2026-05-31'),
(408,108,27500.125,25000.125,'2026-06-30'),
(409,109,9500.555,9500.555,'2026-07-31'),
(410,110,40000.444,NULL,NULL);
5. BALANCE_ADJUSTMENT_SET9
CREATE TABLE BALANCE_ADJUSTMENT_SET9 (
    ADJUSTMENT_ID INT PRIMARY KEY,
    ACCOUNT_ID INT,
    ADJUSTMENT_AMOUNT DECIMAL(15,3)
);

INSERT INTO BALANCE_ADJUSTMENT_SET9 VALUES
(501,201,1250.456),
(502,202,-2750.125),
(503,203,3500.750),
(504,204,-12500.875),
(505,205,-750.333),
(506,206,2250.999),
(507,207,-45000.555),
(508,208,8750.125);
6. CREDIT_SCORE_SET9
CREATE TABLE CREDIT_SCORE_SET9 (
    CUSTOMER_ID INT PRIMARY KEY,
    CREDIT_SCORE INT,
    TOTAL_DEBT DECIMAL(15,3)
);

INSERT INTO CREDIT_SCORE_SET9 VALUES
(101,720,125000.555),
(102,680,350000.125),
(103,590,525000.789),
(104,760,85000.333),
(105,625,275000.650),
(106,810,450000.875),
(107,705,150000.444),
(108,650,625000.999),
(109,560,750000.555),
(110,735,200000.125);
7. EMPLOYEE_SET9
CREATE TABLE EMPLOYEE_SET9 (
    EMP_ID INT PRIMARY KEY,
    EMP_NAME VARCHAR(100),
    MANAGER_ID INT NULL,
    SALARY DECIMAL(15,3),
    DEPT_ID INT
);

INSERT INTO EMPLOYEE_SET9 VALUES
(1,'Arun Kumar',NULL,1200000.500,10),
(2,'Bhavna Rao',1,850000.250,10),
(3,'Chetan Shah',1,650000.750,20),
(4,'Divya Nair',2,450000.125,20),
(5,'Eshan Patil',2,300000.999,30),
(6,'Farah Khan',3,575000.555,30),
(7,'Gaurav Joshi',3,925000.333,40),
(8,'Hema Desai',7,725000.875,40);
8. DEPARTMENT_SET9
CREATE TABLE DEPARTMENT_SET9 (
    DEPT_ID INT PRIMARY KEY,
    DEPT_NAME VARCHAR(50)
);

INSERT INTO DEPARTMENT_SET9 VALUES
(10,'Technology'),
(20,'Data'),
(30,'Testing'),
(40,'Operations'),
(50,'HR');
9. SALARY_GRADE_SET9
CREATE TABLE SALARY_GRADE_SET9 (
    GRADE_ID INT PRIMARY KEY,
    GRADE_NAME VARCHAR(20),
    MIN_SALARY DECIMAL(15,3),
    MAX_SALARY DECIMAL(15,3)
);

INSERT INTO SALARY_GRADE_SET9 VALUES
(1,'Grade A',0,400000),
(2,'Grade B',400000.001,700000),
(3,'Grade C',700000.001,1000000),
(4,'Grade D',1000000.001,2000000);
10. CUSTOMER_LIST_A_SET9
CREATE TABLE CUSTOMER_LIST_A_SET9 (CUSTOMER_ID INT);
INSERT INTO CUSTOMER_LIST_A_SET9 VALUES
(101),(102),(103),(104),(105),(106),(110);
11. CUSTOMER_LIST_B_SET9
CREATE TABLE CUSTOMER_LIST_B_SET9 (CUSTOMER_ID INT);
INSERT INTO CUSTOMER_LIST_B_SET9 VALUES
(102),(104),(106),(107),(108),(109);

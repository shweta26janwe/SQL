--PART A – BANKING DATASET SETUP
--BANK_CUSTOMER
CREATE TABLE BANK_CUSTOMER
(
 CUSTOMER_ID INT PRIMARY KEY,
 CUSTOMER_NAME VARCHAR(80) NOT NULL,
 DOB DATE NULL,
 CITY VARCHAR(40),
 CUSTOMER_TYPE VARCHAR(20),
 ONBOARD_DATE DATE,
 EMAIL VARCHAR(100) NULL
);

INSERT INTO BANK_CUSTOMER VALUES
(1001,'Amit Sharma','1988-02-15','PUNE','RETAIL','2021-01-15','amit@gmail.com'),
(1002,'Riya Patil','1992-07-22','MUMBAI','RETAIL','2022-03-10','riya@gmail.com'),
(1003,'Rohan Mehta','1985-11-05','DELHI','PREMIUM','2020-06-18','rohan@gmail.com'),
(1004,'Sneha Kulkarni','1990-01-30','NAGPUR','RETAIL','2023-02-14',NULL),
(1005,'Raj Verma','1982-09-12','BANGALORE','PREMIUM','2019-04-22','raj@gmail.com'),
(1006,'Seema Joshi','1995-04-08','PUNE','RETAIL','2024-01-05','seema@gmail.com'),
(1007,'Ravi Deshmukh','1987-12-19','MUMBAI','PREMIUM','2021-08-30','ravi@gmail.com'),
(1008,'Pooja Shah','1993-06-11','NAGPUR','RETAIL','2023-07-17','pooja@gmail.com'),
(1009,'Sachin Rao','1980-03-25','PUNE','PREMIUM','2018-10-01','sachin@gmail.com'),
(1010,'Neha Singh','1991-10-09','DELHI','RETAIL','2022-11-21',NULL),
(1011,'Kiran More','1986-05-17','HYDERABAD','PREMIUM','2020-12-12','kiran@gmail.com'),
(1012,'Meena Iyer','1994-08-28','CHENNAI','RETAIL','2024-05-20','meena@gmail.com');
--BANK_ACCOUNT
CREATE TABLE BANK_ACCOUNT
(
 ACCOUNT_ID INT PRIMARY KEY,
 CUSTOMER_ID INT,
 ACCOUNT_TYPE VARCHAR(30),
 ACCOUNT_OPEN_DATE DATE,
 ACCOUNT_STATUS VARCHAR(20),
 BALANCE DECIMAL(12,2),
 LAST_TRANSACTION_DATE DATE NULL
);

INSERT INTO BANK_ACCOUNT VALUES
(50001,1001,'SAVINGS','2021-01-20','ACTIVE',85000.50,'2026-08-20'),
(50002,1002,'SALARY','2022-03-12','ACTIVE',125000.00,'2026-08-28'),
(50003,1003,'CURRENT','2020-06-20','ACTIVE',450000.75,'2026-07-15'),
(50004,1004,'SAVINGS','2023-02-16','DORMANT',25000.00,'2025-11-30'),
(50005,1005,'CURRENT','2019-04-25','ACTIVE',650000.00,'2026-08-30'),
(50006,1006,'SAVINGS','2024-01-08','ACTIVE',15000.50,'2026-08-05'),
(50007,1007,'SALARY','2021-09-02','ACTIVE',95000.00,'2026-06-25'),
(50008,1008,'SAVINGS','2023-07-20','ACTIVE',72000.25,'2026-08-18'),
(50009,1009,'PREMIUM SAVINGS','2018-10-05','ACTIVE',900000.00,'2026-08-31'),
(50010,1010,'SAVINGS','2022-11-23','DORMANT',18000.00,'2025-12-15'),
(50011,1011,'CURRENT','2020-12-15','ACTIVE',375000.00,'2026-07-30'),
(50012,1012,'SAVINGS','2024-05-22','ACTIVE',42000.00,'2026-08-12'),
(50013,1001,'LOAN ACCOUNT','2022-09-01','ACTIVE',-150000.00,'2026-08-10'),
(50014,1005,'LOAN ACCOUNT','2023-01-15','ACTIVE',-275000.00,'2026-07-25');
--BANK_TRANSACTION
CREATE TABLE BANK_TRANSACTION
(
 TXN_ID INT PRIMARY KEY,
 ACCOUNT_ID INT,
 TXN_DATE DATETIME,
 TXN_TYPE VARCHAR(20),
 TXN_AMOUNT DECIMAL(12,2),
 CHANNEL VARCHAR(20),
 TXN_STATUS VARCHAR(20)
);

INSERT INTO BANK_TRANSACTION VALUES
(900001,50001,'2026-08-20 10:15:00','CREDIT',25000,'UPI','SUCCESS'),
(900002,50001,'2026-08-21 14:30:00','DEBIT',5000,'ATM','SUCCESS'),
(900003,50002,'2026-08-28 09:10:00','CREDIT',75000,'NEFT','SUCCESS'),
(900004,50002,'2026-08-29 16:20:00','DEBIT',12000,'UPI','SUCCESS'),
(900005,50003,'2026-07-15 11:45:00','DEBIT',45000,'RTGS','SUCCESS'),
(900006,50003,'2026-07-20 13:05:00','CREDIT',150000,'NEFT','SUCCESS'),
(900007,50004,'2025-11-30 15:10:00','DEBIT',3000,'ATM','SUCCESS'),
(900008,50005,'2026-08-30 10:05:00','CREDIT',200000,'RTGS','SUCCESS'),
(900009,50005,'2026-08-31 18:25:00','DEBIT',45000,'UPI','SUCCESS'),
(900010,50006,'2026-08-05 09:30:00','CREDIT',10000,'UPI','SUCCESS'),
(900011,50007,'2026-06-25 12:20:00','DEBIT',8000,'ATM','FAILED'),
(900012,50008,'2026-08-18 17:15:00','CREDIT',18000,'UPI','SUCCESS'),
(900013,50009,'2026-08-31 10:40:00','CREDIT',250000,'RTGS','SUCCESS'),
(900014,50009,'2026-08-31 15:20:00','DEBIT',60000,'RTGS','SUCCESS'),
(900015,50010,'2025-12-15 14:10:00','DEBIT',2000,'ATM','SUCCESS'),
(900016,50011,'2026-07-30 11:30:00','CREDIT',95000,'NEFT','SUCCESS'),
(900017,50012,'2026-08-12 16:40:00','CREDIT',12000,'UPI','SUCCESS'),
(900018,50013,'2026-08-10 10:00:00','DEBIT',15000,'AUTO-DEBIT','SUCCESS'),
(900019,50014,'2026-07-25 09:45:00','DEBIT',22000,'AUTO-DEBIT','SUCCESS'),
(900020,50002,'2026-08-30 12:15:00','DEBIT',30000,'UPI','FAILED');
--BANK_LOAN
CREATE TABLE BANK_LOAN
(
 LOAN_ID INT PRIMARY KEY,
 CUSTOMER_ID INT,
 LOAN_TYPE VARCHAR(30),
 LOAN_START_DATE DATE,
 MATURITY_DATE DATE,
 LOAN_AMOUNT DECIMAL(14,2),
 EMI_AMOUNT DECIMAL(12,2),
 LOAN_STATUS VARCHAR(20)
);

INSERT INTO BANK_LOAN VALUES
(70001,1001,'HOME','2021-05-15','2041-05-15',4500000,42000,'ACTIVE'),
(70002,1003,'PERSONAL','2024-01-10','2029-01-10',600000,14500,'ACTIVE'),
(70003,1005,'BUSINESS','2022-07-01','2030-07-01',2500000,38000,'ACTIVE'),
(70004,1007,'CAR','2023-03-20','2028-03-20',900000,19000,'ACTIVE'),
(70005,1009,'HOME','2020-09-10','2040-09-10',6500000,55000,'ACTIVE'),
(70006,1011,'PERSONAL','2025-02-15','2030-02-15',500000,11000,'ACTIVE'),
(70007,1004,'PERSONAL','2023-08-01','2026-08-01',250000,9000,'CLOSED'),
(70008,1010,'CAR','2022-12-01','2027-12-01',700000,15500,'ACTIVE');
--Verify Dataset
SELECT * FROM BANK_CUSTOMER;
SELECT * FROM BANK_ACCOUNT;
SELECT * FROM BANK_TRANSACTION;
SELECT * FROM BANK_LOAN;
 
--PART B – 5 IMPORTANT INTERVIEW THEORY QUESTIONS
--Q1. EOMONTH in Banking
--Explain how EOMONTH() can be used for month-end statements, 
--month-end transaction reporting and loan maturity reporting. 
--Explain the optional month offset.
EMONTH() is used to get that last date of that particualar date month,
--Q2. FORMAT vs CAST vs CONVERT
--Explain the difference between FORMAT(), CAST() and CONVERT() 
--and give one banking reporting example for each.

--Q3. CONVERT Style Codes
--Explain why style codes are useful with CONVERT() when producing standard date strings such as YYYY-MM-DD.
--Q4. Date Filtering
--Why should a tester understand DATE/DATETIME/DATETIME2 before filtering transaction data? Explain the risk of ignoring the time portion.
--Q5. Date Functions with JOINs
--Explain how Customer, Account and Transaction tables can be joined and then analyzed using EOMONTH(), DATEDIFF(), DATEADD(), YEAR() and MONTH().
 
--PART C – 30 SQL BUSINESS SCENARIO QUESTIONS
--Q6. Current System Timestamp
--Display the current system date/time using GETDATE(), SYSDATETIME() and 
--CURRENT_TIMESTAMP.
--•	Use meaningful aliases.
select getdate() as GeneralCurrDateTime, sysdatetime() as SystemDateTime ,
current_timestamp as CurrDateTime
--Q7. Customer Date Profile
--Display customer name, DOB, onboarding date, onboarding year, onboarding month and 
--onboarding month name.
--•	Use YEAR, MONTH and DATENAME.
select * from BANK_CUSTOMER 
select Customer_name,DOB,onboard_date,year(onboard_date) [onboarding year],
month(onboard_date) [onboarding_month],datename(month,onboard_date) [onboarding monthname] 
from BANK_CUSTOMER

--Q8. Account Month-End
--For every account, display ACCOUNT_OPEN_DATE and the last day of its opening month.
--•	Use EOMONTH.
SELECT * FROM BANK_ACCOUNT;
select ACCOUNT_OPEN_DATE, EOMONTH(ACCOUNT_OPEN_DATE) AS[END OF MONTH] FROM BANK_ACCOUNT
--Q9. Next Month-End
--Display account ID, opening date and the last day of the next month.
--•	Use EOMONTH with offset 1.
SELECT ACCOUNT_ID,ACCOUNT_OPEN_DATE,EOMONTH(ACCOUNT_OPEN_DATE,1) FROM BANK_ACCOUNT
--Q10. Account Age
--Calculate how many days each account has been open as of today.
--•	Use DATEDIFF.
--•	Sort descending.
SELECT ACCOUNT_ID ,ACCOUNT_OPEN_DATE, DATEDIFF(DAY,ACCOUNT_OPEN_DATE,GETDATE()) AS ACCOUNT_AGE
FROM BANK_ACCOUNT
--Q11. Transaction Date Format
--Display transaction ID and transaction date as DD-MMM-YYYY.
--•	Use FORMAT.
SELECT * FROM BANK_TRANSACTION
SELECT TXN_ID,TXN_DATE, FORMAT(TXN_DATE, 'dd-MM-yyyy') FROM BANK_TRANSACTION
--Q12. Transaction Date-Time Format
--Display transaction ID and transaction date as YYYY-MM-DD HH:MM.
--•	Use FORMAT.
select TXN_ID, TXN_DATE, format(TXn_date,'yyyy MM dd hh:mm') [TXN AS PER FORMAT] from BANK_TRANSACTION
--Q13. Date Conversion
--Display transaction date as DATE and as VARCHAR using CONVERT.
--•	Use CONVERT.
SELECT TXN_DATE AS DATE, CONVERT( VARCHAR,TXN_DATE) [VARCHAR DATE] FROM BANK_TRANSACTION
SELECT TXN_DATE AS DATE, CONVERT( VARCHAR,TXN_DATE,'hi-IN') [VARCHAR DATE] FROM BANK_TRANSACTION

--Q14. ISO Date Standardization
--Display customer onboarding dates as YYYY-MM-DD strings.
--•	Use CONVERT with an appropriate style.
SELECT *  FROM BANK_CUSTOMER
SELECT ONBOARD_DATE,CONVERT(VARCHAR,ONBOARD_DATE) STRING_TYPE_DATE  FROM BANK_CUSTOMER
--Q15. Month-wise Transaction Count
--Show successful transaction count by transaction year and month.
--•	Use YEAR, MONTH, COUNT and GROUP BY.
SELECT * FROM BANK_TRANSACTION
SELECT * FROM BANK_TRANSACTION

SELECT  YEAR(TXN_DATE) YEAR,MONTH(TXN_DATE) AS [MONTH],COUNT(*) TRANSACTION_COUNT FROM BANK_TRANSACTION 
WHERE TXN_STATUS = 'SUCCESS'
GROUP BY YEAR(TXN_DATE),MONTH(TXN_DATE)


SELECT  YEAR(TXN_DATE) YEAR,MONTH(TXN_DATE) AS [MONTH],COUNT(*) TRANSACTION_COUNT FROM BANK_TRANSACTION 
WHERE TXN_STATUS = 'FAILED'
GROUP BY YEAR(TXN_DATE),MONTH(TXN_DATE)

--Q16. Month-wise Transaction Amount
--Calculate total successful transaction amount by year and month.
--•	Use SUM and GROUP BY.

SELECT  YEAR(TXN_DATE) YEAR,MONTH(TXN_DATE) AS [MONTH],SUM(TXN_AMOUNT) TRANSACTION_AMOUNT FROM BANK_TRANSACTION 
WHERE TXN_STATUS = 'SUCCESS'
GROUP BY YEAR(TXN_DATE),MONTH(TXN_DATE)
--Q17. Month-End Transaction Report
--Display every successful transaction with the month-end date of its transaction month.
--•	Use EOMONTH.
SELECT  *,EOMONTH(TXN_DATE) [LAST DATE OF TXN MONTH],YEAR(TXN_DATE) [TRANSACTION YEAR],MONTH(TXN_DATE) AS [TRANSACTION MONTH] FROM BANK_TRANSACTION 
WHERE TXN_STATUS = 'SUCCESS'
--Q18. Current Month Transactions
--Find successful transactions in the current calendar month.
--•	Use current date/time functions; do not hard-code the month.
SELECT * FROM BANK_TRANSACTION

SELECT MONTH(CURRENT_DATE)-1

SELECT * FROM BANK_TRANSACTION
WHERE MONTH(TXN_DATE) = MONTH(CURRENT_DATE) AND TXN_STATUS = 'SUCCESS'

--Q19. Previous Month Transactions
--Find successful transactions in the previous calendar month.
--•	Use EOMONTH and date filtering; do not hard-code dates.
SELECT * FROM BANK_TRANSACTION
SELECT * FROM BANK_CUSTOMER
SELECT * FROM BANK_ACCOUNT
SELECT * FROM BANK_LOAN

SELECT * FROM BANK_TRANSACTION
WHERE MONTH(TXN_DATE) = MONTH(CURRENT_DATE)-1 AND TXN_STATUS = 'SUCCESS'
--Q20. Customer Transaction Dashboard
--Display customer name, account ID, transaction ID, transaction date and amount.
--•	Join Customer, Account and Transaction.
--•	Use INNER JOIN.
SELECT CUSTOMER_NAME,A.ACCOUNT_ID,T.TXN_ID,T.TXN_DATE,T.TXN_AMOUNT  FROM BANK_CUSTOMER C LEFT JOIN BANK_ACCOUNT A
ON C.CUSTOMER_ID = A.CUSTOMER_ID LEFT JOIN BANK_TRANSACTION T
ON T.ACCOUNT_ID = A.ACCOUNT_ID
--Q21. Customer Transaction Month-End
--Create a three-table report with transaction month-end.
--•	Join Customer, Account and Transaction.
--•	Use EOMONTH.
SELECT CUSTOMER_NAME,A.ACCOUNT_ID,T.TXN_ID,T.TXN_DATE,T.TXN_AMOUNT,EOMONTH(TXN_DATE) [MOTH LAST DATE]  FROM BANK_CUSTOMER C LEFT JOIN BANK_ACCOUNT A
ON C.CUSTOMER_ID = A.CUSTOMER_ID LEFT JOIN BANK_TRANSACTION T
ON T.ACCOUNT_ID = A.ACCOUNT_ID
--Q22. Dormant Account Analysis
--Find dormant accounts and show customer name, account ID, last transaction date and days since last transaction.
--•	Join Customer and Account.
--•	Use DATEDIFF.
SELECT C.CUSTOMER_NAME,A.ACCOUNT_ID,A.LAST_TRANSACTION_DATE, DATEDIFF(DAY,LAST_TRANSACTION_DATE,GETDATE()) [DAY FROM LAST TRXN]
FROM BANK_CUSTOMER C JOIN BANK_ACCOUNT A
ON C.CUSTOMER_ID = A.CUSTOMER_ID
WHERE A.ACCOUNT_STATUS = 'DORMANT'
--Q23. Inactive Account Analysis
--Find accounts where the last transaction was more than 90 days ago.
--•	Join Account and Customer.
--•	Use DATEDIFF.

SELECT C.CUSTOMER_NAME,A.ACCOUNT_ID,A.LAST_TRANSACTION_DATE, DATEDIFF(DAY,LAST_TRANSACTION_DATE,GETDATE()) DAY_FROM_LAST_TRXN
FROM BANK_CUSTOMER C JOIN BANK_ACCOUNT A
ON C.CUSTOMER_ID = A.CUSTOMER_ID
WHERE DATEDIFF(DAY,LAST_TRANSACTION_DATE,GETDATE()) > 90
--Q24. Top 5 Transaction Customers
--Find TOP 5 customers by total successful transaction amount.
--•	Join three tables.
--•	Use SUM, GROUP BY, TOP and ORDER BY.
SELECT CUSTOMER_NAME,A.ACCOUNT_ID,T.TXN_ID,T.TXN_DATE,T.TXN_AMOUNT  FROM BANK_CUSTOMER C LEFT JOIN BANK_ACCOUNT A
ON C.CUSTOMER_ID = A.CUSTOMER_ID LEFT JOIN BANK_TRANSACTION T
ON T.ACCOUNT_ID = A.ACCOUNT_ID
SELECT TOP 5 CUSTOMER_NAME, SUM(TXN_AMOUNT) [TOTAL] FROM BANK_CUSTOMER C LEFT JOIN BANK_ACCOUNT A
ON C.CUSTOMER_ID = A.CUSTOMER_ID LEFT JOIN BANK_TRANSACTION T
ON T.ACCOUNT_ID = A.ACCOUNT_ID
where T.TXN_STATUS = 'SUCCESS'
GROUP BY CUSTOMER_NAME
ORDER BY SUM(TXN_AMOUNT) DESC

SELECT * FROM BANK_CUSTOMER
SELECT * FROM BANK_LOAN
--Q25. Customer Loan Dashboard
--Display customer name, loan type, loan amount, loan start date and maturity month name.
--•	Join Customer and Loan.
--•	Use DATENAME.
SELECT C.CUSTOMER_NAME,LOAN_TYPE,LOAN_AMOUNT,LOAN_START_DATE,DATENAME(MONTH,MATURITY_DATE) [MATURITY MONTH]
FROM BANK_CUSTOMER C  JOIN BANK_LOAN L
ON C.CUSTOMER_ID = L.CUSTOMER_ID
--Q26. Loan Remaining Days
--Calculate remaining days until maturity for active loans.
--•	Use DATEDIFF.
SELECT * FROM BANK_LOAN
SELECT *, DATEDIFF(DAY,GETDATE(),MATURITY_DATE) [REMAINING DAYS] FROM BANK_LOAN
WHERE LOAN_STATUS = 'ACTIVE'
SELECT *, DATEDIFF(YEAR,GETDATE(),MATURITY_DATE) [REMAINING YEAR] FROM BANK_LOAN
WHERE LOAN_STATUS = 'ACTIVE'
--Q27. Loan Maturity Month-End
--Display the month-end date for each active loan's maturity month.
--•	Use EOMONTH.
SELECT *,FORMAT(EOMONTH(MATURITY_DATE),'dd MMMM yyyy') [last date of maturity month] FROM BANK_LOAN 
WHERE LOAN_STATUS = 'ACTIVE'
--Q28. Loans Maturing Within 365 Days
--Find active loans maturing within the next 365 days.
--•	Use DATEADD and date filtering.
select *, dateadd(day,365,getdate()) from BANK_LOAN
where LOAN_STATUS = 'active' and maturity_date <= dateadd(day,365,getdate())

select *, datediff(day,getdate(),maturity_date) from BANK_LOAN
where LOAN_STATUS = 'active' and datediff(day,getdate(),maturity_date) <= 1000

select *, dateadd(day,1000,getdate()) from BANK_LOAN
where LOAN_STATUS = 'active' and maturity_date <= dateadd(day,1000,getdate())

--Q29. Customer Banking 360
--Combine Customer, Account and Loan data.
--•	Use LEFT JOIN so customers without loans remain.
--•	Display customer, account and loan details.
select CUSTOMER_NAME,ACCOUNT_ID,LOAN_ID,LOAN_AMOUNT from BANK_CUSTOMER c  join BANK_ACCOUNT a
on c.CUSTOMER_ID = a.CUSTOMER_ID left join BANK_LOAN l
on c.CUSTOMER_ID = l.CUSTOMER_ID
--Q30. Three-Table Transaction Analysis
--For each customer and account, calculate total successful transaction amount and latest transaction date.
--•	Join Customer, Account and Transaction.
--•	Use SUM, MAX and GROUP BY.
select CUSTOMER_NAME,a.ACCOUNT_ID,sum(t.TXN_AMOUNT) [total amt],max(t.TXN_DATE) [latest TXN date]
from BANK_CUSTOMER c left join BANK_ACCOUNT a
on c.CUSTOMER_ID = a.CUSTOMER_ID left join BANK_TRANSACTION t
on a.ACCOUNT_ID = t.ACCOUNT_ID
where TXN_STATUS = 'success'
group by CUSTOMER_NAME,a.ACCOUNT_ID
select * from BANK_ACCOUNT
select * from BANK_TRANSACTION

--Q31. Month-End Account Review
--For each account show opening date, opening-month end, latest transaction date and days since latest transaction.
--•	Use LEFT JOIN so accounts without transactions remain.
--•	Use EOMONTH and DATEDIFF.
SELECT A.ACCOUNT_ID,A.ACCOUNT_OPEN_DATE,FORMAT(EOMonth(ACCOUNT_OPEN_DATE),'dd MMMM yy')  END_DATE,LAST_TRANSACTION_DATE,
DATEDIFF(DAY,LAST_TRANSACTION_DATE,GETDATE()) AS [days since latest transaction]
FROM BANK_ACCOUNT A  LEFT JOIN BANK_TRANSACTION T
ON A.ACCOUNT_ID = T.ACCOUNT_ID
--Q32. SET + JOIN City Analysis
--Combine cities of customers having accounts and customers having loans into one unique list.
--•	Use UNION and appropriate JOINs.
--•	Return one CITY column.
SELECT CITY FROM BANK_CUSTOMER C JOIN BANK_ACCOUNT A
ON C.CUSTOMER_ID = A.CUSTOMER_ID
UNION
SELECT CITY FROM BANK_CUSTOMER C JOIN BANK_LOAN L
ON C.CUSTOMER_ID = L.CUSTOMER_ID

SELECT * FROM BANK_LOAN
--Q33. Banking Date Conversion Challenge
--Create a report showing transaction date, DATE version, ISO string version and formatted display version.
--•	Use CAST, CONVERT and FORMAT together.
SELECT * FROM BANK_TRANSACTION
SELECT TXN_DATE, Cast(TXN_DATE as date) [DATE VERSION], CONVERT(VARCHAR,TXN_DATE,112 ) [ISO VERSION],
FORMAT(TXN_DATE,'dd MMMM yy') [FORMATTED VERSION]
FROM BANK_TRANSACTION
--Q34. FINAL – Banking Operations Dashboard
--Create a management-ready active-account ageing report.
--•	Display CUSTOMER_NAME, ACCOUNT_ID, ACCOUNT_TYPE, BALANCE, LAST_TRANSACTION_DATE, MONTH_END_DATE and DAYS_SINCE_TRANSACTION.
--•	Use Customer + Account + Transaction.
--•	Use LEFT JOIN for transaction retention.
--•	Use EOMONTH and DATEDIFF.
--•	Show ACTIVE accounts where days since transaction > 30 or last transaction is NULL.
--•	Sort by DAYS_SINCE_TRANSACTION DESC.


SELECT  A.ACCOUNT_STATUS,A.ACCOUNT_ID,ACCOUNT_TYPE,BALANCE,LAST_TRANSACTION_DATE,EOMONTH(LAST_TRANSACTION_DATE) MONTH_END_DATE
,DATEDIFF(DAY,LAST_TRANSACTION_DATE,GETDATE()) DAYS_SINCE_TRANSACTION FROM BANK_CUSTOMER C LEFT JOIN BANK_ACCOUNT A
ON C.CUSTOMER_ID = A.CUSTOMER_ID LEFT JOIN BANK_TRANSACTION T
ON A.ACCOUNT_ID = T.ACCOUNT_ID
WHERE A.ACCOUNT_STATUS = 'ACTIVE' AND  (DATEDIFF(DAY,LAST_TRANSACTION_DATE,GETDATE()) > 30 
OR LAST_TRANSACTION_DATE IS NULL)
ORDER BY DATEDIFF(DAY,LAST_TRANSACTION_DATE,GETDATE()) DESC

SELECT * FROM BANK_ACCOUNT

SELECT * FROM BANK_CUSTOMER C LEFT JOIN BANK_ACCOUNT A
ON C.CUSTOMER_ID = A.CUSTOMER_ID LEFT JOIN BANK_TRANSACTION T
ON A.ACCOUNT_ID = T.ACCOUNT_ID
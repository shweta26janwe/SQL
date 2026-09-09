create database BANK

--BANK_CUSTOMER
USE BANK
CREATE TABLE BANK_CUSTOMER (
 CUSTOMER_ID INT PRIMARY KEY, CUSTOMER_NAME VARCHAR(100), EMAIL_ID VARCHAR(100),
 PHONE_NUMBER VARCHAR(20), CITY VARCHAR(50), CUSTOMER_TYPE VARCHAR(30),
 CUSTOMER_SINCE DATE, PAN_NUMBER VARCHAR(20)
);

INSERT INTO BANK_CUSTOMER VALUES
(101,'Amit Sharma','amit.sharma@gmail.com','9876543210','Mumbai','Premium','2018-04-15','ABCDE1234F'),
(102,'Priya Verma','priya.verma@yahoo.com','9876501234','Pune','Regular','2020-07-21','BCDEF2345G'),
(103,'Rajesh Kumar','rajesh.kumar@exl.com','9988776655','Bangalore','Premium','2017-01-10','CDEFG3456H'),
(104,'Sneha Iyer','sneha.iyer@gmail.com','9123456780','Chennai','Regular','2021-11-05','DEFGH4567J'),
(105,'Ankit Patel','ankit.patel@rediffmail.com','9012345678','Ahmedabad','Corporate','2016-09-18','EFGHI5678K'),
(106,'Deepika Reddy','deepika.reddy@outlook.com','9090909090','Hyderabad','Premium','2019-02-25','FGHIJ6789L'),
(107,'Vikram Singh','vikram.singh@yahoo.com','9988001122','Delhi','Regular','2022-03-12','GHIJK7890M'),
(108,'Kavita Das','kavita.das@exl.com','9876112233','Kolkata','Corporate','2015-06-30','HIJKL8901N'),
(109,'Suresh Nair','suresh.nair@gmail.com','8888777766','Kochi','Regular','2023-01-08','IJKLM9012P'),
(110,'Pooja Joshi','pooja.joshi@outlook.com','7777666655','Pune','Premium','2019-12-19','JKLMN0123Q'),
(111,'Neha Kulkarni','neha.kulkarni@gmail.com','9000011111','Mumbai','Regular','2024-02-14','KLMNO1234R'),
(112,'Rohan Mehta','rohan.mehta@bankmail.com','9111122222','Delhi','Corporate','2014-08-22','LMNOP2345S');

--BANK_ACCOUNT

CREATE TABLE BANK_ACCOUNT (
 ACCOUNT_ID INT PRIMARY KEY, CUSTOMER_ID INT, ACCOUNT_NUMBER VARCHAR(20),
 ACCOUNT_TYPE VARCHAR(30), ACCOUNT_STATUS VARCHAR(20), ACCOUNT_OPEN_DATE DATETIME,
 ACCOUNT_BALANCE DECIMAL(18,2), BRANCH_CODE VARCHAR(20)
);

INSERT INTO BANK_ACCOUNT VALUES
(2001,101,'SB100001','Savings','Active','2018-04-16 10:15:00',850000,'MUM001'),
(2002,101,'CC100001','Current','Active','2020-01-10 11:20:00',1250000,'MUM002'),
(2003,102,'SB100002','Savings','Active','2020-07-22 09:30:00',325000,'PUN001'),
(2004,103,'SB100003','Savings','Active','2017-01-11 12:10:00',675000,'BLR001'),
(2005,104,'SB100004','Savings','Dormant','2021-11-06 14:00:00',95000,'CHE001'),
(2006,105,'CA100001','Current','Active','2016-09-19 10:00:00',2500000,'AHM001'),
(2007,106,'SB100005','Savings','Active','2019-02-26 13:45:00',1125000,'HYD001'),
(2008,107,'SB100006','Savings','Active','2022-03-13 15:30:00',180000,'DEL001'),
(2009,108,'CA100002','Current','Active','2015-07-01 10:10:00',3200000,'KOL001'),
(2010,109,'SB100007','Savings','Active','2023-01-09 11:11:00',210000,'KOC001'),
(2011,110,'SB100008','Savings','Active','2019-12-20 09:50:00',780000,'PUN002'),
(2012,111,'SB100009','Savings','Active','2024-02-15 12:00:00',145000,'MUM003'),
(2013,112,'CA100003','Current','Active','2014-08-23 16:10:00',4100000,'DEL002'),
(2014,102,'FD100001','Fixed Deposit','Active','2022-05-01 10:30:00',500000,'PUN001');

--BANK_TRANSACTION

CREATE TABLE BANK_TRANSACTION (
 TRANSACTION_ID INT PRIMARY KEY, ACCOUNT_ID INT, TRANSACTION_TYPE VARCHAR(30),
 TRANSACTION_AMOUNT DECIMAL(18,2), TRANSACTION_DATE DATETIME, CHANNEL VARCHAR(30),
 TRANSACTION_STATUS VARCHAR(20), REFERENCE_NUMBER VARCHAR(40)
);

INSERT INTO BANK_TRANSACTION VALUES
(50001,2001,'Deposit',150000,'2026-08-01 10:15:00','Branch','Success','NEFT-MUM-001'),
(50002,2001,'Withdrawal',25000,'2026-08-05 14:20:00','ATM','Success','ATM-MUM-002'),
(50003,2002,'Deposit',500000,'2026-08-07 09:10:00','NEFT','Success','NEFT-MUM-003'),
(50004,2002,'Withdrawal',125000,'2026-08-15 16:40:00','Online','Success','UPI-MUM-004'),
(50005,2003,'Deposit',100000,'2026-07-10 11:00:00','UPI','Success','UPI-PUN-005'),
(50006,2003,'Withdrawal',15000,'2026-07-22 18:10:00','ATM','Success','ATM-PUN-006'),
(50007,2004,'Deposit',225000,'2026-06-05 10:45:00','NEFT','Success','NEFT-BLR-007'),
(50008,2004,'Withdrawal',30000,'2026-06-25 13:15:00','ATM','Failed','ATM-BLR-008'),
(50009,2005,'Withdrawal',10000,'2025-12-15 12:30:00','ATM','Success','ATM-CHE-009'),
(50010,2006,'Deposit',750000,'2026-08-03 09:25:00','NEFT','Success','NEFT-AHM-010'),
(50011,2006,'Withdrawal',225000,'2026-08-20 15:05:00','Online','Success','RTGS-AHM-011'),
(50012,2007,'Deposit',300000,'2026-05-12 10:10:00','Branch','Success','CASH-HYD-012'),
(50013,2007,'Withdrawal',45000,'2026-05-20 17:00:00','ATM','Success','ATM-HYD-013'),
(50014,2008,'Deposit',80000,'2026-04-15 11:15:00','UPI','Success','UPI-DEL-014'),
(50015,2009,'Deposit',1200000,'2026-08-02 09:45:00','NEFT','Success','NEFT-KOL-015'),
(50016,2009,'Withdrawal',350000,'2026-08-18 16:20:00','RTGS','Success','RTGS-KOL-016'),
(50017,2010,'Deposit',50000,'2026-03-10 10:30:00','UPI','Success','UPI-KOC-017'),
(50018,2011,'Deposit',175000,'2026-07-01 09:15:00','NEFT','Success','NEFT-PUN-018'),
(50019,2011,'Withdrawal',25000,'2026-07-25 14:00:00','ATM','Success','ATM-PUN-019'),
(50020,2012,'Deposit',45000,'2025-11-20 10:00:00','UPI','Success','UPI-MUM-020'),
(50021,2013,'Deposit',900000,'2026-08-10 10:10:00','RTGS','Success','RTGS-DEL-021'),
(50022,2013,'Withdrawal',500000,'2026-08-25 15:30:00','Online','Success','NEFT-DEL-022'),
(50023,2014,'Deposit',200000,'2026-01-15 11:40:00','Branch','Success','FD-PUN-023'),
(50024,2001,'Deposit',50000,'2026-08-28 12:15:00','UPI','Failed','UPI-MUM-024'),
(50025,2006,'Withdrawal',100000,'2026-08-30 17:45:00','ATM','Success','ATM-AHM-025');

--BANK_LOAN

CREATE TABLE BANK_LOAN (
 LOAN_ID INT PRIMARY KEY, CUSTOMER_ID INT, LOAN_TYPE VARCHAR(40),
 LOAN_AMOUNT DECIMAL(18,2), LOAN_START_DATE DATE, TENURE_MONTHS INT,
 LOAN_STATUS VARCHAR(20)
);

INSERT INTO BANK_LOAN VALUES
(7001,101,'Home Loan',4500000,'2022-01-15',240,'Active'),
(7002,102,'Personal Loan',750000,'2024-06-10',36,'Active'),
(7003,103,'Car Loan',1200000,'2023-03-20',60,'Active'),
(7004,105,'Business Loan',8000000,'2021-09-01',120,'Active'),
(7005,106,'Home Loan',3500000,'2020-05-15',180,'Active'),
(7006,108,'Business Loan',12000000,'2019-07-01',120,'Active'),
(7007,110,'Personal Loan',500000,'2025-02-01',24,'Active'),
(7008,112,'Home Loan',6000000,'2018-08-15',180,'Active'),
(7009,104,'Education Loan',900000,'2022-07-10',60,'Closed'),
(7010,107,'Vehicle Loan',650000,'2023-05-05',48,'Active');
 
--40 Banking-Domain SQL Interview Questions

--Q1. Customer Account 360
--Display Customer ID, Customer Name, City, Account Number, Account Type, Account Balance 
--and Account Opening Date for every customer having an account.
select * from BANK_CUSTOMER
SELECT * FROM BANK_ACCOUNT
SELECT C.CUSTOMER_ID,C.CUSTOMER_NAME,C.CITY,A.ACCOUNT_NUMBER, A.ACCOUNT_TYPE,
A.ACCOUNT_BALANCE,A.ACCOUNT_OPEN_DATE FROM BANK_CUSTOMER C LEFT JOIN BANK_ACCOUNT A
ON C.CUSTOMER_ID = A.CUSTOMER_ID

--Q2. Customers Without Accounts
--Identify customers registered with the bank but without any bank account. 
--Display Customer ID, Customer Name and City.
SELECT * FROM BANK_CUSTOMER C LEFT JOIN  BANK_ACCOUNT A
ON C.CUSTOMER_ID = A.CUSTOMER_ID
WHERE A.CUSTOMER_ID IS NULL


--Q3. Customers by City
--Find the number of customers in each city. Display City and Total Customers. 
--Sort by highest count first.
SELECT CITY,COUNT(CUSTOMER_ID) [TOTAL CUSTOMER] FROM BANK_CUSTOMER
GROUP BY CITY
ORDER BY COUNT(CUSTOMER_ID) DESC;
--Q4. High-Value Customers
--Identify customers whose total balance across all accounts is greater than ₹5,00,000.
--Display Customer ID, Customer Name and Total Balance.
SELECT C.CUSTOMER_ID,C.CUSTOMER_NAME,SUM(A.ACCOUNT_BALANCE) [TOTAL BALANCE]
FROM BANK_CUSTOMER C LEFT JOIN BANK_ACCOUNT A
ON C.CUSTOMER_ID = A.CUSTOMER_ID
GROUP BY C.CUSTOMER_ID,C.CUSTOMER_NAME
HAVING SUM(A.ACCOUNT_BALANCE) > 500000
--Q5. Top 5 Customers by Balance
--Find the top 5 customers based on total account balance.
SELECT TOP 5 C.CUSTOMER_ID,C.CUSTOMER_NAME,SUM(A.ACCOUNT_BALANCE) [TOTAL BALANCE]
FROM BANK_CUSTOMER C LEFT JOIN BANK_ACCOUNT A
ON C.CUSTOMER_ID = A.CUSTOMER_ID
GROUP BY C.CUSTOMER_ID,C.CUSTOMER_NAME
ORDER BY SUM(A.ACCOUNT_BALANCE) DESC;
--Q6. Transaction Details with Customer
--Display Customer Name, Account Number, Transaction ID, Transaction Type, 
--Transaction Amount, Transaction Date and Channel for every transaction.
SELECT * FROM BANK_TRANSACTION;
SELECT C.CUSTOMER_NAME,A.ACCOUNT_NUMBER,T.TRANSACTION_ID,T.TRANSACTION_TYPE,
T.TRANSACTION_AMOUNT,T.TRANSACTION_DATE,T.CHANNEL FROM BANK_CUSTOMER C JOIN BANK_ACCOUNT A
ON C.CUSTOMER_ID = A.CUSTOMER_ID  RIGHT JOIN
BANK_TRANSACTION T 
ON A.ACCOUNT_ID = T.ACCOUNT_ID

--Q7. Customer Transaction Exposure
--Calculate total transaction amount for each customer and show only customers whose 
--total exceeds ₹10,00,000.
SELECT C.CUSTOMER_NAME, SUM(A.ACCOUNT_BALANCE) [TOTAL BAL]
FROM BANK_CUSTOMER C JOIN BANK_ACCOUNT A
ON C.CUSTOMER_ID = A.CUSTOMER_ID
GROUP BY C.CUSTOMER_NAME
HAVING SUM(A.ACCOUNT_BALANCE) > 1000000

--Q8. Deposit vs Withdrawal
--Calculate transaction count and total amount separately for Deposit and Withdrawal.
SELECT T.TRANSACTION_TYPE, COUNT(T.TRANSACTION_ID) [TOTAL TRANSACTION],
SUM(T.TRANSACTION_AMOUNT) [TOTAL AMT] FROM BANK_CUSTOMER C JOIN BANK_ACCOUNT A
ON C.CUSTOMER_ID = A.CUSTOMER_ID JOIN BANK_TRANSACTION T
ON T.ACCOUNT_ID = A.ACCOUNT_ID
GROUP BY T.TRANSACTION_TYPE
--Q9. Highest Transaction by Customer
--Find the highest transaction amount performed by each customer.
SELECT C.CUSTOMER_NAME, MAX(T.TRANSACTION_AMOUNT) [HIGHEST TXN AMT.] FROM BANK_CUSTOMER C JOIN BANK_ACCOUNT A
ON C.CUSTOMER_ID = A.CUSTOMER_ID JOIN BANK_TRANSACTION T
ON T.ACCOUNT_ID = A.ACCOUNT_ID
GROUP BY C.CUSTOMER_NAME
--Q10. Accounts with No Transactions
--Identify accounts that have never had a transaction.
SELECT * FROM BANK_ACCOUNT A LEFT JOIN BANK_TRANSACTION T
ON A.ACCOUNT_ID = T.ACCOUNT_ID
WHERE T.TRANSACTION_ID IS NULL

--Q11. Transaction Year Analysis
--Display Transaction Year, Number of Transactions and Total Transaction Amount for each
--year.
SELECT * FROM BANK_TRANSACTION
SELECT YEAR(TRANSACTION_DATE),COUNT(TRANSACTION_ID) [No. of txn],SUM(TRANSACTION_AMOUNT) [Total amt.]
FROM BANK_TRANSACTION
GROUP BY YEAR(TRANSACTION_DATE)

--Q12. Monthly Transaction Analysis
--Display Transaction Year, Transaction Month, Transaction Count and Total Transaction 
--Amount for each month.
SELECT YEAR(TRANSACTION_DATE),month(TRANSACTION_DATE) MONTH,COUNT(TRANSACTION_ID) [TXN COUNT],SUM(TRANSACTION_AMOUNT)
[TOTAL TXN AMOUNT] FROM BANK_TRANSACTION
GROUP BY YEAR(TRANSACTION_DATE),MONTH(TRANSACTION_DATE)
--Q13. Month Name Report
--Create a monthly report containing Month Number, Month Name, Transaction Count and Total Transaction Amount.
select YEAR(TRANSACTION_DATE),month(TRANSACTION_DATE) Month,DATENAME(MONTH,TRANSACTION_DATE) MONTH_NAME,
COUNT(TRANSACTION_ID) [TXN COUNT],SUM(TRANSACTION_AMOUNT) [TOTAL AMT]
from BANK_TRANSACTION 
group by YEAR(TRANSACTION_DATE),(DATENAME(MONTH,TRANSACTION_DATE)),month(TRANSACTION_DATE)
--Q14. Day-of-Week Transaction Analysis
--Find the number of successful transactions performed on each day of the week.
SELECT YEAR(TRANSACTION_DATE),MONTH(TRANSACTION_DATE),DATENAME(WEEKDAY,TRANSACTION_DATE),COUNT(TRANSACTION_ID) [NO. OF TXN] FROM BANK_TRANSACTION
WHERE TRANSACTION_STATUS = 'SUCCESS'
GROUP BY YEAR(TRANSACTION_DATE),MONTH(TRANSACTION_DATE),DATENAME(WEEKDAY,TRANSACTION_DATE)

--Q15. Weekend Banking Activity
--Identify transactions performed on Saturday or Sunday and display Day Name.
SELECT *,DATENAME(WEEKDAY,TRANSACTION_DATE) FROM BANK_TRANSACTION
WHERE DATENAME(WEEKDAY,TRANSACTION_DATE) IN ('Saturday','Sunday')
--Q16. Current-Day Transactions
--Find all successful transactions performed on the current system date. Do not hardcode today's date.
select * from BANK_TRANSACTION
where TRANSACTION_DATE = GETDATE() and TRANSACTION_STATUS = 'status'
--Q17. Last 30 Days Transactions
--Find successful transactions performed during the last 30 days relative to the current system date.
select getdate()-30
select * from BANK_TRANSACTION
where TRANSACTION_STATUS = 'success' and 
TRANSACTION_DATE between getdate()-30 and getdate();

--Q18. Transaction Ageing
--For every transaction, calculate the number of days between Transaction Date and the current system date.
select *, datediff(day,TRANSACTION_DATE,getdate()) [Days from TXN] from BANK_TRANSACTION
--Q19. Account Ageing
--Calculate how many days each account has been active.
select * , datediff(day,ACCOUNT_OPEN_DATE,getdate()) [age of account] from BANK_ACCOUNT
where ACCOUNT_STATUS = 'Active'

--Q20. Accounts Opened This Year
--Find all accounts opened during the current calendar year without hardcoding the year.
select * from BANK_ACCOUNT
where year(ACCOUNT_OPEN_DATE) = year(getdate())

--account opens in the past 4 years
select year(getdate())-3
select * from BANK_ACCOUNT
where year(ACCOUNT_OPEN_DATE) >=  year(getdate())-3

--Q21. Account Month-End
--For every account, display the last day of the account-opening month.
select *, eomonth(ACCOUNT_OPEN_DATE) [end day of acc opened month] from BANK_ACCOUNT
--Q22. Next Month-End
--For every account, calculate the last day of the month following the opening month.
select *, eomonth(ACCOUNT_OPEN_DATE,+1) [last date of acc opened next month] from BANK_ACCOUNT

--Q23. Previous Month-End
--For every transaction, display the last day of the previous month.
select *, eomonth(ACCOUNT_OPEN_DATE,-1) [last day of acc opened previous month] from BANK_ACCOUNT

select * from BANK_TRANSACTION
--Q24. Month-End Transaction Summary
--Create a monthly report showing Month-End Date, Transaction Count and Total Transaction Amount.
select  year(transaction_date) YEAR ,datename(month,transaction_date) MONTH,EOMONTH(transaction_date) [Last Date], count(transaction_id) [Transaction Count],
sum(TRANSACTION_AMOUNT) [Transaction Amount]  from BANK_TRANSACTION
group by year(transaction_date), datename(month,transaction_date), EOMONTH(transaction_date)
--Q25. Recent Account Openings
--Identify accounts opened within the last 3 months and display Opening Date, Month-End Date and Balance.
select * from BANK_ACCOUNT
select month(2020-01-10) - 3
select eomonth(getdate(),-4)
select ACCOUNT_OPEN_DATE,EOMONTH(ACCOUNT_OPEN_DATE) [end date] ,ACCOUNT_BALANCE from BANK_ACCOUNT
where ACCOUNT_OPEN_DATE > eomonth(getdate(),-4)

--Q26. Bank Statement Date Format
--Display Transaction Date in dd-MM-yyyy format for a customer statement.
select *, format(TRANSACTION_DATE,'dd-MM-yyyy') [Date Format] from BANK_TRANSACTION
--Q27. Month-Year Reporting
--Display transaction month and year as MMM-yyyy along with count and total amount.
select format(TRANSACTION_DATE,'MMM-yyyy') [Date Format],count(*) [total TXN], sum(TRANSACTION_AMOUNT) [Total AMT] from BANK_TRANSACTION
group by format(TRANSACTION_DATE,'MMM-yyyy')
--Q28. Indian Currency Formatting
--Display account balances using Indian currency/number formatting with en-IN culture.
select ACCOUNT_ID,ACCOUNT_NUMBER,ACCOUNT_OPEN_DATE, format(ACCOUNT_BALANCE,'C','en-IN') [Account Balance]
from BANK_ACCOUNT
--Q29. Transaction Date CAST
--Display Transaction ID, original Transaction Date and the same value converted to DATE using CAST.
select *,TRANSACTION_ID,TRANSACTION_DATE,cast(TRANSACTION_DATE as date) [casted TXN Date] from BANK_TRANSACTION
--Q30. Transaction Date CONVERT
--Display Transaction ID and Transaction Date converted to YYYY-MM-DD using CONVERT and the appropriate style.
select TRANSACTION_ID,TRANSACTION_DATE,convert(varchar,TRANSACTION_DATE ,102) [convert format of date]
from BANK_TRANSACTION

--Q31. Loan Maturity Date
--Calculate Loan Maturity Date using Loan Start Date and Tenure in Months.
select dateadd(MM,240,getdate())
select *, dateadd(month,TENURE_MONTHS,LOAN_START_DATE) [Loan Maturity Date] from BANK_LOAN
--Q32. Loan Remaining Tenure
--Calculate the number of months between the current date and each active loan's maturity date.
select *,dateadd(month,TENURE_MONTHS,LOAN_START_DATE) [Loan Maturity Date],
datediff(MM,getdate(),dateadd(month,TENURE_MONTHS,LOAN_START_DATE)) MonthRemainnigToLoanMature
from BANK_LOAN
--Q33. Overdue Loans
--Identify active loans whose calculated maturity date has passed.
select * from BANK_LOAN
select *,dateadd(MM,TENURE_MONTHS,LOAN_START_DATE) [Loan Maturity Date] from BANK_LOAN
where LOAN_STATUS='Active' and dateadd(MM,TENURE_MONTHS,LOAN_START_DATE) <= getdate()

select *,dateadd(MM,TENURE_MONTHS,LOAN_START_DATE) [Loan Maturity Date] from BANK_LOAN
where LOAN_STATUS='Active' and dateadd(MM,TENURE_MONTHS,LOAN_START_DATE) <= '2027-09-01'
--Q34. Loans Maturing This Year
--Find loans whose calculated maturity date falls in the current year.
select *,dateadd(MM,TENURE_MONTHS,LOAN_START_DATE) [Loan Maturity Date] from BANK_LOAN
where LOAN_STATUS='Active' and year(dateadd(MM,TENURE_MONTHS,LOAN_START_DATE)) = '2027'
--Q35. High Exposure Customers
--Identify customers with total loan amount above ₹10,00,000 and successful transaction amount below ₹2,00,000.

SELECT C.CUSTOMER_NAME, COUNT(T.TRANSACTION_ID),SUM(T.TRANSACTION_AMOUNT),COUNT(L.LOAN_ID),SUM(L.LOAN_AMOUNT)
from BANK_CUSTOMER C JOIN BANK_ACCOUNT A
on C.CUSTOMER_ID = A.CUSTOMER_ID JOIN BANK_TRANSACTION T
ON T.ACCOUNT_ID = A.ACCOUNT_ID JOIN BANK_LOAN L
ON L.CUSTOMER_ID = C.CUSTOMER_ID
GROUP BY C.CUSTOMER_NAME,L.LOAN_ID
HAVING SUM(T.TRANSACTION_AMOUNT) < 200000 AND SUM(L.LOAN_AMOUNT) > 1000000

select * from BANK_LOAN
select * from BANK_TRANSACTION
select * from BANK_CUSTOMER
select C.CUSTOMER_ID,C.CUSTOMER_NAME,A.ACCOUNT_ID,T.TRANSACTION_ID,T.TRANSACTION_AMOUNT,L.LOAN_ID,L.CUSTOMER_ID,L.LOAN_AMOUNT
from BANK_CUSTOMER C JOIN BANK_ACCOUNT A
on C.CUSTOMER_ID = A.CUSTOMER_ID JOIN BANK_TRANSACTION T
ON T.ACCOUNT_ID = A.ACCOUNT_ID JOIN BANK_LOAN L
ON L.CUSTOMER_ID = C.CUSTOMER_ID
--Q36. Inactive Customers – 90 Days
--Identify customers who have not performed a successful transaction in the last 90 days. 
--Display Customer ID, Customer Name and Last Transaction Date.
SELECT C.Customer_ID, C.CUSTOMER_NAME,T.TRANSACTION_DATE,T.TRANSACTION_STATUS FROM BANK_CUSTOMER C LEFT JOIN BANK_ACCOUNT A
ON C.CUSTOMER_ID = A.CUSTOMER_ID join BANK_TRANSACTION T
ON a.ACCOUNT_ID = T.ACCOUNT_ID
where t.TRANSACTION_DATE >= dateadd(day,-90,getdate()) 
and TRANSACTION_STATUS <> 'SUCCESS'

select dateadd(day,-90,getdate())
--Q37. Transaction Customers Without Loans
--Identify customers with successful transaction activity but no loan.
SELECT C.CUSTOMER_NAME,A.ACCOUNT_NUMBER,T.TRANSACTION_ID,T.TRANSACTION_STATUS,L.LOAN_ID
from BANK_CUSTOMER C JOIN BANK_ACCOUNT A
on C.CUSTOMER_ID = A.CUSTOMER_ID JOIN BANK_TRANSACTION T
ON T.ACCOUNT_ID = A.ACCOUNT_ID JOIN BANK_LOAN L
ON L.CUSTOMER_ID = C.CUSTOMER_ID
WHERE T.TRANSACTION_STATUS = 'SUCCESS' AND L.LOAN_ID IS NULL 
--Q38. Deposit and Withdrawal Customers
--Identify customers who have performed both Deposit and Withdrawal transactions. 
--Display customer and the two transaction totals.
SELECT C.CUSTOMER_ID,COUNT(DISTINCT T.TRANSACTION_TYPE)
FROM BANK_CUSTOMER C LEFT JOIN BANK_ACCOUNT A
ON C.CUSTOMER_ID = A.CUSTOMER_ID JOIN
BANK_TRANSACTION T
ON  A.ACCOUNT_ID = T.ACCOUNT_ID
GROUP BY C.CUSTOMER_ID
HAVING COUNT(DISTINCT T.TRANSACTION_TYPE) = 2

--Q39. Customer 360 Banking Report
--Create a customer-level report with Customer ID, Name, City, Number of Accounts, Total Balance, Transaction Count, 
--Total Transaction Amount, Total Loan Amount, Latest Transaction Date and Account Age.
select C.CUSTOMER_ID,C.CUSTOMER_NAME,C.CITY, COUNT(DISTINCT A.ACCOUNT_ID) [Number of Accounts],SUM(DISTINCT A.ACCOUNT_BALANCE) 
[Total Balance],COUNT(DISTINCT T.TRANSACTION_ID) [Transaction Count],SUM(DISTINCT T.TRANSACTION_AMOUNT) [Total Transaction Amount],
SUM(DISTINCT L.LOAN_AMOUNT) [Total Loan Amount],MAX(T.TRANSACTION_DATE) [Latest Transaction Date],
DATEDIFF(DAY,A.ACCOUNT_OPEN_DATE,GETDATE()) [Account Age]
from BANK_CUSTOMER C left JOIN BANK_ACCOUNT A
on C.CUSTOMER_ID = A.CUSTOMER_ID  JOIN BANK_TRANSACTION T
ON T.ACCOUNT_ID = A.ACCOUNT_ID  JOIN BANK_LOAN L
ON L.CUSTOMER_ID = C.CUSTOMER_ID
GROUP BY C.CUSTOMER_ID,C.CUSTOMER_NAME,C.CITY,A.ACCOUNT_ID,
DATEDIFF(DAY,A.ACCOUNT_OPEN_DATE,GETDATE())
ORDER BY CUSTOMER_ID

SELECT C.CUSTOMER_ID,A.ACCOUNT_ID,T.TRANSACTION_ID,L.LOAN_ID,L.LOAN_AMOUNT
from BANK_CUSTOMER C  JOIN BANK_ACCOUNT A
on C.CUSTOMER_ID = A.CUSTOMER_ID  JOIN BANK_TRANSACTION T
ON T.ACCOUNT_ID = A.ACCOUNT_ID  JOIN BANK_LOAN L
ON L.CUSTOMER_ID = C.CUSTOMER_ID
ORDER BY C.CUSTOMER_ID

SELECT
    C.CUSTOMER_ID,
    C.CUSTOMER_NAME,
    C.CITY,
    ISNULL(A.NumberOfAccounts, 0) AS [Number of Accounts],
    ISNULL(A.TotalBalance, 0) AS [Total Balance],
    ISNULL(T.TransactionCount, 0) AS [Transaction Count],
    ISNULL(T.TotalTransactionAmount, 0) AS [Total Transaction Amount],
    ISNULL(L.TotalLoanAmount, 0) AS [Total Loan Amount],
    T.LatestTransactionDate,
    DATEDIFF(DAY, A.FirstAccountOpenDate, GETDATE()) AS [Account Age]
FROM BANK_CUSTOMER C

LEFT JOIN
(
    SELECT
        CUSTOMER_ID,
        COUNT(*) AS NumberOfAccounts,
        SUM(ACCOUNT_BALANCE) AS TotalBalance,
        MIN(ACCOUNT_OPEN_DATE) AS FirstAccountOpenDate
    FROM BANK_ACCOUNT
    GROUP BY CUSTOMER_ID
) A
ON C.CUSTOMER_ID = A.CUSTOMER_ID

LEFT JOIN
(
    SELECT
        A.CUSTOMER_ID,
        COUNT(T.TRANSACTION_ID) AS TransactionCount,
        SUM(T.TRANSACTION_AMOUNT) AS TotalTransactionAmount,
        MAX(T.TRANSACTION_DATE) AS LatestTransactionDate
    FROM BANK_ACCOUNT A
    JOIN BANK_TRANSACTION T
        ON A.ACCOUNT_ID = T.ACCOUNT_ID
    GROUP BY A.CUSTOMER_ID
) T
ON C.CUSTOMER_ID = T.CUSTOMER_ID

LEFT JOIN
(
    SELECT
        CUSTOMER_ID,
        SUM(LOAN_AMOUNT) AS TotalLoanAmount
    FROM BANK_LOAN
    GROUP BY CUSTOMER_ID
) L
ON C.CUSTOMER_ID = L.CUSTOMER_ID;
--Q40. Banking Management Dashboard
--Create a management report with Customer Name, City, Account Type, Balance, Transaction Count, 
--Total Transaction Amount, Last Transaction Date, Days Since Last Transaction, Loan Amount,
--Loan Maturity Date and Loan Status. Add a business-oriented customer classification using only topics already covered.
select C.CUSTOMER_NAME,C.CITY,A.ACCOUNT_TYPE,SUM(DISTINCT A.ACCOUNT_BALANCE) [BALANCE],
COUNT(DISTINCT T.TRANSACTION_ID) [Transaction Count],SUM(DISTINCT T.TRANSACTION_AMOUNT) [Total Transaction Amount],
SUM(DISTINCT L.LOAN_AMOUNT) [Total Loan Amount],MAX(T.TRANSACTION_DATE) [Latest Transaction Date],
DATEDIFF(DAY,MAX(T.TRANSACTION_DATE),GETDATE()) [DAYS SINCE LAST TXN],DATEADD(MONTH,L.TENURE_MONTHS,L.LOAN_START_DATE),
L.LOAN_STATUS
from BANK_CUSTOMER C JOIN BANK_ACCOUNT A
on C.CUSTOMER_ID = A.CUSTOMER_ID JOIN BANK_TRANSACTION T
ON T.ACCOUNT_ID = A.ACCOUNT_ID JOIN BANK_LOAN L
ON L.CUSTOMER_ID = C.CUSTOMER_ID
GROUP BY C.CUSTOMER_NAME,C.CITY,A.ACCOUNT_TYPE,L.LOAN_STATUS,
DATEADD(MONTH,L.TENURE_MONTHS,L.LOAN_START_DATE)
--Interview Preparation Checklist
--•	Write and execute every query in SQL Server / SSMS.
--•	Validate the grain of each table before joining and aggregating.
--•	For banking reporting, include only successful transactions when the requirement specifies successful activity.
--•	Use EOMONTH for month-end reporting and DATEADD/DATEDIFF for date calculations.
--•	Use FORMAT for presentation formatting and CAST/CONVERT for datatype conversion.
--•	Use string functions for customer/contact/reference-data cleansing and reporting scenarios.
--•	Check for duplicate rows after multi-table joins.
--•	Use clear aliases and business-friendly output column names.

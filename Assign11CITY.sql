use Bank;
CREATE TABLE DEPARTMENT_SET11(DEPT_ID INT PRIMARY KEY,DEPT_NAME VARCHAR(50));
INSERT INTO DEPARTMENT_SET11 VALUES(10,'IT'),(20,'HR'),(30,'Finance'),(40,'Testing'),
(50,'Operations'),(60,'Research');

CREATE TABLE EMPLOYEE_SET11(EMP_ID INT PRIMARY KEY,EMP_NAME VARCHAR(80),DEPT_ID INT NULL,SALARY DECIMAL(12,2),
PERFORMANCE_SCORE INT,JOIN_DATE DATE,EMAIL VARCHAR(100) NULL,MANAGER_ID INT NULL,SALARY_ADJUSTMENT DECIMAL(12,2) NULL);
INSERT INTO EMPLOYEE_SET11 VALUES
(101,'Amit Sharma',10,50000,82,'2021-01-15','amit@gmail.com',NULL,1500),
(102,'Priya Patil',10,70000,91,'2020-03-20','priya@gmail.com',101,-750),
(103,'Rahul Verma',20,60000,76,'2022-05-11','rahul@outlook.com',NULL,500),
(104,'Sneha Kulkarni',20,80000,95,'2019-08-14','sneha@gmail.com',103,2250),
(105,'Neha Joshi',30,55000,68,'2023-02-18','neha@yahoo.com',NULL,NULL),
(106,'Karan Mehta',30,90000,88,'2018-11-25','karan@gmail.com',105,1250),
(107,'Rohan Shah',40,45000,72,'2022-09-12','rohan@outlook.com',NULL,-500),
(108,'Pooja Nair',40,65000,84,'2021-12-01','pooja@gmail.com',107,1000),
(109,'Vikas Rao',NULL,72000,79,'2020-06-10','vikas@yahoo.com',101,NULL),
(110,'Meera Desai',50,110000,97,'2017-04-22','meera@gmail.com',NULL,3250),
(111,'Arjun Singh',10,70000,61,'2024-01-10',NULL,101,-250),
(112,'Kavya Iyer',60,125000,93,'2016-07-19','kavya@gmail.com',NULL,5000),
(113,'Riya Shah',30,90000,88,'2025-02-01','riya@gmail.com',106,750),
(114,'Nikhil Jain',20,80000,90,'2024-05-08','nikhil@gmail.com',104,1000);

CREATE TABLE CUSTOMER_SET11(CUSTOMER_ID INT PRIMARY KEY,CUSTOMER_NAME VARCHAR(80),
CITY VARCHAR(50),CUSTOMER_TYPE VARCHAR(30),EMAIL VARCHAR(100) NULL,PHONE VARCHAR(20) NULL,
ALT_EMAIL VARCHAR(100) NULL,ALT_PHONE VARCHAR(20) NULL);

INSERT INTO CUSTOMER_SET11 VALUES
(201,'Aditya Kumar','Mumbai','Premium','aditya@gmail.com','9876500001',NULL,NULL),
(202,'Bhavna Shah','Pune','Regular',NULL,'9876500002','bhavna.alt@gmail.com',NULL),
(203,'Chetan Rao','Delhi','Corporate','chetan@outlook.com',NULL,NULL,'9123400003'),
(204,'Divya Nair','Mumbai','Premium',NULL,NULL,'divya.alt@yahoo.com','9123400004'),
(205,'Eshan Patil','Nashik','Regular','eshan@gmail.com','9876500005',NULL,NULL),
(206,'Farah Khan','Pune','Corporate','farah@company.com',NULL,NULL,'9123400006'),
(207,'Gaurav Joshi','Bangalore','Premium','gaurav@gmail.com','9876500007',NULL,NULL),
(208,'Hema Desai','Mumbai','Regular',NULL,NULL,NULL,'9123400008'),
(209,'Isha Rao','Delhi','Premium','isha@gmail.com','9876500009',NULL,NULL),
(210,'Jay Mehta','Pune','Corporate','jay@gmail.com','9876500010',NULL,NULL);

CREATE TABLE ACCOUNT_SET11(ACCOUNT_ID INT PRIMARY KEY,CUSTOMER_ID INT,ACCOUNT_NO VARCHAR(20),
ACCOUNT_TYPE VARCHAR(30),ACCOUNT_BALANCE DECIMAL(15,2),OPENING_DATE DATE);
INSERT INTO ACCOUNT_SET11 VALUES(301,201,'AC11001','Savings',125000.50,'2020-04-15'),
(302,201,'AC11002','Current',725000.75,'2018-07-20'),
(303,202,'AC11003','Savings',350000.25,'2022-01-10'),
(304,203,'AC11004','Current',950000.65,'2017-11-05'),
(305,204,'AC11005','Salary',180000.55,'2023-06-18'),
(306,205,'AC11006','Savings',275000.99,'2021-09-25'),
(307,206,'AC11007','Current',1250000.88,'2016-03-12'),
(308,207,'AC11008','Savings',620000.44,'2019-12-01'),
(309,208,'AC11009','Salary',45000.13,'2024-02-14'),
(310,209,'AC11010','Current',875000.33,'2015-08-30'),
(311,210,'AC11011','Savings',510000.67,'2020-10-11');

CREATE TABLE TRANSACTION_SET11(TRANSACTION_ID INT PRIMARY KEY,ACCOUNT_ID INT,TRANSACTION_TYPE VARCHAR(20),
TRANSACTION_AMOUNT DECIMAL(15,2),TRANSACTION_DATE DATETIME);

INSERT INTO TRANSACTION_SET11 VALUES(401,301,'Credit',1250.46,'2026-01-15 10:30'),
(402,301,'Debit',275.13,'2026-02-18 12:10'),
(403,301,'Credit',5250.79,'2026-03-05 09:15'),
(404,302,'Credit',12500.33,'2026-01-20 16:45'),
(405,302,'Debit',9500.87,'2026-03-28 11:20'),
(406,302,'Credit',15250.88,'2026-05-19 14:35'),
(407,303,'Credit',999.50,'2026-02-07 10:05'),
(408,303,'Debit',4500.13,'2026-04-21 15:25'),
(409,304,'Credit',125000.65,'2026-03-03 09:50'),
(410,304,'Debit',7250.99,'2026-08-17 17:10'),
(411,305,'Credit',350.56,'2025-11-23 13:40'),
(412,305,'Debit',8750.44,'2026-02-01 10:00'),
(413,306,'Credit',11250.78,'2026-06-02 12:30'),
(414,306,'Debit',625.25,'2026-09-03 18:15'),
(415,307,'Credit',22500.55,'2026-01-10 09:00'),
(416,307,'Credit',42500.55,'2026-04-10 09:00'),
(417,307,'Debit',12500.55,'2026-07-10 09:00'),
(418,308,'Credit',7250.75,'2026-02-12 11:00'),
(419,308,'Credit',10250.75,'2026-05-12 11:00'),
(420,309,'Debit',1500.25,'2026-03-15 13:00'),
(421,310,'Credit',87500.44,'2026-04-01 14:00'),
(422,311,'Debit',6250.66,'2026-06-15 16:00');

CREATE TABLE PRODUCT_SET11(PRODUCT_ID INT PRIMARY KEY,PRODUCT_NAME VARCHAR(100),CATEGORY VARCHAR(50),
PRICE DECIMAL(12,2),STOCK_QTY INT);
INSERT INTO PRODUCT_SET11 VALUES(501,'Laptop Pro','Electronics',85000.50,15),
(502,'Wireless Mouse','Electronics',1250.75,120),
(503,'Office Chair','Furniture',9500,8),
(504,'Desk','Furniture',15000.25,0),(505,'Monitor 27','Electronics',22000,35),
(506,'Keyboard','Electronics',2750.50,60),(507,'Notebook Pack','Stationery',450.25,200),
(508,'Printer','Electronics',18500.75,5),(509,'Conference Table','Furniture',45000,2),
(510,'Webcam','Electronics',6500.25,0);

CREATE TABLE ORDER_SET11(ORDER_ID INT PRIMARY KEY,CUSTOMER_ID INT,PRODUCT_ID INT,ORDER_AMOUNT DECIMAL(12,2),
ORDER_DATE DATE,ORDER_STATUS VARCHAR(30));
INSERT INTO ORDER_SET11 VALUES(601,201,501,85000.50,'2026-01-12','Completed'),
(602,201,502,1250.75,'2026-02-15','Completed'),(603,201,505,22000,'2026-06-14','Completed'),
(604,202,503,9500,'2026-02-20','Pending'),(605,203,505,44000,'2026-03-05','Completed'),
(606,205,507,900.50,'2026-03-18','Completed'),(607,206,506,2750.50,'2026-04-11','Cancelled'),
(608,207,501,170001,'2026-05-09','Completed'),(609,203,502,2501.50,'2026-07-22','Completed'),
(610,205,504,15000.25,'2026-08-03','Pending'),(611,206,508,18500.75,'2025-12-19','Completed'),
(612,207,506,5501,'2026-08-21','Completed'),(613,209,509,45000,'2026-02-08','Completed'),
(614,209,510,6500.25,'2026-04-08','Completed'),(615,209,509,45000,'2026-08-08','Completed'),
(616,210,502,3752.25,'2026-03-12','Completed');

CREATE TABLE PAYMENT_SET11(PAYMENT_ID INT PRIMARY KEY,CUSTOMER_ID INT,AMOUNT_DUE DECIMAL(12,2),
AMOUNT_PAID DECIMAL(12,2) NULL,PAYMENT_DATE DATE NULL);
INSERT INTO PAYMENT_SET11 VALUES(701,201,12500.45,12500.45,'2026-01-31'),(702,202,25000.75,22000.55,'2026-02-28'),
(703,203,17500.13,NULL,NULL),(704,204,32000.65,32000.65,'2026-03-31'),(705,205,8500.33,7000.11,'2026-04-30'),
(706,206,45000.88,NULL,NULL),(707,207,15000.99,15500.50,'2026-05-31'),(708,208,27500.13,25000.13,'2026-06-30'),
(709,209,9500.55,9500.55,'2026-07-31'),(710,210,40000.44,NULL,NULL);

CREATE TABLE SALARY_GRADE_SET11(GRADE_ID INT PRIMARY KEY,GRADE_NAME VARCHAR(20),
MIN_SALARY DECIMAL(12,2),MAX_SALARY DECIMAL(12,2));
INSERT INTO SALARY_GRADE_SET11 VALUES(1,'Grade A',0,40000),(2,'Grade B',40000.01,70000),
(3,'Grade C',70000.01,100000),(4,'Grade D',100000.01,200000);

CREATE TABLE TARGET_CUSTOMER_SET11(CUSTOMER_ID INT PRIMARY KEY,CUSTOMER_NAME VARCHAR(80));
INSERT INTO TARGET_CUSTOMER_SET11 VALUES(201,'Aditya Kumar'),(202,'Bhavna Shah'),(203,'Chetan Rao'),
(205,'Eshan Patil'),(207,'Gaurav Joshi'),(209,'Isha Rao');


CREATE TABLE EMPLOYEE_ACTIVITY_SET11(ACTIVITY_ID INT PRIMARY KEY,EMP_ID INT,
ACTIVITY_DATE DATE,ACTIVITY_TYPE VARCHAR(40));
INSERT INTO EMPLOYEE_ACTIVITY_SET11 VALUES(801,101,'2026-08-01','Training'),(802,102,'2026-08-02','Project'),
(803,104,'2026-08-03','Project'),(804,106,'2026-08-04','Review'),(805,108,'2026-08-05','Training'),
(806,110,'2026-08-06','Project'),(807,112,'2026-08-07','Research'),(808,106,'2026-09-01','Project'),
(809,106,'2026-09-05','Review'),(810,101,'2026-09-03','Project');

--SECTION B – 50 SQL QUESTIONS: PREVIOUS TOPICS
--Q21. Display customers from Mumbai, Pune or Delhi whose customer type is not Regular.
select * from CUSTOMER_SET11
where city in ('Mumbai','Pune','Delhi') and CUSTOMER_TYPE <> 'Regular'
--Q22. Display unique cities and the number of customers in each city.
select city city,count(customer_id) [No. of Customer] from CUSTOMER_SET11 
group by city
--Q23. Find the five highest account balances with customer and account details.
select Top 5 * from CUSTOMER_SET11 C join ACCOUNT_SET11 A 
on C.CUSTOMER_ID = A.CUSTOMER_ID
order by A.ACCOUNT_BALANCE desc
--Q24. Find accounts within a supplied balance range.
select * from ACCOUNT_SET11
where ACCOUNT_BALANCE between 40000 and 100000
--Q25. Find customers whose email contains a public email-domain pattern.
select *, coalesce(email,alt_email) as eemail from CUSTOMER_SET11
where  coalesce(email,alt_email) like '%@gmail.com'
--Q26. Identify customers with missing phone or email information.
select *, coalesce(email,alt_email) Email, coalesce(phone,alt_phone) Phone from CUSTOMER_SET11
where coalesce(email,alt_email) is null or coalesce(phone,alt_phone) is null
--Q27. Display accounts ordered by account type and descending balance.
select * from ACCOUNT_SET11
order by ACCOUNT_TYPE,ACCOUNT_BALANCE desc;
--Q28. Calculate total, average, minimum and maximum account balance.
select sum(ACCOUNT_BALANCE) Total,avg(ACCOUNT_BALANCE) Average,min(ACCOUNT_BALANCE) Minimum_Bal,
max(ACCOUNT_BALANCE) Maximum_BAL from ACCOUNT_SET11
--Q29. Calculate account count and total balance by account type.
select count(ACCOUNT_ID) Count,sum(ACCOUNT_BALANCE) TotalBal from ACCOUNT_SET11
group by ACCOUNT_TYPE
--Q30. Return account types whose average balance exceeds the overall average.
select ACCOUNT_TYPE, avg(ACCOUNT_BALANCE) Avg from ACCOUNT_SET11
group by ACCOUNT_TYPE
having avg(ACCOUNT_BALANCE) > (select avg(ACCOUNT_BALANCE) from ACCOUNT_SET11)
--Q31. Display customer, account and transaction details for customers with activity.
select customer_name, account_No,TRANSACTION_ID,TRANSACTION_DATE,TRANSACTION_AMOUNT from CUSTOMER_SET11 C join ACCOUNT_SET11 A 
on C.CUSTOMER_ID = A.CUSTOMER_ID join TRANSACTION_SET11 T
on T.ACCOUNT_ID = A.ACCOUNT_ID
--Q32. Display every customer with account information where available.
select * from CUSTOMER_SET11 C left join ACCOUNT_SET11 A
on C.CUSTOMER_ID = A.CUSTOMER_ID
--Q33. Find customers whose account balance is greater than the average account balance.
select * from ACCOUNT_SET11
where ACCOUNT_BALANCE > (select avg(ACCOUNT_BALANCE) from ACCOUNT_SET11)
--Q34. Find transactions whose amount is greater than the average transaction amount.
select * from TRANSACTION_SET11
where TRANSACTION_AMOUNT > 
(select avg(TRANSACTION_AMOUNT) from TRANSACTION_SET9)
--Q35. Display employees together with their manager names.
select e1.emp_name,e2.emp_name Manager_name from EMPLOYEE_SET11 e1, EMPLOYEE_SET11 e2
where e1.manager_id = e2.emp_id

--Q36. Assign each employee to the correct salary grade.
select E.EMP_ID,E.EMP_NAME,E.SALARY,S.GRADE_ID,S.GRADE_NAME,S.MIN_SALARY,S.MAX_SALARY 
from EMPLOYEE_SET11 E join SALARY_GRADE_SET11 S
on E.SALARY between S.MIN_SALARY and S.MAX_SALARY

select * from SALARY_GRADE_SET11
--Q37. Compare two customer lists and return IDs present only in the first list.
select * from list
--Q38. Find current-year transactions and display year, month name and day.
select *,year(TRANSACTION_DATE) YEAR, datename(month,TRANSACTION_DATE) Month, day(TRANSACTION_DATE) Day 
from TRANSACTION_SET11
where year(TRANSACTION_DATE) = year(getdate())
--Q39. Extract the email domain from customer email addresses.
select *, substring(coalesce(email,alt_email),charindex('@',coalesce(email,alt_email))+1) Email_Domain 
from CUSTOMER_SET11
--Q40. Display a preferred customer contact from available contact columns.
select *, coalesce(phone,alt_phone) Contact from CUSTOMER_SET11
--Q41. Classify accounts into multiple balance categories.
select *, 
case when ACCOUNT_BALANCE > 1000000 then 'High Amount Balance' 
when ACCOUNT_ID > 500000 then 'Medium Balance'
when ACCOUNT_BALANCE >50000 then 'Low Balance'
else 'Very Low Balance'  
end as Account_Categries from ACCOUNT_SET11

--Q42. Calculate payment outstanding amount and derive a payment status.
select *, (AMOUNT_DUE - AMOUNT_PAID) as Outstanding_Amount,
case 
	when (AMOUNT_DUE - AMOUNT_PAID) = '0' then 'Full Payment'
	when (AMOUNT_DUE - AMOUNT_PAID) is null then 'No Payment'
	when (AMOUNT_DUE - AMOUNT_PAID) < 0 then 'Extra payment'
	else 'Partial Payment'
	end from PAYMENT_SET11
--Q43. Find customers who placed more than one order.
select  C.CUSTOMER_ID, C.CUSTOMER_NAME, count(C.customer_id) EMP_Count from CUSTOMER_SET11 C join ORDER_SET11 O 
on C.CUSTOMER_ID = O.CUSTOMER_ID
group by C.CUSTOMER_ID,C.CUSTOMER_NAME
having count(C.customer_id) > 1
--Q44. Find customers whose total order amount exceeds the average customer total.
select C.CUSTOMER_ID,sum(ORDER_AMOUNT) Total from CUSTOMER_SET11 C join ORDER_SET11 O
on C.CUSTOMER_ID = O.CUSTOMER_ID
group by C.CUSTOMER_ID
having sum(ORDER_AMOUNT) > (select avg(order_amount) from ORDER_SET11)
--Q45. Find products that never appeared in an order.
select * from PRODUCT_SET11 P
where not exists (select * from ORDER_SET11 O where P.PRODUCT_ID = O.PRODUCT_ID)
--Q46. Find products that appeared in at least one order.
select * from PRODUCT_SET11 P
where p.PRODUCT_ID =  any(select O.PRODUCT_ID from ORDER_SET11 O)
--Q47. Find employees earning above their department average.
select * from EMPLOYEE_SET11 E join DEPARTMENT_SET11 D on E.DEPT_ID = D.DEPT_ID
where SALARY >= (select avg(salary) from EMPLOYEE_SET11 E join DEPARTMENT_SET11 D on E.DEPT_ID = D.DEPT_ID)

select d.DEPT_ID,avg(salary) from EMPLOYEE_SET11 E join DEPARTMENT_SET11 D on E.DEPT_ID = D.DEPT_ID
group by d.DEPT_ID
--Q48. Find employees earning below their department average.
select * from EMPLOYEE_SET11 E join DEPARTMENT_SET11 D on E.DEPT_ID = D.DEPT_ID
where SALARY < (select avg(salary) from EMPLOYEE_SET11 E join DEPARTMENT_SET11 D on E.DEPT_ID = D.DEPT_ID)
--Q49. Find departments with employees and departments without employees.
select * from DEPARTMENT_SET11 D left join EMPLOYEE_SET11 E
on D.DEPT_ID = E.DEPT_ID
--Q50. Find source customers missing from the target customer table.
select * from CUSTOMER_SET11 C
where not exists (select * from TARGET_CUSTOMER_SET11 T where C.CUSTOMER_ID = T.CUSTOMER_ID)
select * from TARGET_CUSTOMER_SET11
--Q51. Display product prices with an appropriate rounding treatment.
select *, round(price,0) Price from PRODUCT_SET11
--Q52. Display the absolute value of salary adjustments.
select *,abs(SALARY_ADJUSTMENT) Abs_of_Sal_Adj from EMPLOYEE_SET11
--Q53. Display the next whole-number value for each transaction amount.
select *,ceiling(TRANSACTION_AMOUNT) Whole_Price from TRANSACTION_SET11
--Q54. Display the previous whole-number value for each transaction amount.
select *,floor(TRANSACTION_AMOUNT) Whole_Price from TRANSACTION_SET11

--Q55. Calculate square root and square of each credit score.
select * from 
--Q56. Replace missing payment amounts before calculating outstanding amounts.
select *,isnull(AMOUNT_PAID,0) Amount_Paid from PAYMENT_SET11
--Q57. Create a customer contact value from multiple contact columns.
select *, coalesce(phone,alt_phone) Contavt from CUSTOMER_SET11
--Q58. Classify customers based on order totals using multiple conditions.
select C.customer_ID, count(C.customer_ID) Total_Order, 
case when count(C.customer_ID) = 1 then 'buy only on eorder'
when count(C.customer_ID) = 2 then '2 order'
else '3 order'
end as customer_classification
from CUSTOMER_SET11 C join ORDER_SET11 O
on C.CUSTOMER_ID = O.CUSTOMER_ID
group by C.customer_ID
--Q59. Display current-year order dates in a readable formatted representation.
select *, format(ORDER_DATE , 'dd-MM-yyyy') from ORDER_SET11
where year(ORDER_DATE )  = year(getdate())
--Q60. Convert supplied amount and date values to suitable SQL Server data types.
select *,round(ACCOUNT_BALANCE,0) Round_Amt,format(OPENING_DATE,'dd-MMMM-yyyy') from ACCOUNT_SET11
--Q61. Find employees earning more than at least one salary in a selected department.
select * from EMPLOYEE_SET11 E
where SALARY > any(select salary from EMPLOYEE_SET11 e1 join DEPARTMENT_SET11 D 
on D.DEPT_ID = e1.DEPT_ID where  D.DEPT_ID =20  )

--Q62. Find employees earning more than every salary in a selected department.
select * from EMPLOYEE_SET11 E
where SALARY > all(select salary from EMPLOYEE_SET11 e1 join DEPARTMENT_SET11 D 
on D.DEPT_ID = e1.DEPT_ID where  D.DEPT_ID =20  )
--Q63. Find employees earning less than at least one salary in a selected department.
select * from EMPLOYEE_SET11 E
where SALARY < any(select salary from EMPLOYEE_SET11 e1 join DEPARTMENT_SET11 D 
on D.DEPT_ID = e1.DEPT_ID where  D.DEPT_ID =20  )
--Q64. Find employees earning less than every salary in a selected department.
select * from EMPLOYEE_SET11 E
where SALARY < all(select salary from EMPLOYEE_SET11 e1 join DEPARTMENT_SET11 D 
on D.DEPT_ID = e1.DEPT_ID where  D.DEPT_ID =20  )
--Q65. Identify customers with no orders and display available contact information.
select *, coalesce(Email,Phone,ALT_EMAIL,ALT_PHONE) contact from CUSTOMER_SET11 C
where not exists (select * from ORDER_SET11 O where C.CUSTOMER_ID = O.CUSTOMER_ID)
--Q66. Identify products with no sales activity and display stock information.
select * from PRODUCT_SET11 P
where 
select * from EMPLOYEE_SET11
select * from SALARY_GRADE_SET11
select * from EMPLOYEE_ACTIVITY_SET11
--Q67. Find employees with activity records and employees without activity records.
select * from EMPLOYEE_SET11 E1 left join EMPLOYEE_ACTIVITY_SET11 E2
on E1.EMP_ID = E2.EMP_ID
--Q68. Prepare customer order totals and identify customers above the average customer total.
select  c.CUSTOMER_ID,sum(ORDER_AMOUNT) order_total from CUSTOMER_SET11 C join ORDER_SET11 O
on C.CUSTOMER_ID = O.CUSTOMER_ID
group by c.CUSTOMER_ID
having sum(ORDER_AMOUNT) > (select avg(order_amount) from ORDER_SET11) 
--Q69. Prepare department salary statistics and identify employees above their department average.
select * from EMPLOYEE_SET11 E 
where salary > (select avg(salary) from EMPLOYEE_SET11 E1
where E.DEPT_ID = E1.DEPT_ID)
--Q70. Combine customer, account and transaction data and classify customers by total transaction activity.
select * from CUSTOMER_SET11 C join ACCOUNT_SET11 A on C.CUSTOMER_ID = A.CUSTOMER_ID 
join TRANSACTION_SET11 T on T.ACCOUNT_ID  = A.ACCOUNT_ID 

--Q51. Display every employee with a sequential number based on salary descending.
select *, row_number() over(order by SALARY desc) as Sequential_No from EMPLOYEE_SET11

--Q52. Assign a separate sequence to employees within each department by salary descending.
select * ,row_number() over(partition by dept_id order by salary desc) as sequence_No from EMPLOYEE_SET11
--Q53. Rank all employees by salary descending while preserving ties.
select *,rank() over(order by salary desc) as Ranks,
dense_rank() over(order by salary desc) as Dense_Ranks from EMPLOYEE_SET11
--Q54. Rank employees within each department while retaining rank gaps after ties.
select *, rank() over(partition by dept_id order by salary desc) as [Ranks(Retaining gap)] from EMPLOYEE_SET11
--Q55. Rank employees within each department without rank gaps.
select *, dense_rank() over(partition by dept_id order by salary desc) as [Ranks(without Retaining gap)] from EMPLOYEE_SET11

--Q56. Display row number, rank and dense rank together for employee salaries.
select *,
rank() over(order by salary desc) Ranks,
dense_rank() over(order by salary desc) Dense_Ranks,
row_number() over(order by salary desc) Row_Numbers
from EMPLOYEE_SET11 
--Q57. Identify the highest-paid employee from every department.
select *, max(salary) over(partition by dept_id ) from EMPLOYEE_SET11 --this is right to find max between their dept
select *, max(salary) over(order by emp_id ) from EMPLOYEE_SET11 --in this case thet finding the running max sal
select *, max(salary) over(order by dept_id ) from EMPLOYEE_SET11

--Q58. Identify the second-highest-paid employee from every department.
with Rank_Table as
(
select *,dense_rank() over(partition by dept_id 
order by salary desc) as ranks
from EMPLOYEE_SET11)
select *,salary as sec_max_Sal from Rank_Table where ranks=2

select * from (
select *, dense_rank() over(partition by dept_id order by salary desc) as ranks,salary as second_highest_sal
from EMPLOYEE_SET11) as a
where ranks =2

--Q59. Return the top three employees by salary from each department.
select * from (
select  *, ROW_NUMBER()  over(partition by dept_id order by salary) ranks from EMPLOYEE_SET11) as a
where ranks <=3
--Q60. Identify the lowest-paid employee from every department.
select * from 
(select *,min(salary) over(partition by dept_id) from EMPLOYEE_SET11 )
--Q61. Identify the latest order for every customer.

select *,max(order_date) over(partition by c.customer_id) latest_order
from CUSTOMER_SET11 C join ORDER_SET11 O on C.CUSTOMER_ID = O.CUSTOMER_ID  

--select *,min(salary) over(partition by dept_id) from EMPLOYEE_SET11 
--Q62. Identify the first order for every customer.
select *,min(order_date) over(partition by c.customer_id) first_order
from CUSTOMER_SET11 C join ORDER_SET11 O on C.CUSTOMER_ID = O.CUSTOMER_ID
--Q63. Number each customer’s orders chronologically.
select *, row_number() over(partition by customer_id order by order_id) Number from ORDER_SET11 
--Q64. Display each transaction with the immediately previous transaction amount for the same account.
select * from TRANSACTION_SET11
--Q65. Display each transaction with the immediately next transaction amount for the same account.
select * , lead(TRANSACTION_AMOUNT) over(order by transaction_amount) Next_tran from TRANSACTION_SET11

--Q66. Calculate the change between the current and previous transaction amounts.
with PreviousAmou as 
(
select *,lag(TRANSACTION_AMOUNT)  over(order by transaction_amount) PreviousSal
from TRANSACTION_SET11
)
select *, change = TRANSACTION_AMOUNT -PreviousSal from PreviousAmou;

--Q67. Calculate the gap between the current and next transaction amounts.
with PreviousAmou as 
(
select *,lead(TRANSACTION_AMOUNT)  over(order by transaction_amount) NextSal
from TRANSACTION_SET11
)
select *, change = NextSal -TRANSACTION_AMOUNT  from PreviousAmou
--Q68. Display customer order history with previous order date and days since the previous order.
with PreviousTable as (
select C.CUSTOMER_ID,CUSTOMER_NAME,CITY,order_id,PRODUCT_ID,ORDER_AMOUNT,ORDER_DATE,ORDER_STATUS
,lag(ORDER_DATE,1) over(partition by c.customer_id order by order_date) previous_order_date 
from CUSTOMER_SET11 C join ORDER_SET11 O on C.CUSTOMER_ID = O.CUSTOMER_ID
)
select *,datediff(day,previous_order_date,ORDER_DATE) from PreviousTable
--Q69. Display customer order history with next order date and days until the next order.

with Updated_order as
(select *,lead(ORDER_DATE) over(order by order_date) Next_order_date from ORDER_SET11)
select *,datediff(day,order_date,Next_order_date) from Updated_order
--Q70. Find the highest-value order for every customer while retaining required customer detail.
select * , max(order_amount) over(partition by C.customer_id) Highest_Value_Order
from CUSTOMER_SET11 C join ORDER_SET11 O on C.CUSTOMER_ID = O.CUSTOMER_ID
--Q71. Identify duplicate customer business records and retain one preferred record from each duplicate group.
begin tran
with DeleteDuplicate as(
select * from (
select *,row_number() over(partition by customer_id order by customer_id) ranks from CUSTOMER_SET11) as a
where ranks=2)
delete * from DeleteDuplicate 
--Q72. Create an intermediate customer-total result and identify customers above the average total.
select * from
(select *, count(*) over(order by customer_id) count from CUSTOMER_SET11)
where 

--Q73. Create an intermediate department-average result and identify employees above their department average.
select * from (
select *,avg(salary) over(partition by dept_id order by salary desc) Average from EMPLOYEE_SET11 e1) as a
where salary >= (select avg(salary) from EMPLOYEE_SET11 e2 where a.dept_id = e2.dept_id)
--Q74. Prepare departmental employee rankings and return the top two employees per department.
select * from (
select *,row_number() over(partition by dept_id order by salary) ranks from EMPLOYEE_SET11) as a
where ranks <= 2
--Q75. Number customer orders and use the sequence to identify each customer’s first and most recent order.
select * from (select *,ROW_NUMBER() over(partition by c.customer_id order by order_date) number
from CUSTOMER_SET11 C join ORDER_SET11 O on C.CUSTOMER_ID = O.CUSTOMER_ID) as a 
where number==1 ;

--Q76. Prepare transaction history and identify unusually large increases compared with the previous transaction.
with TranHistory as(
select *,lag(transaction_amount) over(partition by account_id order by transaction_date ) previousAmt 
from TRANSACTION_SET11 T 
)
select *,incresCompare =   transaction_amount - previousAmt  from TranHistory

--Q77. Prepare product sales totals and rank products within each category by total sales.
with Totalsales as (
select *,sum(price) over(partition by category,product_name) TotalAmt from PRODUCT_SET11)
select *,ROW_NUMBER() over(partition by category order by TotalAmt desc) ProductRank from Totalsales;

select * from PRODUCT_SET11;

--Q78. Prepare monthly customer order totals and compare each month with the customer’s previous month.
with PreviosT as(
select *,row_number()  over(partition by customer_id order by order_Date) ranks ,
lag(ORDER_AMOUNT) over(partition by customer_id order by order_Date) previous_amt from ORDER_SET11) 
select *,Comparision = order_amount - previous_amt  from PreviosT;

--below is correct
with MonthlyCust as (
select CUSTOMER_ID,year(order_date) as order_year ,
month(order_date) as order_month ,
sum(ORDER_AMOUNT) Total from ORDER_SET11
group by CUSTOMER_ID ,year(order_date) ,month(order_date)
),
previousMonth as(
select *,lag(Total) over(partition by customer_id order by order_year,order_month) previousMonth from MonthlyCust
)
select *,comparision = Total - previousMonth from previousMonth
--Q79. Prepare employee activity history and identify the latest activity record for every employee.
select *,max(activity_date) over(partition by e2.emp_id order by e2.emp_id ) latest_activity_record
from EMPLOYEE_SET11 e1 join EMPLOYEE_ACTIVITY_SET11 e2 on e1.EMP_ID = e2.EMP_ID
select * from EMPLOYEE_ACTIVITY_SET11

select * from EMPLOYEE_ACTIVITY_SET11

--Q80. Create a multi-step analytical result showing customer totals, city rank, previous customer total in the 
--city and the difference from that previous customer.

select 60*60
select 3600/60
select 60/60
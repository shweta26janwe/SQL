use company

CREATE TABLE EMPP (
    EMP_ID INT PRIMARY KEY,
    EMP_NAME VARCHAR(50),
    CITY VARCHAR(50),
    EMP_SAL INT,
    EMP_DEPT VARCHAR(50)
);

INSERT INTO EMPP (EMP_ID, EMP_NAME, CITY, EMP_SAL, EMP_DEPT)
VALUES
(1, 'Amit', 'Pune', 50000, 'IT'),
(2, 'Neha', 'Mumbai', 60000, 'HR'),
(3, 'Rahul', 'Pune', 45000, 'IT'),
(4, 'Priya', 'Nashik', 70000, 'Finance'),
(5, 'Sneha', 'Mumbai', 55000, 'HR'),
(6, 'Karan', 'Pune', 80000, 'IT'),
(7, 'Pooja', 'Nashik', 65000, 'Finance'),
(8, 'Rohan', 'Mumbai', 40000, 'IT');


CREATE TABLE DEPARTMENTP (
    DEPT_ID INT PRIMARY KEY,
    DEPT_NAME VARCHAR(50)
);

INSERT INTO DEPARTMENTP (DEPT_ID, DEPT_NAME)
VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Finance'),
(4, 'Marketing');

CREATE TABLE CUSTOMERSP (
    CUSTOMER_ID INT PRIMARY KEY,
    CUSTOMER_NAME VARCHAR(50),
    CITY VARCHAR(50)
);

INSERT INTO CUSTOMERSP (CUSTOMER_ID, CUSTOMER_NAME, CITY)
VALUES
(1, 'Asha', 'Pune'),
(2, 'Vikram', 'Mumbai'),
(3, 'Meera', 'Nashik'),
(4, 'Arjun', 'Pune'),
(5, 'Kavya', 'Mumbai');

CREATE TABLE ORDERSP (
    ORDER_ID INT PRIMARY KEY,
    CUSTOMER_ID INT,
    ORDER_DATE DATE,
    AMOUNT INT,
    FOREIGN KEY (CUSTOMER_ID)
        REFERENCES CUSTOMERSP(CUSTOMER_ID)
);

INSERT INTO ORDERSP (ORDER_ID, CUSTOMER_ID, ORDER_DATE, AMOUNT)
VALUES
(101, 1, '2026-01-05', 2000),
(102, 2, '2026-01-10', 3500),
(103, 1, '2026-02-15', 1500),
(104, 3, '2026-02-20', 4000),
(105, 2, '2026-03-01', 2500),
(106, 4, '2026-03-10', 5000);

SELECT * FROM EMPP;

SELECT * FROM DEPARTMENTP;

SELECT * FROM CUSTOMERSP;

SELECT * FROM ORDERSP;

--Find the average salary of employees in each department. Display only departments 
--whose average salary is greater than 55,000.
select EMP_DEPT,avg(EMP_SAL) Avg_SAl from EMPP
group by EMP_DEPT
having avg(EMP_SAL)>55000
--Find cities having more than two employees. Display the city 
--and employee count.
select city, count(*) as EMP_Count from EMPP
group by city
having count(*) > 2
--Find employees whose salary is greater than the overall 
--average salary.
select * from EMPP
where Emp_Sal > (select avg(EMP_SAL) from EMPP)
--Find the second-highest distinct salary from the EMP
--table without using TOP.
select  max(EMP_SAL) from EMPP where 
EMP_SAL < (
select max(EMP_SAL) from EMPP)

INSERT INTO EMPP (EMP_ID, EMP_NAME, CITY, EMP_SAL, EMP_DEPT)
VALUES (9, 'karuna', 'Pune', 80000, 'IT');
--Using a CTE, find employees earning 
--more than the average salary of their own department.
select * from EMPP E1
where  EMP_SAL > (select avg(EMP_SAL) from EMPP E2 where E1.EMP_DEPT = E2.EMP_DEPT)

--using CTE
with AVGT as
(select EMP_DEPT,avg(EMP_SAL) avg_EMP from EMPP
group by EMP_DEPT
)
select E2.* from EMPP E2 join AVGT E1 on E1.EMP_DEPT = E2.EMP_DEPT
where EMP_SAL > avg_EMP
--Rank employees by salary within each department, 
--from highest to lowest. Display employee name, 
--department, salary, and rank.
select EMP_NAME, EMP_DEPT,EMP_SAL, rank() over(partition by EMP_DEPT order by EMP_SAL DESC) rank from EMPP

--Use LAG() to display each employee's salary alongside the previous employee's salary 
--when employees are ordered by EMP_ID.
select *, lag(EMP_SAL) over(order by EMP_ID) PRev_SAL from EMPP

--Find cities that have at least two employees. --Display each city and its number of employees.
select city,count(*) EMP_COUNT from EMPP group by city
having count(*) >=2
select * from DEPARTMENTP
select * from EMPP

--Display every department and its employee count, including departments with zero employees.
select D.DEPT_NAME,count(E.EMP_ID) EMP_COUNT
from EMPP E right join DEPARTMENTP D on E.EMP_DEPT = D.DEPT_NAME
group by D.DEPT_NAME

--Find customers who have never placed an order.
select * from CUSTOMERSP c
where not exists (select 1 from OrdersP o where c.CUSTOMER_ID=o.CUSTOMER_ID)

select * from ordersP 
select * from customersP
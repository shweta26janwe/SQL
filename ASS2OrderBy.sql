use company;



CREATE TABLE EMPLOYEE_DETAIL
(EMP_ID INT,
EMP_NAME VARCHAR(50),
EMP_CITY VARCHAR(20),
EMP_SAL INT,
EMP_DOJ DATE,
EMP_EMAIL VARCHAR(100)
);

INSERT INTO EMPLOYEE_DETAIL VALUES 
(1, 'Mohit', 'PUNE', 3000, '2021-01-14', 'mohit@gmail.com'),
(2, 'Sumit', 'MUMBAI', 3500, '2021-03-01', 'sumit@gmail.com'),
(3, 'Shital', 'DELHI', 3000, '2022-05-11', NULL),
(4, 'Priyanka', 'NAGPUR', 4000, '2021-08-14', 'priyanka@gmail.com'),
(5, 'Praveen', 'HYDERABAD', 5500, '2020-05-28', 'praveen@gmail.com'),
(6, 'Rajesh', 'KOTA', 6500, '2022-07-14', NULL),
(7, 'Rohit', 'KOTA', 4500, '2022-09-14', 'rohit@gmail.com'),
(8, 'Sumita', 'WARDHA', 2800, '2023-01-14', 'sumita@gmail.com'),
(9, 'Amit', 'PUNE', 5200, '2022-12-10', NULL),
(10, 'Ankit', 'MUMBAI', 7200, '2023-02-18', 'ankit@gmail.com'),
(11, 'Sneha', 'NAGPUR', 4800, '2022-11-25', 'sneha@gmail.com'),
(12, 'Raj', 'KOTA', 6500, '2023-01-10', 'raj@gmail.com'),
(13, 'Neha', 'DELHI', 3900, '2021-06-15', NULL),
(14, 'Vikas', 'PUNE', 6100, '2020-11-20', 'vikas@gmail.com'),
(15, 'Pooja', 'MUMBAI', 4400, '2022-04-18', 'pooja@gmail.com'),
(16, 'Rakesh', 'HYDERABAD', 5700, '2021-12-05', NULL),
(17, 'Kiran', 'NAGPUR', 3200, '2023-03-12', 'kiran@gmail.com'),
(18, 'Meena', 'KOTA', 7000, '2020-08-25', 'meena@gmail.com'),
(19, 'Suresh', 'PUNE', 3600, '2021-09-17', NULL),
(20, 'Nitin', 'MUMBAI', 4900, '2022-10-11', 'nitin@gmail.com'),
(21, 'Rahul', 'PUNE', NULL, '2023-04-20', 'rahul@gmail.com'),
(22, 'Riya', 'NAGPUR', NULL, '2022-06-18', NULL),
(23, 'Ramesh', 'KOTA', 5800, NULL, 'ramesh@gmail.com'),
(24, 'Sunita', 'DELHI', 4200, NULL, NULL);

/*
Q1. IS NULL – Salary Investigation
Display employees whose EMP_SAL is NULL. Display EMP_ID, EMP_NAME, EMP_CITY and EMP_SAL.*/
SELECT EMP_ID, EMP_NAME, EMP_CITY, EMP_SAL FROM EMPLOYEE_DETAIL WHERE EMP_SAL IS NULL

/*
Q2. IS NOT NULL – Salary Validation
Display employees whose salary is available (not NULL) and whose salary is greater than 4000. Display EMP_ID, EMP_NAME, EMP_SAL and EMP_EMAIL.*/
SELECT  EMP_ID, EMP_NAME, EMP_SAL, EMP_EMAIL  FROM EMPLOYEE_DETAIL WHERE EMP_SAL IS NOT NULL AND EMP_SAL > 4000;

/*Q3. NULL + OR Challenge
Display employees who have either a NULL salary OR a NULL email address. Display EMP_ID, EMP_NAME, EMP_CITY, EMP_SAL and EMP_EMAIL.*/
SELECT EMP_ID,EMP_NAME,EMP_CITY,EMP_SAL,EMP_EMAIL FROM EMPLOYEE_DETAIL WHERE EMP_SAL IS NULL OR EMP_EMAIL IS NULL;

/*Q4. NULL + Date Condition
Display employees whose joining date is NULL OR whose joining date is on or after 2022-01-01. Display EMP_ID, EMP_NAME, EMP_DOJ and EMP_SAL.*/
SELECT EMP_ID, EMP_NAME, EMP_DOJ, EMP_SAL FROM EMPLOYEE_DETAIL WHERE EMP_DOJ IS NULL OR EMP_DOJ >='2022-01-01'; 

/*Q5. LIKE – Name Pattern
Display employees whose names start with the letter 'R'. Display EMP_ID, EMP_NAME, EMP_CITY and EMP_SAL. Use LIKE.8*/
SELECT  EMP_ID,EMP_CITY,EMP_NAME,EMP_SAL FROM EMPLOYEE_DETAIL WHERE EMP_NAME LIKE 'R%';

/*Q6. LIKE – City Pattern
Display employees whose city name contains the letter 'A'. Display EMP_ID, EMP_NAME and EMP_CITY. Use LIKE.*/
SELECT EMP_ID,EMP_NAME,EMP_CITY,EMP_SAL FROM EMPLOYEE_DETAIL WHERE EMP_CITY LIKE '%A%';

/*Q7. LIKE + Salary Condition
Display employees whose names end with the letter 't' and whose salary is greater than 3000. Use LIKE and AND.*/
SELECT * FROM EMPLOYEE_DETAIL WHERE EMP_NAME LIKE '%T' AND EMP_SAL > 3000;

/*Q8. LIKE + IN + NOT NULL
Display employees whose names start with 'S' or 'R', whose city is one of PUNE, KOTA or NAGPUR, and whose salary is NOT NULL. Use LIKE, OR, IN, AND and IS NOT NULL.*/
SELECT * FROM EMPLOYEE_DETAIL WHERE EMP_NAME LIKE '[SR]%' AND EMP_CITY IN ('PUNE','KOTA','NAGPUR') AND EMP_SAL IS NOT NULL;

/*Q9. ORDER BY – Salary
Display all employees whose salary is NOT NULL. Show EMP_ID, EMP_NAME, EMP_CITY and EMP_SAL. Sort the result by salary from highest to lowest using ORDER BY.*/
SELECT EMP_ID, EMP_NAME, EMP_CITY, EMP_SAL FROM EMPLOYEE_DETAIL WHERE EMP_SAL IS NOT NULL ORDER BY EMP_SAL DESC;

/*Q10. ORDER BY – Multiple Columns
Display employees from PUNE, MUMBAI and KOTA whose salary is greater than 3000. Sort first by EMP_CITY in ascending order and then by EMP_SAL in descending order.*/
SELECT * FROM EMPLOYEE_DETAIL WHERE  EMP_SAL > 3000 AND EMP_CITY IN ('PUNE','MUMBAI','KOTA') ORDER BY EMP_CITY , EMP_SAL DESC;

/*Q11. ORDER BY – Calculated Column
Display employees whose salary is between 3500 and 6500. Calculate ANNUAL_SALARY = EMP_SAL * 12. Sort the result by ANNUAL_SALARY from highest to lowest. 
Use a column alias for the calculation.*/
SELECT *,ANNUAL_SALARY = EMP_SAL * 12 FROM EMPLOYEE_DETAIL WHERE EMP_SAL BETWEEN 3500 AND 6500 ORDER BY ANNUAL_SALARY DESC;


/*Q12. Moderate NULL + LIKE + ORDER BY
Display employees who have a non-NULL email address, whose name starts with 'R', and whose salary is NOT NULL. 
Display EMP_ID, EMP_NAME, EMP_SAL and EMP_EMAIL. Sort by EMP_NAME in ascending order.*/
SELECT EMP_ID, EMP_NAME, EMP_SAL,EMP_EMAIL FROM EMPLOYEE_DETAIL WHERE EMP_EMAIL IS NOT NULL AND EMP_NAME LIKE 'R%' AND EMP_SAL IS NOT NULL ORDER BY EMP_NAME ASC;

/*Q13. Complex Filtering + ORDER BY
Display employees who are from PUNE, KOTA or NAGPUR, have salary between 3500 and 6500, and have a non-NULL joining date.
Exclude employee IDs 4 and 12. Sort by salary descending.*/
SELECT * FROM EMPLOYEE_DETAIL WHERE EMP_CITY IN ('PUNE','KOTA','NAGPUR') AND EMP_ID NOT IN ('4','12') AND EMP_SAL BETWEEN 3500 AND 6500  AND EMP_DOJ IS NOT NULL ORDER BY EMP_SAL DESC;

/*Q14. Business Requirement – Bonus List
Identify employees eligible for a bonus: salary is NOT NULL; salary is between 4000 and 7000; city is PUNE, KOTA or MUMBAI; email is NOT NULL.
Calculate BONUS = EMP_SAL * 15 / 100 and FINAL_SALARY = EMP_SAL + BONUS. Sort by FINAL_SALARY descending.*/
SELECT *,BONUS =EMP_SAL * 15/100,FINAL_SALARY = EMP_SAL + EMP_SAL * 15/100  FROM EMPLOYEE_DETAIL WHERE EMP_SAL IS NOT NULL AND EMP_SAL BETWEEN 4000 AND 7000 AND EMP_CITY IN ('PUNE','KOTA','MUMBAI') AND EMP_EMAIL IS NOT NULL
/*Q15. FINAL CHALLENGE – Employee Search & Ranking
Write one query that displays employees satisfying all the following conditions:
•	EMP_SAL is NOT NULL and EMP_DOJ is NOT NULL.
•	Salary is between 3500 and 7000.
•	City is PUNE, KOTA, NAGPUR or MUMBAI.
•	Name starts with either 'R' or 'S'.
•	Employee ID is even.
•	Email is NOT NULL.
•	Calculate ANNUAL_SALARY = EMP_SAL * 12.
•	Calculate BONUS = EMP_SAL * 20 / 100.
•	Calculate FINAL_SALARY = EMP_SAL + BONUS.
•	Display EMP_ID, EMP_NAME, EMP_CITY, EMP_SAL, EMP_DOJ, EMP_EMAIL, ANNUAL_SALARY, BONUS and FINAL_SALARY.
•	Sort FINAL_SALARY descending and EMP_NAME ascending.
 
*/
 
SELECT EMP_ID, EMP_NAME, EMP_CITY, EMP_SAL, EMP_DOJ, EMP_EMAIL, ANNUAL_SALARY = EMP_SAL * 12 , BONUS =EMP_SAL * 20 / 100 , FINAL_SALARY =EMP_SAL +EMP_SAL * 20 / 100 FROM EMPLOYEE_DETAIL WHERE EMP_DOJ  IS NOT NULL AND EMP_SAL IS NOT NULL AND EMP_SAL BETWEEN 3500 AND 7000 AND EMP_CITY IN ('PUNE','KOTA','NAGPUR','MUMBAI') 
AND EMP_ID % 2 = 0 AND EMP_EMAIL IS NOT NULL AND  EMP_NAME LIKE '[RS]%'  ORDER BY EMP_NAME , FINAL_SALARY DESC
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
--SECTION B – 15 QUESTIONS: CASE, COALESCE AND PREVIOUS TOPICS
--Q11. Display each employee's name, department and a derived employment category based on salary range.
use bank;
select * from EMPLOYEE_SET9
select * from DEPARTMENT_SET9
select E.EMP_NAME,D.DEPT_NAME,E.SALARY, CASE WHEN E.SALARY <= 500000 THEN 'FRESHER'
WHEN E.SALARY BETWEEN 500000 AND 1000000 THEN 'EXPERIENCED' 
ELSE 'WELL EXPERIENCED' 
END AS EMP_CATEGORY from EMPLOYEE_SET9 E LEFT JOIN DEPARTMENT_SET9 D
ON E.DEPT_ID = D.DEPT_ID

--Q12. Display each employee's name and a derived performance label based on performance score.
select * from EMPLOYEE_SET9
SELECT * FROM CREDIT_SCORE_SET9
--SELECT * FROM EMPLOYEE_SET9 E LEFT JOIN CREDIT_SCORE_SET9 C
--ON E.EMP_ID = C.
SELECT * FROM SALARY_GRADE_SET9

--Q13. Display each customer's name and one preferred contact value using the available contact details.
SELECT CUSTOMER_NAME,COALESCE(EMAIL,PHONE,ALT_EMAIL,ALT_PHONE) CONTACT FROM CUSTOMER_SET9
SELECT CUSTOMER_NAME,COALESCE(PHONE,ALT_PHONE) CONTACT FROM CUSTOMER_SET9

--Q14. Display each product's name, category and a derived stock status based on current stock quantity.
SELECT * FROM BALANCE_ADJUSTMENT_SET9
--Q15. Display each order's order ID, amount and a derived order-size classification using multiple amount ranges.

--Q16. Find employees whose salary is greater than the average salary of all employees.
--Q17. Find customers whose total order value is greater than the average total order value across customers.
--Q18. Display departments together with the number of employees belonging to each department.
--Q19. Display all employees and their department names, including employees whose department relationship is missing.
--Q20. Find products whose price falls within the range represented by the supplied product-price data.
--Q21. Find customers whose email addresses belong to the supplied email domain pattern.
--Q22. Display the current year's orders with the order year, month name and day.
--Q23. Display employee names in uppercase and extract the domain portion from their email addresses.
--Q24. Display each employee's salary rounded to two decimal places and also show the absolute value of the salary adjustment.
--Q25. Using employee and department data, display employees with their department name and classify their salary into meaningful categories.
--SECTION C – 10 QUESTIONS: CORRELATED SUBQUERY, EXISTS, NOT EXISTS, ANY AND ALL
--Q26. Find employees whose salary is greater than the average salary of their own department.
--Q27. Find employees whose salary is less than the average salary of their own department.
--Q28. Find employees who earn the highest salary within their own department.
--Q29. Find employees who earn the lowest salary within their own department.
--Q30. Find departments that have at least one employee.
--Q31. Find departments that currently have no employees.
--Q32. Find customers who have placed at least one order.
--Q33. Find customers who have never placed an order.
--Q34. Find products that have at least one order associated with them.
--Q35. Find products that have never appeared in an order.
--SECTION D – 5 QUESTIONS: ANY AND ALL
--Q36. Find employees whose salary is greater than at least one salary in the HR department.
--Q37. Find employees whose salary is greater than every salary in the HR department.
--Q38. Find employees whose salary is lower than at least one salary in the IT department.
--Q39. Find employees whose salary is lower than every salary in the IT department.
--Q40. Compare employee salaries with salaries in a selected department and produce a result that clearly distinguishes employees exceeding at least one comparison value from employees exceeding every comparison value.
--SECTION E – 5 INTEGRATED CHALLENGE QUESTIONS
--Q41. Using the supplied customer and order data, identify customers with no related orders and display an appropriate contact value using the available contact columns.
--Q42. Using employee and department data, identify employees whose salary is above their department average and classify the result into meaningful salary bands.
--Q43. Using product and order data, identify products that have no related orders and classify each product based on its current stock level.
--Q44. Find source customer records for which no corresponding target customer record exists.
--Q45. Build one integrated query using the supplied tables that combines conditional classification, NULL handling, a row-dependent comparison, an existence check and a set-based salary comparison.

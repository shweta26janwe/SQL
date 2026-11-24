use company;

create table Employee(
EMP_ID tinyint,
EMP_NAME varChar(500),
EMP_CITY varchar(100),
EMP_DOJ datetime,
EMP_SAL decimal
);


--single row insert
insert into Employee values (1,'priti','pune', '2025-02-23 10:45:45:000', 3000.78)

--multiple rows insert
insert into Employee values (2,'shweta', 'Nagpur' , '2025-02-23 10:45:45:000', 456.89),
(3,'snehal', 'chandrapur' , '2025-02-23 10:45:45:000', 6756.89),
(4,'shruti', 'nanded' , '2025-05-01 10:45:45:000', 4506.89),
(5,'sanket', 'ranchi' , '2025-03-12 10:45:45:000', 3556.89)

select * from Employee

SP_HELP Employee;



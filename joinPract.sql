use company;

create table student(
s_id int primary key,
s_name varchar(30),
s_city varchar(20),
dept_id int
)

create table department(
d_id int,
d_name varchar(20))

alter table department alter column d_name varchar(30);

--now we want to join the table
insert into student values
(1,'sushant','pune',2),
(2,'radhika','nagpur',null),
(3,'ketan','ranchi',3)

insert into department values
(1,'hr'),
(2,'finance'),
(3,'sales')
select * from student;
select * from department;

--1.inner join/join
--2.outer join
----a.left outer join/left join
----b.right outer join / right join
----c.full outer join/ full join

--1.inner join
--only gives matching records
syntax :
select * from table1_name t1 inner join/join table2_name t2 on t1.common_clumn = t2.common_column

select * from student S inner join department D on S.dept_id = D.d_id 


--2.a.left outer join
--all left record and matched right record and which are not matched are replace with null
syntax :
select * from table1_name t1 left outer join / left join table2_name t2 on t1.common_clumn = t2.common_column;

select * from student S left outer join department D on S.dept_id = D.d_id 

--2.b. right outer join/right
--all right record and matched left record and which are not matched are replace with null
syntax :
select * from table1_name t1 right outer join/ right join table2_name t2 on t1.common_clumn = t2.common_column;

select * from student S right outer join department D on S.dept_id = D.d_id 

--2.c. full outer join/full join
--all right record and  left record and which are not matched are replace with null
syntax :
select * from table1_name t1 full outer join / full join  table2_name t2 on t1.common_clumn = t2.common_column;

select * from student S full outer join department D on S.dept_id = D.d_id 




Q.1 can we convert outer join into inner join
--yes, its possible beacause outer join caotains the matched and also extra record and we want only match record
select * from student S full outer join department D on S.dept_id = D.d_id where S.dept_id <> null

Q.2 suppose we have table
create table A(
id int )
create table B(
id int)

insert into A values (1),(1),(1)
select * from A

insert into B values (1),(1),(1)
select * from B

--Now we want to join this table .imagine how many record in inner join
so we see this now

select * from A join B on A.id = B.id
--it gives 9 record . why 9 ? because in join they give the result of cross product + condition mean for first 1 of A they with the all
--3 record of B , for second 1 of they cross with all 1 of B and so on therefore, in A their are 3 row and in B their 3 row so record = 3*3 =9


select * from A left join B on A.id = B.id
select * from A right join B on A.id = B.id
select * from A full join B on A.id = B.id


create table C(
id int)
create table D (
id int)
insert into C values
(1) ,(null) ,(2)
insert into D values
(1),(2)
select * from C;
select * from D;

select * from C join D on C.id = D.id
select * from C left join  D on C.id = D.id
select * from C right join D  on C .id = D.id
select * from C full join  D on C.id = D.id


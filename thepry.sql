--PART A – 20 THEORETICAL QUESTIONS
--Q1. What is a duplicate record?
the record which  include the same data in more than 1 rows
--Explain when two rows can be considered duplicate records in a table.
if in a table their are 2 entries of (1,'kasat','pune') the this table include the duplicate record

--Q2. How can duplicate records be identified?
--Explain the GROUP BY + COUNT(*) + HAVING COUNT(*) > 1 approach.
to find the duplicate record in a table we have query whivh include group by, having, and count
select emp_id from empd group by emp_id having count(*) > 1
--Q3. Primary Key
--What is a Primary Key? Explain why a Primary Key cannot contain duplicate values and NULL values.
primary key is one of the kry in a sql which is used to define the column constraints which allow you to enterd only unique and not null values
for that particular column.PK key must be unique and not null to avoid the duplicate records and null values

--Q4. Primary Key vs UNIQUE Key
--Write at least three differences between Primary Key and UNIQUE Key based on the concepts covered.
primary key 1.it must be unique and not null 2,it does not allow you to enter null values 3.
unique key 1.it must be uniuqe 2,it allow you ti null values ones

--Q5. Foreign Key
--What is a Foreign Key? Explain the Parent–Child relationship and referential integrity.
foreign key is crete the relationship between the table . it allow you the create rel between parent to child .when we need a reference 
from parent to chilid then we first defuine pk in parent then we include  that refence in child table 
id int foreign key references parent(p_id)

--Q6. Foreign Key and NULL
--Can a Foreign Key column contain NULL values? Explain with a simple example.
use company;
yes,foreign key value can caontain null vaues in the case of we dont want to relate that row to parent column.
create table dept1(d_id int primary key, d_name varchar(30))
create table stu1(id int primary key, d_id int foreign key references dept1(d_id))
in this case stu d_id references to the dept d_id .
if one of the student have not alloted any dept then we insert null in their d_id column
insert into stu1 values (1,null)
--Q7. NOT NULL Constraint
--What is the purpose of the NOT NULL constraint? What happens when a required value is not supplied?
not null constarints allow user to insert not null values mean we cant insert null in that column.
suppose if name has a not null constraint then we need to pass name .
if we not supplied any value then we get error of this column has a not null constraints

--Q8. UNIQUE Constraint
--What is the purpose of a UNIQUE constraint? Why is it useful for business fields such as email or mobile number?
Unique constarints allow user to inserrt only unique values not a duplicate value.
in businaess feild it widely used for eamil or mobile no. because we know that eamil and no. are always differet for diff user so to avoid same user
--Q9. DEFAULT Constraint
--What is a DEFAULT constraint? Explain when the default value is applied during INSERT.
default constraint allow user to pass default value at the time of craeting table. so when we insert the data at that if we not pass any value for 
that col then it automatically assign the default value to them

--Q10. CHECK Constraint
--What is a CHECK constraint? Give two examples of business rules that can be enforced using CHECK.
check constraints is used to check the condition when user insert data.we define the column for check at time creating table.
if any business want the emp they have age > 20 then in that case we use check constarints for age column like
age int check age>20
or if they want > 4 year exp people in that case they use this for experience col so 
wheen we try to insert  <=  4 exp people then it showing the error of condition not satisfy
--Q11. IDENTITY / Auto Increment
--What is an IDENTITY column in SQL Server? Explain the meaning of IDENTITY(start, increment).
identity columns used to  increment the value automatically .
suppose in the case of account no. it aatomaticaaly increment no by one . in that case they define account no  column to
acc_no char(15) identity(12345763778, 1) mean acc start from 12345763778 and it autimatically incr by 1 when user insert
--Q12. IDENTITY_INSERT
--Why can an explicit value normally not be inserted into an IDENTITY column? What is IDENTITY_INSERT used for?
we aready define that col for auto increment so their manual insert operation are off.
so if user fail to insert data because of some issue then we need to on the identitty insert then we are able to insert explicit value
syntax: set identity_insert on
insert into table_name values ( col1,col2)

--Q13. Table Backup
--How can SELECT INTO be used to create a table backup? What is created automatically?
syntax : select * into new_bkp_table_name from exist_table 
when we need backup table we use this syntax so we backup the exist_table data into the table new_bkp_table_name which created automatically


--Q14. Copying Structure Only
--Explain why WHERE 1 = 2 can be used while copying only the structure of a table.
where 1=2 it is the condition which return false so only structure of the data are copied.
syntax:select * into copy_table from src_table where 1=2
--Q15. Copying Data Between Tables
--Explain INSERT INTO ... SELECT and the requirement for source and target columns.
syntax : select * into copy_table from src_table where 1=1

select * from exist_table where emp_dept = 'hr'
select * into new_table select * from exist_table where emp_dept = 'hr'

insert into new_table select * from exist_table where emp_dept = 'hr'
--Q16. INFORMATION_SCHEMA
--What is INFORMATION_SCHEMA? What is meant by metadata or 'data about data'?
information_schema have the metadata which access by the user whenever they want. it include all databases, schemas,tables,triggers all info of this
are store in the information_schema

--Q17. DML vs DDL
--Differentiate DML and DDL statements with examples.
DML is data manupulation lang , it include operations like select,update,insert,delete, it perform operation with the data which store in the table
for ex. if we want to update the city then it allow you update that row by using the update keyword
DDL id data defination lang, it includes operatons like drop,rename,create,alter,truncate, this operation perform on the structure of table 
for ex, if we want create table, db then it possible with the help of create opt, drop used to delete the table without its stucture.
this are not manupulate with the data
--Q18. DELETE vs TRUNCATE vs DROP
--Compare DELETE, TRUNCATE and DROP in terms of data, table structure and usage.
delete is used to delete the table, rows, columns,without delecting the stucture, it perform row by row
truncate is used to delete the table, it perform within the fraction of second,
drop is used to delete the entire data with structure

--Q19. UPDATE Statement Risk
--Why should a WHERE condition be used carefully with UPDATE? What can happen if it is omitted?
update column = value where condition
where condition is used carefuly with update because if omitted that it update the all data

--Q20. ALTER TABLE
--List the major operations that can be performed using ALTER TABLE based on today's covered topics.
alter has many operations
1.used to add the column
alter table table_name add col_name <data_type>
2.used to drop the column
alter table table_name drop column
alter table table_name delete column
3.used update the column data type
alter table table_name alter column_name <data_type>
4.used increse or decrease the size of data type
alter table table_name alter col_name <data_type> #its possible based on condition

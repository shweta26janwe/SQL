--FUNCTIONS
--1.len
declare @a char(10)
set @a = 'shweta'
select len(@a)
select datalength(@a)
--2.datalength
declare @b varchar(10)
set @b = 'shweta'
select len(@b)
select datalength(@b)
--3.substring
declare @str varchar(30)
set @str = 'shweta@gmail.com'
select substring(@str, 2,7)
select substring(@str,charindex('@',@str),4)
select substring(@str,charindex('@',@str)+1,(len(@str)-3) - 
CHARINDEX('@',@str)-1)  --subtring(@str,7,14)  i.e @+14

select (len('shweta@gmail.com')-3) - CHARINDEX('@','shweta@gmail.com')
--16-x= 6
--x =10

--4.patindex
select patindex('%.com%','shweta@gmail.com')

--5.Replace
select REPLACE('shweta@gmail.com','gmail','infosys')

--5.replicate
select REPLICATE('HII',100)

--6.
select REVERSE('good')
--7.char
select char(65)
select char(1241)
--8.ascii
select ascii('a')





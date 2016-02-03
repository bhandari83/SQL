----create database 
create database trydatabase

---creeate table employee
create
table employee
(
ID int,
name nvarchar (10),
salary int,
start_date datetime,
city nvarchar (10),
region char (1))

select*from employee

---insert value into emp..table

insert
into employee (ID, name, salary, start_date, city, region)
values (1, 'Jason', 40420, '02/01/94', 'New York', 'W'),
(2, 'Robert',14420, '01/02/95', 'Vancouver','N'),
(3, 'Celia', 24020, '12/03/96', 'Toronto', 'W'),
(4, 'Linda', 40620, '11/04/97', 'New York', 'N'),
(5, 'David', 80026, '10/05/98', 'Vancouver','W'),
(6, 'James', 70060, '09/06/99', 'Toronto', 'N'),
(7, 'Alison',90620, '08/07/00', 'New York', 'W'),
(8, 'Chris', 26020, '07/08/01', 'Vancouver','N'),
(9, 'Mary', 60020, '06/09/02', 'Toronto', 'W')

-----union all name starts with C and A
select Id,name from employee where name like 'c%'
union all
select Id,name from employee where name like 'A%'

--- drop table 
drop table employee

---create table employee and insert values
create table employee
(
ID int,
name nvarchar (10),
salary int,
start_date datetime,
city nvarchar (10),
region char (1)
)

insert
into employee (ID, name, salary, start_date, city, region)
values (1, 'Jason', 40420, '02/01/94', 'New York', 'W'),
(2, 'Robert',14420, '01/02/95', 'Vancouver','N'),
(3, 'Celia', 24020, '12/03/96', 'Toronto', 'W'),
(4, 'Linda', 40620, '11/04/97', 'New York', 'N'),
(5, 'David', 80026, '10/05/98', 'Vancouver','W'),
(6, 'James', 70060, '09/06/99', 'Toronto', 'N'),
(7, 'Alison',90620, '08/07/00', 'New York', 'W'),
(8, 'Chris', 26020, '07/08/01', 'Vancouver','N'),
(8, 'Chris', 60020, '06/09/02', 'Toronto', 'W')


select * from employee

--union will not show dup value whereas unian all would.
select Id,name from employee where name like 'c%'
union
select Id,name from employee where name like 'A%'

Drop table Employee

------create table insert value and use sub query
create table Employee
( EmpId int,
Ename varchar(50),
ManagerId int
)

Insert into Employee
values(1,'Jason',3),
(2, 'Robert',4),
(3, 'Celia',5),
(4, 'Linda', 5),
(5, 'David', 8),
(6, 'James', 7),
(7, 'Alison',9),
(8, 'Chris',7),
(9, 'Mary', 7)

select *from Employee

--- write a SubQuery to find names of all the managers in Employee table 
Select Ename as ManagerName from Employee
where EmpId in(select distinct ManagerId from Employee)

select *from Employee
create database selfjoindemo
use selfjoindemocreate table product
(
ProductId int not null,
CustId int not null,
ProductName varchar (100),
Price float,
Qty int,
)
----create table product
create table product
(
ProductId int not null,
CustId int not null,
ProductName varchar (100),
Price float,
Qty int,
)
-----insert data into table product
insert into product
values (112,2,'Nuts',10.50,30),
(222, 5,'Bolts', 15.00, 20),
(333, 3,'Screws', 10.50, 15),
(444, 2,'Bearings', 15.00, 25),
(555, 6,'Lights', 10.50, 5),
(666, 3,'Glass', 15.00, 7);

select *from product
------Selecting Products that have same price using self join
select distinct temp1.ProductName, temp1.Price
from Product temp1
Join product temp2
on temp1.Price=temp2.Price
And temp1.ProductName =temp2.ProductName

-----
----create table employee
create table employee
(
EmpId int not null,

EName varchar (100),
Manager varchar (100),
)


--insert into employee
insert into employee
values (1,'Mary','Jones'),
(2,'Jones','Smith'),
(3,'Smith','Lee'),
(4,'Adam','Jones'),
(5,'Bryan','Smith');
----find out employess who are managers
select *from employee

select distinct temp1.Manager 
from Employee temp1
join employee temp2
on temp2.Ename=temp1.Manager 
-----------------JOIn Practice----------------------------------------------------------
CREATE TABLE table1
(ID INT, Value VARCHAR(10))

insert into table1
values (1,'First'),
(2,'Second'),
(3,'Third'),
(4,'Fourth'),
(5,'Fifth');

CREATE TABLE table2
(ID INT, Value VARCHAR(10))

insert into Table2 
values (1,'First'),
(2,'Second'),
(3,'Tird'),
(6,'Sixth'),
(7,'Seventh'),
(8,'Eighth');


SELECT t1.ID,t2.Value
FROM Table1 t1
INNER JOIN Table2 t2 ON t1.ID = t2.ID


select * from table1
select *from table2

SELECT t1.ID,t2.Value
FROM Table1 t1
right JOIN Table2 t2 ON t1.ID = t2.ID

SELECT t1.ID,t2.Value
FROM Table1 t1
RIGHT JOIN Table2 t2 ON t1.ID = t2.ID
WHERE t1.ID IS NULL

SELECT t1.ID,t2.Value
FROM Table1 t1
CROSS JOIN Table2 t2

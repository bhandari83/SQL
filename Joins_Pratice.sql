create database practicejoins
use practicejoins

----create table employee and location
create table employee
(
EmpId int not null,
EmpName varchar (50)
)

Create table Location
(
EmpId int not null,
EmpLoc varchar (50)
)
---insert data into employee and location table 
insert into employee
values (13,'Jason'), 
(8,'Alex'), 
(3,'Ram'),
(17,'Babu'),
(25,'Johnson');

insert into Location
Values(13,'San Jose'),
(8,'Los Angeles') ,
(3,'Pune, India') ,
(17,'Chennai, India'), 
(39,'Bangalore, India');

select *from Location
select *from employee

----1.	Display all the employees who have location defined.

select E.EmpName from employee E
inner join Location L
on e.EmpId=L.EmpId


select e.EmpName, l.EmpLoc
from employee E
inner join Location L
on e.EmpId = L.EmpId

----2.	Display all the employees with locations. 
---The result should contain the employee even if the location is not defined yet.)

select E.EmpName from employee E
left outer join Location L
on e.EmpId=L.EmpId

select e.EmpName, l.EmpLoc
from employee E
left outer join Location L
on e.EmpId = L.EmpId

----2.  In SQL, what are the differences between primary, foreign, and unique keys?
----3. What is referential Integrity?

----4. create table and insert values

create table emp_bonus
(employee varchar (10),
bonus int
)

insert into emp_bonus
values('a',1000),
('b',2000),
('a',500),
('c',700),
('b',1250);

-----4 contd..Write a query to calculate the total bonus that each employee received.
-------Which query will work to find the employees who received more than $1,000 in total bonuses and why?


select employee, SUM(bonus) as totalbonus from emp_bonus 
group by employee
where sum (bonus) > 1000;

select employee, sum(bonus)as totalbonus from emp_bonus 
group by employee having sum (bonus) > 1000;

-----5create a table insert value and 
----Write a query to find out which employees are from the same location as the employee named Joe
-----(There are 2 possible solutions, one using a subquery and one 
----using a self join. Self join works best when table joins to itself.)

create table emp
(
empname varchar (30),
emploc varchar (30)
)
insert into emp
values ('Joe','New York '),
('Sunil','India'),
('Alex','Russia '),
('Albert','Canada'),
('Jack','New York');


select *from emp
---contd....Write a query to find out which employees are from the same location as the employee named Joe
-----self join----
select distinct temp1.empname
from emp temp1
join emp temp2
on temp1.emploc=temp2.emploc
and temp2.empname='joe'

-----sub query------
select empname from emp where
emploc in(select distinct emploc from emp where empname='joe')


---6-Suppose we have the Employee table below, and we want to retrieve all of the cities
---- that the employees live in, but we don’t want any duplicates. How can we do this in SQL?

select distinct emploc from emp

----7.In the table below, how would you retrieve the unique values for 
----the employee_location without using the DISTINCT keyword? 

select emploc from emp
group by emploc





 






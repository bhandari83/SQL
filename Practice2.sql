create database joindemo
-------create department table 

create table department
(
departmentid int not null,
departname varchar (20),
constraint pk_dbtip primary key (departmentid)
)

------create employee table

create table employee
(
lastname varchar (20)not null,
departmentid int,
constraint fk_deptid foreign key (departmentid)
references department (departmentid)
)
----insert data into department table
insert into department
values (31,'sales'),(33,'engineering'),(34,'clerical'),
(35,'marketing')

------insert data into employee table
insert into employee
Values ('rafferty',31),
('jones',33),('steinberg',33),
('robinson',34),('smith',34),('jasper',null)

select *from department
select *from employee

------INNER JOIN to display matching department
select e.lastname, d.departname
from employee e
inner join department d
on e.departmentid = d.departmentid

/*note:inner does not display employees without a department or departments without employees.
For that we have to use outer joins*/

---LEFT OUTER JOIN to display employees without a department
select e.lastname, d.departname
from employee e
left outer join department d
on e.departmentid = d.departmentid

----RIGHT OUTER JOIN to display departments without employees
select e.lastname, d.departname
from employee e
right outer join department d
on e.departmentid = d.departmentid
---/*FULL OUTER JOIN to display departments without employees and employees without departments*/
select e.lastname, d.departname
from employee e
full outer join department d
on e.departmentid=d.departmentid







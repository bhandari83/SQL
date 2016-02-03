create database Practice1
use Practice1
------Create Table Departments
create table departments
(
Code int primary key not null,
Name varchar (50) not null,
budget int not null
)

-----------Create table Employee
create table employees
(
SSN int primary key not null,
Name varchar (50) not null,
LastName varchar (50) not null,
Department int not null,
constraint fk_Departments_code Foreign Key(Department)
references Departments (Code)
)

--------Insert Sample Dataset 
----department table
Insert into departments
values
(14,'IT',65000),
(37,'Accounting',15000),
(59,'Human Resources',240000),
(77,'Research',55000)

------employees tabale
insert into employees
values
(123234877,'Michael','Rogers',14),
(152934485,'Sasi','Scott',14),
(222364883,'Carol','Smith',37),
(326587417,'Joe','Stevens',37),
(332154719,'Mary-Anne','Foster',14),
(332569843,'George','ODonnell',77),
(546523478,'Kate','Doe',59),
(631231482,'David','Smith',77),
(654873219,'Zacery','Effron',59),
(745685214,'Eric','Goldsmith',59),
(845657245,'Elizabeth','Doe',14),
(845657246,'Kumar','Swamy',14);

Answers
--1.select last name of all employees
select lastname from employees

--2.select last name of employee without duplicate
select distinct lastname from employees

--3. select all employees whose lastname is 'smith'
select *from employees where LastName ='Smith'

--4. select all the data of employees whose last name is 'smith'or'doe'
select * from employees where LastName='Smith' or LastName='doe'

--5.Select all the data of employees that work in department 14
select * from employees
select *from departments

select *from Employees e 
inner join departments d
on e.Department = d.Code and d.Code=14

--6 Select all the data of employees that work in department 37 or department 77 without using OR Operator
select * from employees
select *from departments

select *from Employees e 
inner join departments d
on e.Department = d.Code where Department in (37,77)

--7 select all the data of employees whose lastname begins with  "S"
select *from employees where LastName like's%'
--8 select the sum of all the departments 'budgets'
select SUM(budget)as 'Total Budget' from departments 

--9 select the number of employees in each department(only show department code and number of employee)
select Department, COUNT(*)as 'no of emp/dept' from employees
group by department
--10 select all the data of employees,including each employee's department's data 
select *from Employees e
full outer join departments d 
on e.Department = d.Code 

--11.Select the name and lastname of each employee, along with the name and budget of the employees department
select e.Name,e.LastName, d.Name, d.budget from employees e
left outer join departments d
on e.department=d.code

--12 select the name and last name of employees working for departments with a budget greater than $60,000
select e.Name,E.LastName from Employees e
full outer join departments d 
on e.Department = d.Code where budget>60000

--13 select the departments with a budget larger than the average budget of all the department

select Name from departments where budget >(select AVG(budget)from departments)
 
 --14 Select the names of department with more than two employees
 select * from departments 
 select * from employees
 
 select d.Name from Employees e 
inner join departments d
on e.Department = d.Code 
group by d.Name having COUNT(*)>2

--15 Add a new department called 'Quality Assurance', with budget of $40000 and department code 11.
-- Add an employee called 'Mary Moore' in that department, with SSN 8472198110
select * from departments 
select * from employees
insert into departments values (11,'Quality Assurance',40000)
Insert into employees values(87219811,'Mary','Moore',11)

--16. Reduce the budget of all department by 10%
update departments set budget=(budget-budget*0.01)
select *from departments
--17 Reassign all employees from Research Department (Code 77) to the IT Department (code 14)
update employees set Department=14 where department=77

select *from employees
--18 Fire all employees in the IT department (Code 14)
delete from employees where department=14

--19 Fire all employees who work in departments with a budget greater than or equal to $60000
delete from employees where department in(select code from departments where budget>=60000)

-- 20 Fire all employees.

delete from employees
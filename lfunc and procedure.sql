
use vendor
----create table 
create table Emp ( Empid int NOT NULL ,Ename Varchar(30), Salary int)

--Insert data into Emp table
insert into Emp
 values (100,'rafferty',3000),
 (200,'jones',4000),
(300,'steinberg',2000),
(400,'robinson',1500),
 (500,'smith',2500)
 
 select *from 

------Create a Procedure
create procedure Employeeid @Empid int
as
begin
select salary,Ename from Emp
where Empid=@Empid
end
go
 

-----execute a Procedure

exec employeeid 100

--Drop a procedure
Drop procedure MySalary

----------FUNCTION----------
------Create a Function

create function getlowestSal() returns int
begin
declare
@lowSalary int
select
@lowSalary = Min(Salary) from Emp
return
@lowSalary
end
go

--Execute a function
select dbo.getlowestSal() as 'Lowest Income'
--Drop a function
Drop function getlowestSal





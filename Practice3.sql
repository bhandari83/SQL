use vendor
create table Salesperson
 (
 Id int,
 Name varchar (30),
 Age int,
 Salary int
 )
 insert into Salesperson
 values(1,'Abe',61,140000), 
(2,'Bob',34,44000), 
(5,'Chris',34,40000), 
(7,'Dan',41,52000), 
(8,'Ken',57,115000), 
(11,'Joe',38,38000)
 
Create table Customer
(
Id int,
Name varchar (30),
City Varchar (30),
IndustryType varchar(30),
)

Insert into Customer
values(4,'Samsonic','pleasant','J'), 
(6,'Panasung','oaktown','J'), 
(7,'Samony','jackson','B'), 
(9,'Orange','Jackson','B')

create table Orders
(
Number int,
order_date datetime,
cust_id int,
salesperson_id int,
Amount int,
)
 Insert into Orders
 values (10,8/2/96,4,2,540), 
(20,1/30/99,4,8,1800), 
(30 ,7/14/95,9,1,460), 
(40 ,1/29/98,7,2,2400), 
(50, 2/3/98,6,7,600),
(60 ,3/2/98 ,6 ,7,720),
(70 ,5/6/98,9,7,150)

select * from Salesperson
select *from Customer
Select * from Orders

----------single query
select Name,SUM(salary)
from Salesperson
group by Name,Age
having SUM(salary)>40000

select Name,City from Customer where Id>6

select salesperson_id,SUM(Amount) from Orders 
group by salesperson_id having SUM(Amount) between 1000 and 2400

--a. The names of all salespeople that have an order with Samsonic
select * from Salesperson cs
select * from Customer css
Select * from Orders s

select sp.Name
from Salesperson sp
inner join Orders O
on sp.Id=O.salesperson_id
inner join Customer cu
on cu.Id=O.cust_id
and cu.Name='Samsonic'


--b. The names of all salespeople that do not have any order with Samsonic. 

select distinct sp.Name
from Salesperson sp
inner join Orders O
on sp.Id=O.salesperson_id
inner join Customer cu
on cu.Id=O.cust_id
and cu.Name<>'Samsonic'

--c. The names of salespeople that have 2 or more orders. 
select * from Salesperson S

Select * from Orders   O

Select S.Name
from Salesperson S
left outer join Orders O
on S.Id=O.salesperson_id
group by S.Name
having COUNT(O.salesperson_id)>1


--d. Write a SQL statement to insert rows into a table called highAchiever(Name, Age), 
--where a salesperson must have a salary of 100,000 or greater to be included in the table.


select Name,Age into highachiever from Salesperson where Salary>100000

select *  from highachiever




 

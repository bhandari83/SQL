--create Database
create database ShoppingData
--Select Database
use ShoppingData
--Create table (Customers)
create table Customers
(
CustomerID int, FirstName Varchar(50),
LastName varchar(50),Address varchar(250),ContactInfo varchar(10),
CreditCardNo varchar(16),CreditCardType varchar(10),
ExpDate
DateTime
)
select * from Customers
--Create Orders
create table Orders
(OrderId int not null,OrderStatus varchar(15),--'InProcess','Shipped','Delivered'
OrderDate Datetime,CustomerId int,ShippingDate Datetime)
select * from Orders
--Create OrderDetails
create table OrderDetails
(
OrderId int,OrderDetailId int,ProductId int,
Qty int, TotalPrice float
)
select * from OrderDetails
--Create Suppliers
create table Suppliers
(
SupplierId int,Name varchar(100), Address varchar(300)
)
select * from Suppliers
--Create Products
Create table products
(
SupplierId int, ProductId int,UnitPrice float,
Name varchar(100),ProductType varchar (50)--'ELEC','FURN','KITH'
)
select * from products
--*******DML BEGINS HERE************

--Inserting Sample data
insert into Customers(CustomerID, FirstName ,LastName ,Address,ContactInfo ,CreditCardNo ,CreditCardType,ExpDate)
values 
('4','Carol','Stream','Ocean drive San Fransisco 98987','1998756754','1029384756926573','Disc','07/20/2013'),
('3','Carlos','roger','automall freemont 98989','1000876754','5678400045674567','Amex','12/03/2012'),
('7','abe','lincoln','chicago ave chicago 67256','1919870004','5600056745674567','MC','11/10/2013'),
('5','george','bush','dallas pkwy dallas 76034','1919870000','5678456700000000','Visa','06/30/2012')
select * from Customers
--Insert into Orders
insert into Orders(OrderId,OrderStatus,OrderDate,CustomerId,ShippingDate)
values
('108','In Process',
GETDATE()+1,5,GETDATE()+7)
--insert into suppliers
insert into Suppliers (SupplierId,Name,Address)
values('111','ABC Company','New York')
--insert into products
insert into products(ProductId,SupplierId,UnitPrice,Name,ProductType)
values(3,1,15.99,'Cable','ELEC')
--insert into orderdetials
insert into OrderDetails (OrderId,ProductId,Qty,TotalPrice)
values(1,3,25,25*15.99)
SELECT * FROM Orders
--Update TABLES
update Customers set Address='lkjjlkjlk'
where CustomerID=1
--Delete Specific Record
delete from Customers where CustomerID=1
select *from Customers
-----END OF DML-----
------Different Select Statements-------
--sql queries
select *from Customers
---Select Specific Columns
select FirstName, LastName, Address from Customers
--String Concatenate
select FirstName,LastName from Customers

---When both column has same data type
select CustomerID,FirstName +' '+LastName as FullName from Customers
--when two column have diff data type it gives error msg like below
select CustomerID+ ' '+LastName as MyCol from Customers
--data type must be same here 1 is varchar and othe is int
--Concatenation of columns with different data types
select CAST(CustomerID as varchar(5))+' '+FirstName as MyOwnCol from Customers
--to Concatenate Columns having diff data types we can also use convert func.
---Using alias
select CustomerID 'ID', LastName+ ' '+FirstName'FullName',FirstName
from Customers
--Order by CLAUSE
select *from Customers order by CustomerID--desc
select *from Customers order by FirstName--asc
--like operator
select *from Customers Where Address like'%washington Ave%'
select *from Customers where FirstName like '[b-j]%'

--Operators(in,Between,>)
select *from Customers where CustomerID=1
select *from Customers where CustomerID in (1,3,7)
select *from Customers where FirstName between'A%'and 'd%'
select *from Customers where CustomerID between 1 and 5
select *from Customers where FirstName >'c%'
--Operator (Not In)<> means not equal to
select *from Customers where CustomerID <> 3
select *from Customers where CustomerID not in (1,3,5)
select *from sys.tables--all user created tables
sp_help 'customers'--shows the Metadata
--primary key on CustomerID
alter table Customers add constraint PK_CustomerID
primary key (CustomerID)
/*the above query will give error as there
is a condition that primary has to be not null*/
--alter column and set it to not null
alter table Customers alter Column CustomerID int not null
--primary key on orderId and foreign key on customerid
alter table Orders add constraint PK_OrderID
primary key (OrderId)
--alter column and set it to not null
alter table products alter column ProductId int not null
--foreign key
alter table Orders add constraint FK_CustomerID
foreign key (CustomerID)
references Customers (CustomerID)

--alter table products and change the datatype
alter table products alter column productid int

--alter table and add a new column
alter table products add Inactive_Date datetime

----- Renaming a Column from products table
sp_rename 'products.Inactive_Date','DateInactive'

---drop column
alter table products drop column DateInactive

select *from products
----select data into another table from existing table
select * into customerscopy from Customers

select *from customerscopy

--date function
select GETDATE()as currentdate

--datediff, dateadd and datepart
select DATEDIFF(YEAR,'09/10/2011',GETDATE())
select DATEADD(YEAR,1,getdate())
select DATEPART(MONTH,getdate())
--how to drop a constraint
alter table Orders drop constraint FK_CustomerID 


------Aggregate Function on ShippingData
select* from customers --19977

select
MIN(customerid) min_id, MAX(customerid) max_id,
COUNT
(*) custCount from customers

select
SUM(totaldue), AVG(totaldue) from orders

select * from Orders 
select* from OrderDetails
select * from Products
select * from Suppliers

--------create Views
create view VW_getCustomers
as select C.FirstName + ' ' + C.LastName CustomerName,
S.Name SupplierName,P.Name Product, P.UnitPrice,
O.OrderDate,OD.TotalPrice,OD.Qty
from Customers C
inner join Orders O
on C.CustomerId=O.CustomerId
inner join OrderDetails OD
on O.OrderId=OD.OrderId
inner join Products P
on OD.ProductId=P.ProductId
inner join Suppliers S
on P.SupplierId=S.SupplierID

--how to run the query using view
select * from VW_getCustomers

--table can be joined to a view
select * from VW_getCustomers
inner join Orders 
on VW_getCustomers.OrderDate = Orders.OrderDate
--how to create trigger
create trigger trg_Orders
on Orders
for insert as begin
--IN process/Pending/cancelled and rescheduled - old value
--delievered - new value
--inserted(new value) and deleted(old value)
declare @orderDetails int
declare @orders int
select @orderDetails =COUNT(*) from OrderDetails where
OrderId
in (select OrderId from inserted) -- deleted
--select COUNT(*) from OrderDetails where OrderId in (1, 2)
select @orders = COUNT(*) from inserted
if(@orderDetails > 0)
print @orderDetails
else
print 'Order is created successfully'
print 'no of orders processed:' + cast(@orders as varchar)
--select GETDATE
end


--this query will fire the trigger
insert into Orders(OrderStatus,
OrderDate , CustomerId, ShippingDate )
values('In Process', '09/28/2010', 1, '09/29/2010'),
('In Process', '09/28/2010', 2, '09/29/2010'),
('In Process', '09/28/2010', 3, '09/29/2010'),
('In Process', '09/28/2010', 4, '09/29/2010'),
('In Process', '09/28/2010', 5, '09/29/2010')














 






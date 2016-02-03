create table Customer
(
CustomerId int not null primary key,
CustName varchar (100),
CustAddress varchar (500),
CustPhone float
)


Insert into Customer
Values(1,'Pukar Tamrakar','123 freemont ',6089789765),
(2,'Mohammad Shahzad','345 automall',6234567898),
(3,'Ankit Bhandari','485 Christy',2987654321),
(4,'Varun Singh','789 grimmer',8764563210),
(5,'Bhamila Great','785 montecarlo',5109877453)

create table Orders
(
OrderId int not null Primary key,
CustomerId int foreign key
 references Customer(customerId),
ProductName varchar (500),
Qty int
)
Insert into Orders
Values(100,1,'Colgate',3),
(200,2,'Charger',1),
(300,3,'Sugar',2),
(400,4,'Kulfi',3),
(500,5,'Hajmola',2)

select *from Orders

create table OrderDetail
(
OrderDetailId int not null primary key,
CustId int Foreign key references Customer(CustomerID),
OrderId int Foreign key references Orders (OrderID),
ShippingAddress varchar (500),
shippingDate date
)


select * from OrderDetail
insert into OrderDetail
values
(102,2,200,'345 automall',GETDATE()+3),
(103,3,300,'485 Christy',GETDATE()+4),
(104,4,400,'789 grimmer',GETDATE()+6),
(105,5,500,'785 montecarlo',GETDATE()+2)

--select employee name who has orderID 200 along with productname
select *from Customer
select *from Orders
select *from OrderDetail

select C.CustName,O.OrderId,O.ProductName,D.ShippingAddress
from Customer c
inner join Orders O 
on c.CustomerId=O.CustomerId
inner join OrderDetail D
on O.OrderId=D.OrderId 
and d.OrderId=200


--add a column name called price on orders table
select *from Orders
alter table Orders Add Price int

--Insert Price on each item
Update Orders set Price='3' where CustomerId=5

--write a sql query to find out toal price
select SUM(Price)as 'totalprice' from Orders


--
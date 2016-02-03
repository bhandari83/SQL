--1--Create a Table Contacts--
create table Contacts
(Lastname varchar(550),Firstname varchar (550),email varchar (500),Gender varchar (7),Birthdate date , Profession varchar (500),
Location varchar (500),Status varchar (500),Interests varchar (500),Seeking varchar (100))

--2---- show the structure-----
sp_help Contacts


--3--Insert Data--
Insert into Contacts
values ('Anderson',' Jillian', 'jill_anderson@breakneckpizza.com','F','1980-09-05','Technical Writer','Palo Alto, CA','single','kayaking, reptiles','relationship ,friends')
------part of 3 insert multiple data--
Insert into Contacts
Values ('Kenton	','Leo','lkenton@starbuzzcoffee.com','M','1974-01-10','Manager','San Francisco, CA','divorced','women','women to date'),
('McGavin','Darrin','captainlove@headfirsttheater.com','M','1966-01-23','Cruise Ship Captain','San Diego,CA','single','sailing,fishing,yachting','women for casual relationships'),
('Franklin','Joe','joe_franklin@leapinlimos.com','M','1977-04-28','Software Sales','Dallas, TX','married ','fishing,drinking','new job'),
('Hamilton','Jamie','dontbother@starbuzzcoffee.com','F','1964-09-10','System Administrator','Princeton, NJ','married','RPG','nothing'),
('Chevrolet','Maurice','bookman4u@objectville.net','M','1962-07-01','Bookshop Owner','Mountain View, CA','married','collecting books, scuba diving','friends'),
('Kroger','Renee','poorrenee@mightygumball.net','F','1976-12-03','Unemployed','San Francisco, CA','divorced','cooking','employment'),
('Mendoza','Angelina','angelina@starbuzzcoffee.com','F','1979-08-19','UNIX Sysadmin','San Francisco, CA','married','acting, dancing','new job'),
('Murphy','Donald','padraic@tikibeanlounge.com','M','1967-01-23','Programmer','New York City, NY','committed relationsh','RPG, anime','friends'),
('Spatner','John','jpoet@objectville.net','M','1963-04-18','Salesman','Woodstock, NY','married','poetry, screenwriting','nothing');


--4-----Check out Contacts with Select
Select *from Contacts
--5-----Look for Specific Contacts'
select Seeking, Interests from Contacts where Lastname='Kroger'
select Firstname,Lastname from Contacts where Status='Married'
select Firstname, Lastname,Seeking from Contacts where Seeking='new job'

/*---6.	Write a query for Contacts to find the email addresses of computer programmers,and 
then write one to help your manager find all the Annes from San Francisco*/
select email from Contacts where Profession='computer programmer'
select email from Contacts where Profession='programmer'

--7-----Find the people in Contacts who live in California, then try some other states.
select *from Contacts where Location like '%CA%'---look up from california
select *from Contacts where Location not like '%CA'---look up except CA

--8.Try your ALTER TABLE commands on Contacts 
–-add contact id as primary key int auto increment--

alter table Contacts add ContactId int identity (1,2) 

alter table Contacts add constraint Pk_C primary key (ContactId)----assign primary key

select *from Contacts

---9	Create Meetings  table
create table Meetings
(
Number int,
EventName varchar (100),
EventDesc varchar (100),
)
select *from Events
Insert into Meetings
Values (1,'Outdoor Meeting','Official meeting with client'),
(2,'Party','Party for Bday'),
(3,'TahoeTrip','Trip to lake tahoe')

---10.	This table is in need of a major makeover. How would you rename it to Events
sp_rename 'Meetings','Events'

select *from events

--11.	Now try ALTERing Events, make number as primary key
alter table Events add constraint Number int not null
alter table Events add constraint PK_N primary key (Number)----not null error
--to change into not null
alter table Events alter column Number int not null
--12.	Add city and state columns to Contacts
alter table contacts add  City varchar (50),state varchar (2)
select *from Contacts

--13.	Practice the string functions Concatenate 
select CAST(ContactId as varchar(5))+' '+Firstname+ ' ' +Lastname as FULLNAME from Contacts

--14.	Use UPDATE to fix the states in Contacts (state should be first two chars of location, use “RIGHT” string function)





--15.	Write queries for Contacts that retrieve the data as follows
---a.	All contacts where profession is Technical Writer
select *from Contacts where Profession='Technical Writer'

--16.	ALTER Contacts to have four new columns named interest1, interest2, interest3, and interest4
alter table Contacts add Interest1 varchar (50), Interest2 varchar (50), interest3 varchar (50),interest varchar (50)

select *from Contacts

--17Create another table Contacts_Events a.	ContactID (foreign key from contacts)b.	EventID(foreign key from events)-c.	Members (int) 

create table Contacts_Events
(
ContactId int,
EventId int,
Members int,
)
alter table Contacts_Events add constraint FK_ContactID
foreign key (ContactId)
references Contacts

alter table Contacts_Events add constraint Fk_EventsID
foreign key (EventID)
references events 

alter table Contacts_Events drop constraint FK_EventsID
--18.	Add data to the table
insert into Contacts_Events
values (1,'3','4')



--19	Inner join query on Contacts and Contacts_Events table

SELECT * FROM Contacts
INNER JOIN Contacts_Events
ON Contacts.ContactId=Contacts_Events.ContactId

--20.	Write a query to find all contacts and only those events for which the contactid is filled.
select *from Contacts
select *from events where Number is not null

--21.	Find all the contacts in desc order.

select *from Contacts order by ContactId desc


select *from Contacts order by 8 desc----order column no 8 descending order

select  top 2 *from contacts----selects top 2 contacts


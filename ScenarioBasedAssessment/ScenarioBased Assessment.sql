#SCENARIO BASED ASSESSMENT

#1 Create a book table with id as primary key and provide the appropriate data type to other attributes .isbn no should be unique for each book
#Write a query to fetch the details of the books written by author whose name ends with er.
create table books(id int primary key ,title varchar(40),author varchar(30),isbn numeric(20),published_date datetime);
desc books;
drop table books;

insert into books values (1,'My First SQL Book','Mary Parker',981483029127,'2012-02-22 12:08:17');
insert into books values (2,'My Second SQL Book','John Mayer',857300923713,'1972-07-03 09:22:45');
insert into books values (3,'My Third SQL Book','Cary Flint',523120967812,'2015-10-18 14:05:44');
select * from books;


select * from books where author like '%er';


#2 Display the Title ,Author and ReviewerName for all the books from the above table
create table reviews(id int primary key,book_id int references books(id),reviewer_name varchar(40),content varchar(30),rating int,published_date datetime);

insert into reviews values (1,1,'John Smith','My First Review',4,'2017-07-10 05:50:11');
insert into reviews values (2,2,'John Smith','My Second Review',5,'2017-10-13 15:05:12');
insert into reviews values (3,2,'Alice Walker','Another Review',1,'2017-10-22 23:47:10');
select * from reviews;

select b.title,b.author,r.reviewer_name from books b left outer join reviews r on b.id = r.book_id;

#3 Display the reviewer name who reviewed more than one book.
select reviewer_name from reviews group by reviewer_name having count(reviewer_name)>1;


#4 Display the Name for the customer from above customer table who live in same address which has character o anywhere in address
create table customers(id int primary key ,name varchar(30) ,age int,address varchar(30),salary double);
desc customers;

insert into customers values (1,'Ramesh',32,'Ahmedabad',2000.00);
insert into customers values (2,'Khilan',25,'Delhi',1500.00);
insert into customers values (3,'Kaushik',23,'Kota',2000.00);
insert into customers values (4,'Chaitali',25,'Mumbai',6500.00);
insert into customers values (5,'Hardik',27,'Bhopal',8500.00);
insert into customers values (6,'Komal',22,'MP',4500.00);
insert into customers values (7,'Muffy',24,'Indore',10000.00);

select * from customers;

select name from customers where address like '%o%';


#5 Write a query to display the   Date,Total no of customer  placed order on same Date
create table orders(oid int primary key ,odate date,customer_id int references customers(id),amount int);

insert into orders values(102,'2009-10-08 00:00:00',3,3000);
insert into orders values(100,'2009-10-08 00:00:00',3,1500);
insert into orders values(101,'2009-11-20 00:00:00',2,1560);
insert into orders values(103,'2008-05-20 00:00:00',4,2060);
select * from orders;

select odate Date,count(oid) TotalCustomerOrders from orders group by odate;

#6 Display the Names of the Employee in lower case, whose salary is null
create table employee(id int primary key ,name varchar(30) ,age int,address varchar(30),salary double);
insert into employee values (1,'Ramesh',32,'Ahmedabad',2000.00);
insert into employee values (2,'Khilan',25,'Delhi',1500.00);
insert into employee values (3,'Kaushik',23,'Kota',2000.00);
insert into employee values (4,'Chaitali',25,'Mumbai',6500.00);
insert into employee values (5,'Hardik',27,'Bhopal',8500.00);
insert into employee(id, name, age, address) values (6,'Komal',22,'MP');
insert into employee(id, name, age, address) values (7,'Muffy',24,'Indore');
select * from employee;

select name from employee where salary is null;


#7 Write a sql server query to display the Gender,Total no of male and female from the above relation    .
create table studentdetails(registerno int primary key ,name varchar(20),age int,qualification varchar(10),mobileno numeric(10),mail_id varchar(20),
location varchar(20),gender varchar(1));

insert into studentdetails values(2,'Sai',22,'B.E',9952836777,'sai@gmail.com','Chennai','M');
insert into studentdetails values(3,'Kumar',20,'BSC',7890125648,'Kumar@gmail.com','Madurai','M');
insert into studentdetails values(4,'Selvi',22,'B.Tech',8904567342,'selvi@gmail.com','Selam','F');
insert into studentdetails values(5,'Nisha',25,'M.E',7834672310,'Nisha@gmail.com','Theni','F');
insert into studentdetails values(6,'SaiSaran',21,'B.A',7890345678,'saran@gmail.com','Madurai','F');
insert into studentdetails values(7,'Tom',23,'BCA',8901234675,'Tom@gmail.com','Pune','M');
select * from studentdetails;

select gender,count(gender)Total from studentdetails group by gender;

#8 Retrieve the CourseName and the number of student registered for each course between 2018-01-02 and 2018-02-28 and arrange the result by courseid in descending order
drop table coursedetails;
drop table courseregistration;

create table coursedetails(c_id varchar(10) primary key ,c_name varchar(20),start_date date,end_date date,fee int);
create table courseregistration(registerno int references studentdetails(registerno),cid varchar(10) references coursedetails(c_id),batch varchar(2));

insert into coursedetails values('DN003','DotNet','2018-02-01','2018-02-28',15000);
insert into coursedetails values('DV004','DataVisualization','2018-03-01','2018-04-15',15000);
insert into coursedetails values('JA002','AdvancedJava','2018-01-02','2018-01-20',10000);
insert into coursedetails values('JC001','CoreJava','2018-01-02','2018-01-12',3000);

insert into courseregistration values(2,'DN003','FN');
insert into courseregistration values(3,'DV004','AN');
insert into courseregistration values(4,'JA002','FN');
insert into courseregistration values(2,'JA002','AN');
insert into courseregistration values(5,'JC001','FN');


select cd.c_name CourseName,count(cr.cid)StudentsRegistered from coursedetails cd inner join courseregistration cr on cd.c_id = cr.cid group by cr.cid;


#9 Display the Firstname and LastName of the customer who have placed exactly 2 orders
create table customer(customer_id int primary key ,first_name varchar(20) ,last_name varchar(20));

create table neworder(order_id int primary key ,order_date date,amount float,customer_id int references customer(customer_id));

insert into customer values(1,'George','Washington');
insert into customer values(2,'John','Adams');
insert into customer values(3,'Thomas','Jefferson');
insert into customer values(4,'James','Madinson');
insert into customer values(5,'James','Monroe');

insert into neworder values(1,'1776/07/04',234.56,1);
insert into neworder values(2,'1760/03/14',78.50,3);
insert into neworder values(3,'1784/05/23',124.00,2);
insert into neworder values(4,'1790/09/03',65.50,3);
insert into neworder values(5,'1795/07/21',25.50,10);
insert into neworder values(6,'1787/11/27',14.40,9);

select c.first_name,c.last_name,count(n.order_id) TotalOrders from customer c inner join neworder n on c.customer_id = n.customer_id group by n.customer_id having count(n.order_id)=2;

#10 Display all the student name in reverse order and Capitalize all the character in location
select name,upper(location) from studentdetails order by name desc;

#11 Create a view table to display the ProductName,ordered Quantity and OrderNumber from the above relations
create table ordr(id int primary key ,order_date date,order_number int,customer_id int,totalamount float);
create table order_item(id int primary key ,order_id int references ordr(id),product_id int references product(id),unitprice float references product(unitprice),quantity int);
create table product(id int primary key ,productname varchar(20),supplierid int ,unitprice float,package int,isdiscontinued bool);

#12 Display the Course Name registered by student  Nisha
create view coursename as
select cd.c_name,cr.cid,cr.registerno from coursedetails cd inner join courseregistration cr on cd.c_id = cr.cid;

select sd.name,cn.c_name from studentdetails sd inner join coursename cn  on sd.registerno = cn.registerno where sd.name='Nisha';
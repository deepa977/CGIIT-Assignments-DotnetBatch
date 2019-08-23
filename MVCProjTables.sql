create database MVCDB

use MVCDB

create table PersonInfo
(Id int primary key identity,
name varchar(30) not null,
mobno bigint unique,
password varchar(8) not null,
type varchar(20) not null)

create table ProductInfo
(pid int primary key identity(100,100),
pname varchar(50) not null,
price money not null)

create table OrderInfo
(OrderId int primary key identity(10,10),
PersonID int references PersonInfo(Id),
OrderDate Datetime ,
TotAmount money)

create table OrderTransaction
(TransID int primary key identity,
OrderId int references OrderInfo(OrderId),
Pid int references ProductInfo(Pid),
qty int)

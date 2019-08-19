use TrainingExamples

create table Employee
(EmpId int,
Name varchar(20),
Dept varchar(20),
Desg varchar(20),
Salary decimal)
--change table name
sp_rename 'dbo.Employee','EmployeeInfo'

--change column names
sp_rename 'dbo.EmployeeInfo.Name','EmpName','Column'

-- add a new column to existing table
alter table EmployeeInfo
add gender varchar(6)

-- add multiple new columns
alter table EmployeeInfo
add DOB datetime,
cab bit,
mobno bigint

--drop existing columns
alter table EmployeeInfo
drop column DOB

ALTER TABLE EmployeeInfo
alter column Empname Varchar(50) not null;


drop table EmployeeInfo

-- constraints
create table PersonInfo
(Id int constraint pk_Id primary key identity,
Name varchar(50) not null,
[Address] varchar(100) constraint def_address default 'Bangalore',
MobNo bigint constraint un_mobno unique,
EmailId varchar(50),
Gender varchar(6) constraint chk_gender check(Gender in('M','F','Male','Female')),
Salary money constraint chk_salary check(salary between 5000 and 50000),
cab bit)

alter table PersonInfo
drop constraint chk_salary 

--create table without constraint and alter table to add constraints to it
create table Employee
(EmpId int,
Name varchar(20),
Dept varchar(20),
Desg varchar(20),
Salary decimal)

--make empid as not null
-- create PK on EmpID

alter table Employee 
alter column EmpId int not null

alter table Employee
add constraint pk_empid Primary key(empid) 

--cannot do identity with alter table
-- drop the column and create it again

--alter table Employee
--alter column EmpID int identity(1,1)

alter table Employee
alter column Name varchar(20) not null


-- dept add a check constraint
alter table Employee
add constraint chk_dept check(dept in('HR','Accounts','IT'))

-- add a unique and default constraint
alter table Employee
add DOJ datetime,
mobno bigint

alter table Employee
add constraint un_mobno1 unique(mobno),
constraint def_DOJ default getdate() for DOJ

create table ProjectInfo
(ProjId int constraint pk_projid primary key identity(100,100),
ProjName varchar(100) not null)


alter table Employee
add ProjId int constraint fk_Employee_ProjectInfo references ProjectInfo(ProjID)


--dml
--insert is of 3 types
-- insert data for all columns
insert into PersonInfo values('Jack','Mysore',89432432,'jack@gmail.com','M',32323,0)

select * from PersonInfo

--insert data with null values
insert into PersonInfo values('Ford','Pune',null,null,'F',15000,null)

--insert data for specific not null columns
insert into PersonInfo(Id,Name,Mobno,gender,Salary) values(100,'Scott',63243232,'F',3000)



--update is used to alter the existing data
--if no condition is given in update all data in table will get changed
update PersonInfo set Salary=Salary+100.30
--null values cannot be checked with = operator
-- is null or is not null is used to work with null values

update PersonInfo set emailid='default@gmail.com' where emailid is null

--increment salary by 10% for those who are not using cab and who is staying in Bangalore
--logical operators are keywords like and, or and not

update PersonInfo set Salary=Salary+(Salary*.10) where cab is null and Address='Bangalore'

--delete will remove only the records
delete from PersonInfo where cab is not null

select * from PersonInfo

delete from PersonInfo

----------

--DQL - where 
--like , between,in , group by,order by, joins, subquery
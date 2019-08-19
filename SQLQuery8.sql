use TrainingExamples

create proc sp_insertregistration
(@name varchar(30),@add varchar(100),@dob datetime,@gen varchar(6),@nat varchar(10),@q varchar(20),@sk varchar(50),@hob varchar(100),@doj datetime,@sal money, @id int output)
as
begin
  insert into Registration values(@name,@add,@dob,@gen,@nat,@q,@sk,@hob,@doj,@sal)
  select @id=@@IDENTITY
end


create table ProjectDetails
(projid int primary key identity(100,100),
projname varchar(20) not null)

insert into projectdetails values('Keno')
insert into projectdetails values('MBSL')
insert into projectdetails values('Danske Bank')

select * from projectdetails

alter table Registration
add projid int references projectdetails(projid)




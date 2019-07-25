alter proc sp_updateemp(@dno int)
as
begin 
if(@dno is null)
select sal "Oldsal" from emp where deptno is null
else
select sal "Oldsal" from emp where deptno =@dno
update emp 
set sal=
case @dno --switch in C#
when 10 then sal+200 --when is case in C#
when 20 then sal+300
when 30 then sal+400
else
sal
end
if(@dno is NULL)
begin
   update emp set sal=sal+500 where deptno is null
  end
  if(@dno is null)
select sal "Newsal" from emp where deptno is null
else
select sal "Newsal" from emp where deptno =@dno
end --begin 

--test

exec sp_updateemp 30

exec sp_updateemp null

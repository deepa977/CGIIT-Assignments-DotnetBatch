CREATE TABLE [dept] (
	[deptno] [int] CONSTRAINT [pk_dpt] PRIMARY KEY ,
	[dname] [varchar] (20)  ,
	[loc] [varchar] (20))
	

insert dept values(10,'ACCOUNTING','NEWYORK')
insert dept values(20,'RESEARCH','DALLAS')
insert dept values(30,'SALES','CHICKAGO')
insert dept values(40,'OPERATIONS','BOSTON')

create table emp(
EMPNO int constraint pk_emp primary key,
ENAME                                              VARCHAR(10),
JOB                                                VARCHAR(9),
MGR                                                int,
HIREDATE                                           DATEtime,
SAL                                                money,
COMM                                               money,
DEPTNO int constraint fk_dep  references dept(deptno))
insert emp values (7369,'SMITH','CLERK',7902,'DEC 17 1980',800,NULL,20)
INSERT EMP VALUES(7499,'ALLEN','SALESMAN',7698,'FEB 20 1981',1600,300,30)
INSERT EMP VALUES(7521,'WARD','SALESMAN',7698,'FEB 22 1981',1250,500,30)
INSERT EMP VALUES(7566,'JONES','MANAGER',7839,'APR 02 1981',2975,NULL,20)
INSERT EMP VALUES(7654,'MARTIN','SALESMAN',7698,'SEP 28 1981',1250,1400,30)
INSERT EMP VALUES(7698,'BLAKE','MANAGER',7839,'MAY 01 1981',2850,NULL,30)
INSERT EMP VALUES(7782, 'CLARK','MANAGER',7839,'JUN 09 1981',2450,NULL,10)
INSERT EMP VALUES(7788, 'SCOTT','ANALYST', 7566,'APR 19 1987',3000,NULL,20)
INSERT EMP VALUES(7839, 'KING','PRESIDENT',NULL,'NOV 17 1981',5000,NULL,10)
INSERT EMP VALUES(7844, 'TURNER','SALESMAN',7698, 'SEP 08 1981',1500,NULL,30)
INSERT EMP VALUES(7876, 'ADAMS','CLERK', 7788, 'MAY 23 1987',1100,NULL,20)
INSERT EMP VALUES(7900, 'JAMES','CLERK', 7698, 'DEC 03 1981',950,NULL,30)
INSERT EMP VALUES(7902, 'FORD','ANALYST',7566, 'DEC 03 1981',3000,NULL,20)
INSERT EMP VALUES(7934,'MILLER','CLERK',7782, 'JAN 23 1982',1300,NULL,10)


--Select query
select * from emp

--* is a wild card character which means all data in the table is selected
select empno,ename,sal from emp

--different display name for column
select empno "EmpID", ename "EmpName" from emp

--condition - where clause is used
select * from emp where deptno=20

select * from emp where job='Clerk' 

select * from emp where job='Clerk' and deptno=20

select * from emp where job='Clerk' or job='Analyst'

--logical or operator can be replaced with in clause
select * from emp where job in('Clerk','Analyst')
 --in can be negated using not in
 select * from emp where job not in('Clerk','Analyst')

 --relational operators -select query
 select * from emp where sal >=2000 and sal <=4000
  --relational operator can be replaced with between clause
  select * from emp where sal between 2000 and 4000
  --between can be negated using not between
    select * from emp where sal not between 2000 and 4000
	--null cannot be checked with = operator
	--we have to use is null or is not null
	select * from emp where comm is not null
	select * from emp where comm is null
	select * from emp where mgr is null
	--sorting - order by asc  (default), order by desc
	select ename,sal from emp order by  ename
	--desc order
	select ename,sal from emp order by  ename desc
	--order by ename,sal
	insert into emp(empno,ename,sal) values(7777,'KING',3000)

	select ename,sal from emp order by ename desc,sal desc

	--pattern matching operator like and not like
	--A% - start with A can be of any length
	--%S - start with anything of any length but end with S
	--A%E -Start with A and Ends with E
--	'_s%'-- start character can be anything. 2nd character has to be s followed by any characters
-- '%E%' - contain E 
-- '___' - length should be 3 letters

select ename from emp where ename like 'A%'
select ename from emp where ename like '%E'
select ename from emp where ename like 'A%S'
select ename from emp where ename like '%E%'
select ename from emp where ename like '_i%'
select ename from emp where ename not  like '____'

--aggr functions
--min , max, count, sum , avg
--min,max and count can work on columns of all data types
--sum, avg can work on numeric types only
select min(ename),max(ename),min(sal), max(sal), min(hiredate),max(hiredate) from emp

--count(*), count(colname)
--count(*) - it counts null and not null values
--count(comm) - it counts only not null values
select count(*) , count(comm) from emp

--sum and avg 
select sum(sal), avg(sal), sum(comm),avg(comm) from emp

--group by --job or deptno
-- aggr functions in select can be used along with group by
select sum(sal) from emp where deptno=20

select sum(sal),deptno from emp  group by deptno
--condition before grouping the where clause is used
--condition after grouping then having clause is used
select sum(sal), deptno from emp
where deptno is not null
group by deptno
having sum(sal) >= 9000
order by deptno desc
--select from where group by having order by 

--joins if we want to get data from multiple tables then joins are used
--join columns from multiple tables but we dont give a common condition for join it leads to cartesian product
--no of rows table1 * no of rows table2
select e.empno,e.ename,d.deptno,d.dname from emp e,dept d
--condtion can be given using where clause or using join
select e.empno,e.ename,d.deptno,d.dname from emp e,dept d
where e.DEPTNO = d.deptno

--join inner join or equi join
-- outer join (Right Outer Join, Left Outer Join and Full Outer Join)
-- Self Join

--inner join or equi join will show only matching records from both the tables.NULL data from both tables will not be considered
select * from dept
insert into dept values(50,'IT','INDIA')
insert into dept values(60,'TOURISM','AUSTRALIA')

insert into emp(empno,ename,sal) values(8899,'Deepa',7500)


select e.empno, e.ename,d.dname
from emp e
join dept d
on e.DEPTNO=d.deptno

--/Left outer/right outer join
--table 1 join table 2
--Left outer joins all records of Table1 is considered when it is joining with Table 2
--Right Outer Join match all records present in Table 2
-- Full Outer Join - Left Outer + right outer join
select e.empno, e.ename,d.dname
from emp e
right outer join dept d
on e.DEPTNO=d.deptno

select e.empno, e.ename,d.dname
from emp e
full outer join dept d
on e.DEPTNO=d.deptno

--self join - join on different columns within the same table
select empno,mgr from emp
--print the employee name and manager name
--empno and mgr (join) o/p ename
select e.ename "EmpName", 
m.ename "MgrName" ,
e.empno "EmpNo",
m.empno "MgrNo"
 from emp e
join emp m
on m.EMPNO=e.mgr


select empno,ename, mgr from emp

select ascii('a') 
select char(78)
select len(ename),ename from emp
select charindex('t','customer') 
select SUBSTRING('customer',2,4)
select upper('customer')
select  concat(ename, space(2) + 'Joined on '),hiredate from emp

select  concat(ename, space(2) + 'Joined on ' + space(2) + convert(varchar,hiredate)) from emp

select reverse(ename),ename from emp

select REPLACE('Hello World','el','nil')

select REPLICATE(ename,2) from emp

select day(hiredate) from emp
select MONTH(hiredate) from emp

select YEAR(hiredate) from emp

select DATEDIFF(year,hiredate,getdate()) from emp

select hiredate,dateadd(d,35,hiredate) from emp

----------------------------------------subqueries-----------------------------------------------

use sunilkumar

create proc sp_emp
as
begin
select * from emp
end

execute sp_emp

create table dd1 (cid int,name varchar (100))

insert into dd (id,name) values (1,'sunil'),(2,'nani')


create proc sp_dd1
as
begin
insert into dd1 (cid,name)
select id,name from dd
end

exec sp_dd1
select * from dd1
create proc sp_d11
as
begin
insert into dd1 (cid,name) values (3,'teju')
update dd1 set name='sreenu' where cid=3
end
exec sp_d11

select * from dd1

sp_helptext sp_dd1


alter proc sp_dd1
as
begin
update dd1 set name='sreenu' where cid=3
end

------input parameter-------


create proc sp_emp_dept (@deptno int)
as 
begin
select * from emp where deptno=10
end
exec sp_emp_dept @deptno=10


create proc sp_empdept (@deptno int,@JOB varchar(100))
as
begin
select * from emp where DEPTNO=@deptno and job=@job
end

exec sp_empdept 20,'manager'
select * from dd1

alter procedure pr_suni (@cid int,@name varchar (100))
as
begin
truncate table dd	
insert into dd (id ,name ) values (@cid,@name)
end

/***use sunilkumar


create table ggg1 (id int,name varchar (100))

create proc  sp_gg1
as
begin
insert into ggg1 (id,name) values (101,'su')
end

exec sp_gg1

select * from d11


alter procedure sp_d11 (@cid int,@name varchar (100))
as 
begin 
truncate table  d11
insert into dd1 values (@cid,@name)
end
exec sp_dd1 @cid=10,@name='sunil'*///

------------------optional parameters---------------------------



create table cust_details_master (id int,fname varchar (100),mname varchar (100),lname varchar (100))

create procedure pr_cust (@id int=null,@fname varchar (100)=null,@mname varchar (100)=null,@lname varchar (100)=null)
as
begin
insert into cust_details_master (id,fname,mname,lname) values (@id,@fname,@mname,@lname)
end

exec pr_cust @id=10,@mname='sunil'

select * from cust_details_master


create table ggg (uid int,name varchar (100))
create table g22 (uid int,place varchar (100))
create table g33 (uid int,age int)

drop table g22,g33

create proc pr_optional (@table_name varchar (100),@uid int=null,@name varchar (100)=null,@place varchar (100)=null,@age int=null)
as 
begin
if @table_name='ggg'
begin
insert into ggg (uid,name) values (@uid,@name)
end
else

if @table_name='g33'
begin
insert into g22 (uid,place) values (@uid,@place)
end
else

if @table_name='g33'
begin
insert into g33 (uid,age) values (@uid,@age)
end

end

exec pr_optional @table_name='ggg',@uid=1526,@age=24

select * from ggg
select * from g22
select * from g33

update ggg set uid=1502 where name='sunil'
select * from EMP

use sunilkumar



create proc sp_fetch (@empno int=null,@Ename varchar (100)=null,@deptno int=null)
as 
begin
select * from emp where empno=@empno or ename=@ename or DEPTNO=@deptno
end

exec sp_fetch @ename='smith'

create proc sp_fetch_method2 (@empno int=null,@Ename varchar (100)=null,@deptno int=null)
as 
begin
if @empno is not null and @Ename is null and @deptno is null
begin
select * from EMP where EMPNO=@empno
end
if @empno is  null and @Ename is not null and @deptno is null
begin
select * from EMP where ename=@Ename
end
if @empno is  null and @Ename is  null and @deptno is not null
begin
select * from EMP where DEPTNO=@deptno
end

end


-------------------
exec sp_fetch_method2 @deptno=30


-----output parameters-----------------
create proc pr_datediff_su(@startdate datetime ,@enddate datetime,@result int output)
as
begin
 set @result=(select DATEDIFF(dd,@startdate,@enddate))
 end

 -----execution-----------------

 declare @new_result int
execute pr_datediff_su  @startdate='2020-01-01',@enddate='2020-01-20',@result=@new_result output
select @new_result

select * from emp where deptno=@new_result

create proc pr_declare (@input varchar (100),@result varchar (5))
as
begin
set @result=(select SUBSTRING(@input,1,5))
end

declare @new_result varchar (5)
execute pr_declare @input='sunilkumar' ,@result=@new_result out
select @new_result


create proc pr_outdate (@inputdate datetime ,@result datetime output)
as 
begin
 set @result=(select dateadd (dd,-day(dateadd(mm,1,@inputdate)),dateadd (mm,1,@inputdate)))
 end


 declare @new_result datetime
 execute pr_outdate @inputdate='2018-01-10', @result=@new_result out
 select @new_result

use sunilkumar
 
 create table sp_1
 (
 sid int,
 sname varchar (20)
 )

 create table sp_2
 (
 PlayerScore int
 )

  create table sp_3
 (
age int
 )

 select * from sp_1
 select * from sp_2
 select * from sp_3

 create proc pr_insert
(
@sid int,
@sname varchar (20),
@PlayerScore int,
@age int
)
as 
begin

insert into sp_1 values (@sid,@sname)
insert into sp_2 values (@PlayerScore )
insert into sp_3 values (@age)
end

exec pr_insert  @sid ,@sname ,@PlayerScore,@age(101,'sunil'6000,50)


declare @col1 varchar(100),@col2 varchar (100),@deptno int, @result varchar (200)
set @col1='enmae'
set @col2='job'
set @deptno=20

set @result=(select 'select'+space(1)+ @col1+','+@col2+' from emp where deptno='+CAST
(@deptno as varchar (10)))
execute (@result)



declare @col1 varchar(100),@col2 varchar (100),@deptno int, @result varchar (200)
set @col1='enmae'
set @col2='job'
set @deptno=20

set @result=(select 'select'+space(1)+ @col1+','+@col2+' from emp where deptno='
+CAST(@deptno as varchar (10)))	
execute (@result)

declare @col1 varchar(100),@col2 varchar (100),@deptno int, @result varchar (200)
set @col1='enmae'
set @col2='job'
set @deptno=20

set @result=(select 'select'+space(1)+ @col1+','+@col2+' from emp where deptno=')
execute sp_executesql @result,N'@deptno int',deptno=@deptno

select * from sys.tables
----------subqueryes-------------


select * from emp where SAL=(
select max(sal) as max from EMP)

select * from emp where SAL=(
select min(sal) as minimum from EMP)

select * from emp where SAL>(
select avg(sal) as average from emp)

-----------i want 2nd max records from emp-------------------
select * from emp
select * from emp where SAL<(
select max(sal) as max from EMP)

select * from emp where sal=(
select max (sal) from emp where sal<(select max(sal) from emp where 
SAL<(select max(sal) as ndmax from emp)))

select * from emp where SAL=(
select min(sal) from emp where sal>(select min(sal) as min from EMP ))

use sunilkumar

create table rrr ( id int, name varchar (100))

insert into rrr values (1,'su'),(2,'ni'),(3,'bg')

create table rrr_master (cid int)

insert into rrr_master values (1),(2)

select * from rrr
select * from rrr_master

delete from rrr_master where cid=2


select * from rrr where id not in (select cid from rrr_master)


select * from rrr
inner join rrr_master
on rrr.id=rrr_master.cid 



select * from rrr
inner join rrr_master 
on rrr.id=rrr_master.cid where rrr_master.cid is not null

select * from rrr where id in(
select id from rrr 
except
select cid from rrr_master)

---------------derived table---------------

create table g1(id int,salary money)
insert into g1 values (1,10),(2,20),(3,30)

----requirment------

id
salary
anualsalary------>salary*10
limit-------->annual*10
margin------->limit*10
avgamount--------->margin*10
netavgamount------>margin-avgamount

select * from 
(select * ,d.margin-d.avgamount as netavgmount
from
(select c.*,c.margin*10 as avgamount
from
(select b.id,b.salary,b.anualsalary,b.limit,b.limit*10 as margin 
from
(select a.id,a.salary,a.anualsalary,a.anualsalary*10 as limit 
from 
(select id,salary,salary*10 as anualsalary from g1) a)b)c)d)e

where e.netavgmount>0


------------i want second recordonly--------------

create table h1 (name varchar (100))
insert into h1 values ('sun'),('moon'),('nani')

select * from h1
use sunilkumar

select name,ROW_NUMBER()over (order by name) as rno from h1 where name='sun'


select a .* from 
(select name,ROW_NUMBER()over (order by name) as rno from h1)a where rno=2

select *  from
(select a.name, row_number()over (order by a.id) as rownum from 
(select name ,1 as id from h1)a )b where rownum=2

(select name,ROW_NUMBER()over (order by id) as rno from h1
----------------------highest salary---------------
select * from EMP
--select * from emp where sal=(
--(select MAX(sal) as max from EMP) )

select * from 
(select *,dense_rank() over (order by sal desc) as dencerank from EMP)a where dencerank=12


select * from emp where SAL=(
select max(sal) from emp where sal<(select max(sal) from EMP))

use sunilkumar

----select * from
----(select max(sal) from EMP where sal<(select max(sal) from Emp where SAL<(
----select max(sal) as max from EMP))

----------i want overall first lowest salaryfrom emp
select a.* from 
(select *, DENSE_RANK() over (order by sal asc) as dsnrk from EMP)a where a.dsnrk=1

--------i want department wise first heighest salary---------
select * from 
(select *,DENSE_RANK() over ( partition by deptno order by sal desc ) as drnk from emp)a
where drnk=1
select * from EMP

--------i want department wise 2nd  lowest salary---------

select * from 
(select *, dense_rank() over (partition by deptno order by sal ) as drnk from emp) a where drnk=2

------joints in subqueries-------

create table l1 (id int, name varchar (100))

insert into l1 values (1,'a'),(2,'b'),(3,'c')

create table l2 (id int, age int)

insert into l2 values (1,20),(1,19),(2,20),(2,25)

select * from l1
select * from l2


delete from l1 where name='25'



select * from l1


select * from 
(select *,DENSE_RANK() over (partition by id order by age desc)as dens  from l2)a where a.dens=2


select a.id,a.name,b.age 
from (select id,name from l1)a
join
(select x.id,x.age from 
(select *,DENSE_RANK() over (partition by id order by age desc)as dens  from l2)x where x.dens=1)b
on a.id=b.id


select * from EMP
select * from DEPT


select d.deptno,d.dname,e.sal 
from emp e join  DEPT d on e.DEPTNO=d.DEPTNO order by DNAME asc


select * from emp inner join dept d on emp_deptno=dept_deptno

---------------------------------------joints-----------------------------------------------------------------
use sunilkumar

select * from sys.tables
select * from EMP
select * from DEPT
select * from sunil_123
select * from 
--------------------------------------inner join--------------
select empno,ename,job,hiredate,comm,mgr,sal,DNAME,LOC from emp inner join DEPT on emp.DEPTNO=DEPT.DEPTNO

-------------------------------------left join 

select  EMP.empno,EMP.ename,EMP.job,EMP.hiredate,EMP.comm,EMP.mgr,EMP.sal,DEPT.DNAME,DEPT.LOC
from EMP left join DEPT on emp.DEPTNO=DEPT.DEPTNO
---------------------or
select empno,ename,job,hiredate,comm,mgr,sal,LOC from emp left join DEPT on emp.DEPTNO=dept.DEPTNO

select empno,ename,job,hiredate,comm,mgr,sal from EMP full join dept on emp.DEPTNO=dept.DEPTNO

select empno,ename,job,hiredate,comm,mgr,sal from emp inner join DEPT on emp.DEPTNO=dept.DEPTNO
full join sunil_123 on emp.DEPTNO=sunil_123.[Row ID] inner join student_1 on emp.EMPNO=student_1.[Row ID]

select * from l1
select * from l2
select * from g22


select l1.id as clsid,l1.name as clsname,l2.age as clsage, g22.place as clsplace from l1
inner join l2 on l1.id=l2.id
inner join g22 on l1.id=g22.uid

select * from emp
select * from DEPT

select e.empno,e.ename,e.job,e.sal,d.DNAME    from emp
left join DEPT
on e.deptno=d.deptno
where COMM is not null
use sunilkumar

select empno,ename,job,hiredate,comm,mgr,sal from emp inner join DEPT on emp.DEPTNO=dept.DEPTNO
where ENAME = 'smith'

----------------------------------------------------------------------------------------------------
self join

use sunilkumar

create table cricket_details
(
team varchar (max),
ag_team varchar (max),
won varchar (max),
los varchar (max)
)

insert into cricket_details (team,ag_team,won,los ) values ('ind','pak','ind','pak'),
('pak','slk','slk','pak'),('slk','ind','ind','slk')
insert into cricket_details (ag_team ) values ('pak','slk','ind')
insert into cricket_details (won) values ('ind','slk','ind')
insert into cricket_details (los) values ('pak','pak','slk')

select * from cricket_details

select  a.team,b.los from cricket_details a
inner join cricket_details b 
on a.team=b.los
where b.los is null

create table custid (id int )
insert into custid values (1),(2),(3),(4)

create table custermerid (id int )
insert into custid values (5),(5),(7),(8)


select * from custid
except
select * from custermerid



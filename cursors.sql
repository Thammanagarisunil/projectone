use sunilkumar

--------------------using curser----------------------------------

select ENAME from EMP

declare @name varchar(100)
declare c1 cursor for
select ENAME from EMP
open c1
fetch next from c1 into @name
while @@FETCH_STATUS=0
begin

select @name
fetch next from c1 into @name
end
close c1
deallocate c1

-----------------using wile loop------------

declare @start int,@end int
set @start=1
select a.ename from (select ename,ROW_NUMBER() over (order by ename) as emp1 from EMP) a where  emp1=1

-----------------------------------------------------------------------------------------------------------------

use sunilkumar

declare @name varchar (100)
declare c1 cursor for 
select JOB from emp
open c1
fetch next from c1 into @name
while @@FETCH_STATUS=0
begin

select @name
fetch next from c1 into @name
end
close c1
deallocate c1

declare @name varchar (100)
declare c1 cursor for
select empno from EMP
open c1
fetch next from c1 into @name 
while @@FETCH_STATUS=0
begin
select @name
fetch next from c1 into @name 
end
close c1
deallocate c1

declare @name varchar (100)
declare c1 cursor for
select ename  from emp
open c1
fetch next from c1 into @name
while @@FETCH_STATUS=0
begin

select @name
fetch next from c1 into @name
end
close c1
deallocate c1


select * from EMP
declare @name varchar (100)
declare c1 cursor for 
select hiredate from EMP
open c1
fetch next from c1
while @@FETCH_STATUS=0
begin
select @name
fetch next from c1 into @name
end
close c1
deallocate c1

declare @name varchar (100) 
declare c1 cursor for
select ename from emp
open c1
fetch next from c1 into @name 
while @@FETCH_STATUS=0
begin
select @name as ename
fetch next from c1 into @name
end
close c1
deallocate c1


-----------------------------------------------------------------

create function datefunction int
return int
as
begin
declare @age int
set @age = DATEDIFF(YEAR,@age,GETDATE())
select @age

declare @name varchar (100)
declare c1 cursor for 
select ename from emp
open c1
fetch next c1 into @name
while @@FETCH_STATUS=0
select @name
fetch next c1 for @name
close c1
deallocate c1

select GETDATE()
select GETDATE()
select  day (GETDATE())
select month (GETDATE())
select year (GETDATE())


--------------------datepart------------


select DATEPART(dd,getdate())
select DATEPART(MM,getdate())
select DATEPART(YY,getdate())

-----------------------dateadd---------------------

select DATEADD(dd,20,getdate())
select DATEADD(MM,-12,getdate())
select DATEADD(YY,-1,getdate())
select DATEADD(dd,1,getdate())


-----------datediff-------

select DATEDIFF(dd,'2022-10-17',GETDATE())

--------------datename-----------
select DATENAME(mm,getdate())
select DATENAME(YYYY,getdate())
select DATENAME(DW,getdate())
------------------------eomonth--------------

select EOMONTH(getdate())

---------------------------------------------------
use sunilkumar

declare @name varchar (100)
declare c1 cursor for
select ename from emp
open c1
fetch next from c1 into @neme
WHILE @@FETCH_STATUS = 0

begin
select @name
fetch next from c1 into @name
end
close c1
deallocate c1


DECLARE @sunilkumar VARCHAR(50) -- database name 
DECLARE @path VARCHAR(256) -- path for backup files 
DECLARE @fileName VARCHAR(256) -- filename for backup 
DECLARE @fileDate VARCHAR(20) -- used for file name 

SET @path = 'D:\New folder' 

SELECT @sunilkumar = CONVERT(VARCHAR(20),GETDATE(),112) 

DECLARE db_cursor CURSOR FOR 
SELECT sunilkumar 
FROM MASTER.dbo.sysdatabases 
WHERE name NOT IN ('master','model','msdb','tempdb') 

OPEN db_cursor  
FETCH NEXT FROM db_cursor INTO @name  

WHILE @@FETCH_STATUS = 0  
BEGIN  
      SET @fileName = @path + @name + '_' + @fileDate + '.BAK' 
      BACKUP DATABASE @name TO DISK = @fileName 

      FETCH NEXT FROM db_cursor INTO @name 
END 

CLOSE db_cursor  
DEALLOCATE db_cursor 


select count(distinct mgr),count(distinct comm) from emp
select * from EMP

select * from emp where sal>2000 and YEAR(HIREDATE)=1981

select ename,sal from EMP group by SAL 
select DEPTNO,JOB from EMP
group by DEPTNO,JOB


select deptno from EMP

----DateFunctions---
use sunilkumar

select * from EMP

select * from EMP where datename(dw,HIREDATE)='saturday'
select * from EMP where DATENAME(dw,hiredate)='sunday'
select * from emp where  year(HIREDATE)=1981
select *,DATENAME(dw,hiredate) as days from emp where DATENAME(dw,hiredate) in ('saturday',  'sunday')

select datediff(YYYY,0,GETDATE()-122)

select dateadd(mm,(datediff(mm,0,GETDATE())-1),0)


select DATEDIFF(mm,0,getdate())

select DATEADD(mm,(datediff(mm,0,getdate())-1),0)


select dateadd(YYYY,DATEDIFF(YYYY,0,getdate()-1),0)

select dateadd(mm,(DATEDIFF(mm,0,getdate())-1),0)

select DATEADD(dd,(datediff(DD,0,getdate())-1),0)


use sunilkumar

select GETDATE()

select day('08/03/1997')
select day(getdate())
select month(getdate())
select year(getdate())
select getdate ()
select DAY('2022-06-17 20:55:00.717')
select day(getdate())
select MONTH(getdate())
select year(getdate())

--------------datepart-------
select datepart (dd,'08/03/1997')
select datepart (dd,getdate())
select datepart (dd,'08/03/1997')
select datepart (MM,'08/03/1997')
select datepart(dd,getdate())
select datepart (mm,getdate())

----------dateadd--------------

select dateadd(YY,-1,GETDATE())
select DATEADD(dd,10,getdate())
select DATEADD(mm,-1,getdate())
select dateadd (yy,-1,getdate())


select dateadd(mm,(datediff(mm,0,GETDATE())-1),0)

select DATEADD(mm,(datediff(mm,0,getdate())-1),0)


----Exception Handling-------


-------------------------declaration-------------
declare 
  @number1 int,
  @number2 int,
  @result real


  set @number1=10
  set @number2=0
  begin try
            set @result=@number1/@number2
			print (@result)
end try

begin catch
       print ('you cannot divided by zero')
end catch


--------------------------store procedure-------------


create proc pr_exceptionhd
@number1 int,@number2 int
as 
begin

declare 
  @result int
  set @result=@number1+@number2
  begin try
  print('sum is'+@result)
  end try
  begin catch

  select 
   ERROR_NUMBER() as errornumber
   ,ERROR_SEVERITY() as errorseverty
   ,ERROR_STATE() as state
   ,ERROR_PROCEDURE() as procedure
   ,error_message() as message
   ,error_line()as line
   end catch
   end

   ----------------------------------------mathematical functions---------------------------

select ABS(-10)
select ABS(10)

select square(4)
select SQRT(5)

select power (2,4)
select power (2,16)

select PI()

select SIGN(0000)

--select SIN(1)
--select SIN(-1)



--select SIN(10)
--select SIN(-2)


----------select round (2,4,2)



select ceiling (-3.99)

select CEILING(4.06)

select FLOOR(2.5)

select FLOOR(-2.5)


-----------Get Data--------


select * from EMP
SELECT 
    empno, 
    ename,
	job,
	hiredate,
    sal,
	Deptno
FROM emp
ORDER BY 
    sal desc
OFFSET 5 ROWS
FETCH first 5 ROWS ONLY;



SELECT 
    ename,
    CASE
        WHEN sal < 3000 THEN 'Low'
        WHEN sal >= 3000 AND sal <= 5000 THEN 'Average'
        WHEN sal > 5000 THEN 'High'
    END  evaluation
FROM
    emp;


	SELECT 
    ENAME, 
    sal *1.1 AS new_salary
FROM
    emp;



	SELECT
     [FirstName]
    ,COUNT(1) AS RowCnt
FROM [Person].[Person]
WHERE [FirstName] LIKE 'Rob%'
GROUP BY [FirstName];


select * from emp

select job,COUNT(*) as counta 
from EMP where ENAME like 'smith'
group by (deptno)

select count (JOB) as country,job from EMP
group by JOB
having (count(*)>1

----------------case-------------

use sunilkumar
select * from LikelytoChurn
select * from [dbo].[Market_Aug2018$]
select * from [dbo].[Market_Aug2021$]

select auditor,ROW_NUMBER() over (order by auditor ) 
as rownumber from [dbo].[Market_Aug2018$] 

1(a)

 select COUNT(Auditor) as MarketShare_Funds, Auditor from [dbo].[Market_Aug2018$] group by Auditor 
union all 
select COUNT (Auditor) MarketShare_Funds, Auditor from [dbo].[Market_Aug2021$] group by Auditor

1(b)

select sum (Assets_Dollar) as MarketShare_Assets from [dbo].[Market_Aug2018$] group by Assets_Dollar
union all 
select sum (Assets_Dollar) as MarketShare_Assets from [dbo].[Market_Aug2021$] group by Assets_Dollar

2
 Top 
3 biggest gainers
select top 3 Assets_Dollar from [dbo].[Market_Aug2018$]  order by Assets_Dollar
Top 3 biggest losers
select top 3 Assets_Dollar from [dbo].[Market_Aug2018$]  order by Assets_Dollar desc

3 biggest gainers
select top 3 Assets_Dollar from [dbo].[Market_Aug2021$] order by Assets_Dollar 
Top 3 biggest losers
select top 3 Assets_Dollar from [dbo].[Market_Aug2021$] order by Assets_Dollar desc

3(a)

select [dbo].[Market_Aug2018$].FundName,[dbo].[Market_Aug2021$].FundName from [dbo].[Market_Aug2018$]
right join [dbo].[Market_Aug2021$]
on [dbo].[Market_Aug2018$].FundName=[dbo].[Market_Aug2021$].FundName

3(b)

select [dbo].[Market_Aug2018$].FundName,[dbo].[Market_Aug2021$].FundName from 
[dbo].[Market_Aug2018$]
left join [dbo].[Market_Aug2021$] 
on [dbo].[Market_Aug2018$].FundName=[dbo].[Market_Aug2021$].FundName 


3(c)

select [dbo].[Market_Aug2018$].FundName,[dbo].[Market_Aug2021$].FundName from [dbo].[Market_Aug2018$]
inner join [dbo].[Market_Aug2021$]
on [dbo].[Market_Aug2018$].FundName=[dbo].[Market_Aug2021$].FundName


3(d)

select [dbo].[Market_Aug2018$].FundName,[dbo].[Market_Aug2021$].FundName from [dbo].[Market_Aug2018$]
full join [dbo].[Market_Aug2021$]
on [dbo].[Market_Aug2018$].FundName=[dbo].[Market_Aug2021$].FundName



select distinct Adviser, Auditor from [dbo].[Market_Aug2021$]
intersect 
select distinct Adviser, Auditor from [dbo].[Market_Aug2021$]

4(a)
 select distinct Adviser, Auditor from [dbo].[Market_Aug2021$]

 4(b)

SELECT * FROM [dbo].[Market_Aug2021$] WHERE Auditor=( SELECT Auditor, MAX(Auditor)
from [dbo].[Market_Aug2021$])

select Adviser, Auditor from [dbo].[Market_Aug2018$]
union all 
select Adviser, Auditor from [dbo].[Market_Aug2021$]  

5

alter table [dbo].[Market_Aug2021$] add AssetSizeBand int
select * from [dbo].[Market_Aug2021$]


update [dbo].[Market_Aug2021$] set AssetSizeBand =(select Assets_Dollar from [dbo].[Market_Aug2021$]
where Assets_Dollar > 0 and Assets_Dollar 
<=1000000000)  as 0-1BN
update [dbo].[Market_Aug2021$] set AssetSizeBand =(
select Assets_Dollar from [dbo].[Market_Aug2021$]where Assets_Dollar > 1 and Assets_Dollar 
<=2000000000 ) as 1-2BN
update [dbo].[Market_Aug2021$] set AssetSizeBand =(
select Assets_Dollar from [dbo].[Market_Aug2021$]where Assets_Dollar > 2 and Assets_Dollar 
<=3000000000 )as 2-3BN
update [dbo].[Market_Aug2021$] set AssetSizeBand =(
select Assets_Dollar from [dbo].[Market_Aug2021$]where Assets_Dollar > 3000000000  ) as <=3BN) 
where AssetSizeBand is NULL

6

select * from [dbo].[Market_Aug2021$] where Assets_Dollar>3000000000 order by Assets_Dollar desc


----some practice data--------------

--first method
insert into tablename values (column1,column2,colum3)
--second method
insert into voterlist1 (vid,vname) values (64539,'sunil')
select * from voterlist_3
--3rd method
insert into voterlist1 values (58652,'nani','21'),(58652,'seja','19'),(58652,'vasu','97'),(58652,'vasi1','67'),(58652,'nani','99')
--Inserting data from Existing Table To Another Table (4th method)
insert into voterlist2 select * from voterlist1
select * into voterlist_new from voterlist1
select * into voterlist_3 from voterlist1 
--3rd method
insert into voterlist1 values (131996,'vasi','23'),(131996,'vasu','23')
insert into voterlist_3 values (19967,'prabhas','30'),(19967,'prabhas','30')
select * from voterlist_3
update voterlist_3 set vid=64532 where vid=64539
update voterlist_3 set 
[dbo].
select * from [dbo].[voterlist1]
insert into  values (23456789,'seja',24)
update [voterlist] set votername='sunil' where voterid=23456789




update voterlist1 set votername='chintu' where voterid=56984231
update voterlist1 set vname='nani' where vid=58652
alter table voterlist1 add salary varchar (400)
insert into  voterlist1 (salary) values (30000),(40000),(50000),(60000),(70000)
update voterlist1 set vname='sunil' where salary=30000
delete voterlist1 where vname='null'
--identity property
print 12-02-1997
select * from 
print 'jsgjsgsfh'
select 
--print particular dAta location name it is caled (variable)
select * from voterlist1
--identity property
create table bankerdetails(cusid int identity (1,2),cusname varchar (max),cusamount varchar (max),cusaddres varchar (max))
select * from bankersdetails3
insert into bankerdetails values (10235456,'vasu','tirupathi')
dbcc chekidenty (bankerdetails,reseed,101)
create table bankerdetails1 (usid int,cusname varchar(200),cusadd varchar (20))
create table bankersdetails3 (cusid int identity (2,4),cusname varchar(max))
insert into bankersdetails4 values('vasavi')
create table bankersdetails4 (cusid int identity (10000,100000),cusname varchar(max))
insert into bankersdetails3 values('vasavi')
insert into bankersdetails4 values('vasavi')
insert into bankersdetails4 values('pallavi')
insert into bankersdetails4 values('vasavi')
insert into bankersdetails4 values('vasavi')
insert into bankersdetails3 (cusid,cusname)values(102,'nani')
dbcc checkident (bankersdetails3,reseed,101)
set identity_insert bankersdetails3 off


------practice----

create table t1 (id int)
create table t2 (id int)
insert into t1 values (10),(20),(30),(50)
insert into t2 values (10),(40),(50)
select * from t1
select * from t2
--inner join
select * from t1 inner join t2 on t1.id=t2.id
select * from t1 left join t2 on t1.id=t2.id
select * from t1 right join t2 on t1.id=t2.id
select * from t1 full join t2 on t1.id=t2.id
delet table t110
select * from emp
select * from DEPT
select * from location
select ename as employename,empno,mgr, e.deptno from emp e inner join dept d on e.deptno=d.deptno
select ename as employename,empno,mgr, e.deptno from emp as e inner join dept as d on e.deptno=d.deptn
select ename as employename from emp
select  ename from emp
declare @a int =1000
print @a
select deptno from emp intersect select deptno from DEPT
--ddl commands 
create 
alter 
drop 
truncate
--dml commands
insert 
update 
delete 
merge
--dql commands 
select
print
select * from emp
select empno,ename,comm,deptno from emp
select deptno as departnumber from emp
alter table emp alter column departnumber varchAr(23)
sp_rename 'deptno','departmentnumber'
alter table emp set where deptno=departnumber
alter table emp 
change column deptno to departmentnumber;
sp_rename emp
sp_rename 'table_name.old_column_name', 'new_column_name', 'COLUMN';
sp_rename emp,'deptno.departmentnumber',column;
sp_rename 'emp.deptno','departnumber','column';
select * from emp
7934	MILLER	CLERK	7782	1982-01-23 00:00:00.000	1300.00	NULL	10

insert into emp values(85687,'sunil','it',0000,'1997-08-03',4500,01,1032)
insert into emp values(7934,'sunil','it',7783,'1984-01-23 00:00:00.000',1400.00,null,50)
insert into emp (departnumber) values (null)
alter table sunil_1 add primary key(empid);
select * from sunil_1
delete table emp where empno=null
delete empno,ename,job,mgr,hiredate,sal,comm,departnumber from emp where empno is null
delete emp
where (empno is null)
alter table emp add primary key(empno);
select * from emp 
delete emp 
sp_rename 'emp.ename','employe_name','column'
select * from bank1
alter table bank1 
change old_column_name1new_column_name1 nvarchar(20),
change old_column_name2new_column_name2 nvarchar(20),
change old_column_name3new_column_name3 nvarchar(20)
alter table bank1
change empidint to empnum int
select * from emp

alter table bank1 rename column empid to employe_id int
alter table emp
RENAME column empname to employename nvarchar(20);
alterER TABLE table_name RENAME COLUMN old_column_name TO new_column_name;
alter table bank1 rename column empname to employename;
alter table emp rename column job to emp_job;

ALTER TABLE table_name 
CHANGE old_column_name1 new_col_name1 Data Type,
CHANGE old_column_name2 new_col_name2 Data Type,
CHANGE old_column_name3 new_col_name3 Data Type;

ALTER TABLE table_name CHANGE old_column_name new_col_name Data Type AFTER column
select * from emp
 sp_rename 'emp.mgr','emp_mgr','column';
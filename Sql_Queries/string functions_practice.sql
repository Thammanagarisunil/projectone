select left(fullname ,charindex('@',fullname)-1) from customer_details

select fullname,CHARINDEX('@',fullname,charindex('@',fullname)+1) from customer_details

select STUFF(fullname,1,charindex('@',fullname),'')
from customer_details

select left(STUFF(fullname,1,charindex('@',fullname),'') ,charindex('@',STUFF
(fullname,1,charindex('@',fullname),''))-1) from customer_details

select STUFF(fullname,1,CHARINDEX('@',fullname,charindex('@',fullname)+1) ,'') from customer_details

select fullname,CHARINDEX('@',fullname,charindex('@',fullname)+1) from customer_details

select STUFF(fullname,1,CHARINDEX('@',fullname,charindex('@',fullname)+1) ,'') from customer_details

select LEFT(STUFF(fullname,1,CHARINDEX('@',fullname,charindex('@',fullname)+1) ,''), 
CHARINDEX('@',STUFF(fullname,1,CHARINDEX('@',fullname,charindex('@',fullname)+1) ,'')
)-1) from customer_details
use sunilkumar

select left(fullname,charindex('@',fullname)-1)as firstname from customer_details
selen
select STUFF(fullname,2,left(fullname,charindex('@',fullname)-1) ,'') from customer_details

select left (fullname,CHARINDEX('@',fullname)-1)from customer_details
select CHARINDEX(fullname,'@') from customer_details
select STUFF(fullname,1,charindex('@',fullname),'') from customer_details
select * from customer_details

select left (STUFF(fullname,1,charindex('@',fullname),''),CHARINDEX('@',STUFF(fullname,1,charindex('@',fullname),''))-1)
from customer_details

select STUFF(fullname,1,CHARINDEX('@',fullname,CHARINDEX('@',fullname)+1),'') from customer_details

select left(STUFF(fullname,1,CHARINDEX('@',fullname,CHARINDEX('@',fullname)+1),'')
,CHARINDEX('@',STUFF(fullname,1,CHARINDEX('@',fullname,CHARINDEX('@',fullname)+1),'')
)-1) from customer_details

select fullname,CHARINDEX('@',fullname,CHARINDEX('@',fullname ,CHARINDEX('@',fullname
)+1)+1)) from customer_details

select fullname,CHARINDEX('@',fullname,CHARINDEX('@',fullname,charindex('@',fullname)+1  ) +1 )
from customer_details

select LEFT(CHARINDEX('@',fullname,CHARINDEX('@',fullname,charindex('@',fullname)+1  ) +1 )
,charindex('@',CHARINDEX('@',fullname,CHARINDEX('@',fullname,charindex('@',fullname)+1  ) +1 )
)-1) from customer_details

select STUFF(fullname,1, CHARINDEX('@',fullname,CHARINDEX('@',fullname,charindex('@',fullname)+1  ) +1 )
, '')from customer_details


use sunilkumar

-------1st
select fullname,CHARINDEX('@', fullname) from customer_details
-------2nd 
select fullname,CHARINDEX('@', fullname,CHARINDEX('@', fullname)+1) from customer_details

----------3rd
select fullname,CHARINDEX('@', fullname,CHARINDEX('@', fullname,CHARINDEX('@', fullname)+1)+1) 
from customer_details
-------------------4th @-----
select fullname,
CHARINDEX('@',fullname,CHARINDEX ('@',fullname,CHARINDEX('@',fullname,CHARINDEX('@',fullname)+1)+1)+1) from 
customer_details

select left (fullname,'@') from customer_details



real time senarios
use sunilkumar

select * from EMP where JOB like 's'

select * from EMP where right( LEFT(job,3) ,1)='e'

select * from EMP where left (RIGHT(job,2),1)='n'

select * from emp where SUBSTRING(job,3,1)='n'

select ename,sal,comm,isnull(sal,0)+isnull(comm,0) as totalsal from EMP



create table jjj4 
(
ename varchar (100)
)
insert into jjj4 values ('a'),('b'),('null'),('null'),('null'),('c'),('d'),('e')



select ename, ISNULL(ename,'apple') as totalname from jjj4
select * from jjj4

select ename,ISNULL(ename,'sunil') as fullname from jjj4

select upper (left (ename,1))+SUBSTRING(ename,2 ,LEN(ename)-2)+upper(right(ename,1)) as fullname from EMP
select upper (left (ename,1)) from EMP
select SUBSTRING(ename,2 ,LEN(ename)-2) from EMP
select upper(right(ename,1))from EMP
select * from emp

select ename,LEFT(ename, len(ename)/2)as firstname+RIGHT(ename,len(ename)/2) as secondname from EMP
select ename,RIGHT(ename,len(ename)/2) from emp

select * from emp


select ename,(left(ename,2,len(ename)/
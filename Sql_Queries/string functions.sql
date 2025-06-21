----------string functions
------system functions (built in functions)
------these functions are inbult in system.
---------->string functions
-----date functions
------aggeregate functions 
------cast and convert functions
------mathematical functions
------rank functions (windows functions or analytical functions)


------user defined functions (t-sql)
-----these functions are created by user 

----------->string functions-----------------------
1) upper (columname or i/p)-----argument
-----its convert small to capital letters..

  select upper ('teju') as result

2) lower (columname or i/p)-----argument
-------its convert capital to small letters
   select lower('TEJU') as result
3) left (i/p, number of characters)
	
 select LEFT('teju',2)---te
 4) right (i/p, number_of_characters)
 select right('teju',3)---eju
 5) reverse(i/p or no-of-columns)
  select REVERSE('sunil')
  6)len ('sunil')---5
------ length function consider spaces as a count if spaces exists left side of the string.
--------len function does not consider as a spaces if SPACes exists right side of the string.
  select LEN('sunil')---5
  select LEN('sunil')
  7) ltrim(i/p or columname)
  select LTRIM(' naveenkumar')--------naveenkumar
  -----it removes the spaces in left side of the input
  8) rtrim (i/p or columname)

  select RTRIM('naveenkumar    ')-----naveenkumar
  select LEN(ltrim('  naveenkumar'))---11
  9)replicate('sk494646',3)
  select replicate('sk494646',3)
  10) substring(i/p,startposition,no_of_character)
  select SUBSTRING('sunilkumar',2,3)---uni
  select SUBSTRING('sunilkumar',4,3)---ilk
  11)replace('sunil','u','o')---it will replace the letter or word which we want
  select replace('sunil','u','o')
  12)stuff(i/p,startposition,no_of_characters,replacestarting)
  select STUFF('ramram',2,1,'o')---
  select STUFF('sk494646@gmail.com',3,7,'###############')
  ----replace vs stuff 
  -------both are used for replace purpose but if u want to replace particular position to particular position 
  -----then we need to go for stuff
  13)ascii('A')
-----ASCII- american standard code for information interchanging.
  select ascii('A')-----65---->capital letters start with 65
 select ascii('B')-----66
 select ASCII('a')----97------>small letters start with 97
 select ascii('b')----98
  select ascii('C')---67
   select ascii('c')--99
14) char(65)
select char(65)----A
select char(66)----B
select char(67)----C

select char(97)----a
select char(98)----b
select char(99)----c

15)charindex --it is used to find character position in a string

ex: apple
select CHARINDEX('p','apple')
select CHARINDEX('e','apple')
select CHARINDEX('l','apple')
select CHARINDEX('p','apple')
select CHARINDEX('e','elephante',2)

select SUBSTRING('sunil',2,3)
select STUFF('sunilkumar',3,5,'o')
select CHARINDEX('s','sunilkumar')
select LEFT(ename,2) from EMP


create table customer_details
(
fullname varchar (20)
)

insert into customer_details values ('teju@reddy@b@siva'),('sai@balaram@kv@sit'),
('sagar@b@reddy@kesav')

select fullname from customer_details

select left(fullname,CHARINDEX('@',fullname) ) as fname from customer_details

select 
----------------------fname
select STUFF(fullname,1,CHARINDEX('@',fullname), '') as fname from customer_details



------

declare @alpha_numeric_string varchar (1000), @start int, @end int,@space varchar (max)
set @alpha_numeric_string='khaidhino786chiru'
set @start=1
set @end=(select LEN(@alpha_numeric_string))
set @space=''
while @start<=@end 
begin

if SUBSTRING(@alpha_numeric_string ,@start ,1) like '[a-z]%'
begin
set @space=@space+  SUBSTRING(@alpha_numeric_string ,@start ,1) 
end
set @start=@start+1
end

select @space
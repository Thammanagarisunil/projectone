
use sunilkumar

CREATE TABLE Employee_Test
(
Emp_ID INT Identity,
Emp_name Varchar(100),
Emp_Sal Decimal (10,2)
)

INSERT INTO Employee_Test VALUES ('Anees',1000);
INSERT INTO Employee_Test VALUES ('Rick',1200);
INSERT INTO Employee_Test VALUES ('John',1100);
INSERT INTO Employee_Test VALUES ('Stephen',1300);
INSERT INTO Employee_Test VALUES ('Maria',1400);

	
	CREATE TABLE Employee_Test_Audit
(
Emp_ID int,
Emp_name varchar(100),
Emp_Sal decimal (10,2),
Audit_Action varchar(100),
Audit_Timestamp datetime
)

CREATE TRIGGER trg_AfterInsert 
ON Employee_Test
FOR INSERT
AS
	declare @empid int;
	declare @empname varchar(100);
	declare @empsal decimal(10,2);
	declare @audit_action varchar(100);

	select @empid=i.Emp_ID from inserted i;	
	select @empname=i.Emp_Name from inserted i;	
	select @empsal=i.Emp_Sal from inserted i;	
	set @audit_action='Inserted Record -- After Insert Trigger.';

	insert into Employee_Test_Audit
           (Emp_ID,Emp_Name,Emp_Sal,Audit_Action,Audit_Timestamp) 
	values(@empid,@empname,@empsal,@audit_action,getdate());

	PRINT 'AFTER INSERT trigger fired.'
GO

select   * from Employee_Test where Emp_ID=5
select * from Employee_Test_Audit_delete
delete from Employee_Test where Emp_ID=4


CREATE TABLE Employee_Test_Audit_delete
(
Emp_ID int,
Emp_name varchar(100),
Emp_Sal decimal (10,2),
Audit_Action varchar(100),
Audit_Timestamp datetime
)

alter TRIGGER trg_Afterdelete 
ON Employee_Test
FOR INSERT
AS
	declare @empid int;
	declare @empname varchar(100);
	declare @empsal decimal(10,2);
	declare @audit_action varchar(100);

	select @empid=i.Emp_ID from inserted i;	
	select @empname=i.Emp_Name from inserted i;	
	select @empsal=i.Emp_Sal from inserted i;	
	set @audit_action='delete Record -- After Insert Trigger.';

	insert into Employee_Test_Audit_delete
           (Emp_ID,Emp_Name,Emp_Sal,Audit_Action,Audit_Timestamp) 
	values(@empid,@empname,@empsal,@audit_action,getdate());

	PRINT 'AFTER delete trigger fired.'
GO
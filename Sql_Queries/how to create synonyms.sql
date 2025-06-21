--Create Synonyms Locally

create synonym [dbo].[mytable1] for [sunilkumar].[dbo].[emp]
USE sunilkumar
GO
CREATE SYNONYM [dbo].[Customer] FOR [SalesOrders].[dbo].[Customers]
GO
--Remote Synonyms
--Step 1
--Create Linked server

USE [master]
GO

/****** Object:  LinkedServer [TBSSQL\SQLPROD]    Script Date: 3/5/2015 3:38:34 PM ******/
EXEC master.dbo.sp_addlinkedserver @server = N'TBSSQL\SQLPROD', @srvproduct=N'SQL Server'
 /* For security reasons the linked server remote logins password is changed with ######## */
EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'TBSSQL\SQLPROD',@useself=N'False',@locallogin=NULL,@rmtuser=N'dbmanager',@rmtpassword='########'

GO
EXEC master.dbo.sp_serveroption @server=N'TBSSQL\SQLPROD', @optname=N'collation compatible', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'TBSSQL\SQLPROD', @optname=N'data access', @optvalue=N'true'
GO

EXEC master.dbo.sp_serveroption @server=N'TBSSQL\SQLPROD', @optname=N'dist', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'TBSSQL\SQLPROD', @optname=N'pub', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'TBSSQL\SQLPROD', @optname=N'rpc', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'TBSSQL\SQLPROD', @optname=N'rpc out', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'TBSSQL\SQLPROD', @optname=N'sub', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'TBSSQL\SQLPROD', @optname=N'connect timeout', @optvalue=N'0'
GO

EXEC master.dbo.sp_serveroption @server=N'TBSSQL\SQLPROD', @optname=N'collation name', @optvalue=null
GO

EXEC master.dbo.sp_serveroption @server=N'TBSSQL\SQLPROD', @optname=N'lazy schema validation', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'TBSSQL\SQLPROD', @optname=N'query timeout', @optvalue=N'0'
GO

EXEC master.dbo.sp_serveroption @server=N'TBSSQL\SQLPROD', @optname=N'use remote collation', @optvalue=N'true'
GO

EXEC master.dbo.sp_serveroption @server=N'TBSSQL\SQLPROD', @optname=N'remote proc transaction promotion', @optvalue=N'true'
GO

-- Part 2 Create Remote Synonyms

USE sunilkumar
GO

/****** Object:  Synonym [dbo].[Mycustomer]    Script Date: 3/5/2015 3:47:20 PM ******/
CREATE SYNONYM [dbo].[Mycustomer] FOR [TBSSQL\SQLPROD].[SalesOrders].[dbo].[Customers]
GO
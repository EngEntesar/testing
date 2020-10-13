SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO




/****** Object:  Stored Procedure dbo.AllPermissions    Script Date: 03/04/2004 11:52:50 AM ******/

/****** Object:  Stored Procedure dbo.AllPermissions    Script Date: 03/04/2004 11:38:50 AM ******/

/****** Object:  Stored Procedure dbo.AllPermissions    Script Date: 25/06/2002 11:41:37 AM ******/
CREATE PROCEDURE [dbo].[frwAllPermissions]  AS
set nocount on
SELECT CONVERT(varchar,1) + [frwObjects].Object_Name AS Perm
FROM [frwObjects] where [Show] = 1 
union 
SELECT CONVERT(varchar,2) + [frwObjects].Object_Name AS Perm
FROM [frwObjects] where [Add] = 1
union 
SELECT CONVERT(varchar,3) + [frwObjects].Object_Name AS Perm
FROM [frwObjects] where [Edit] = 1
union 
SELECT CONVERT(varchar,4) + [frwObjects].Object_Name AS Perm
FROM [frwObjects] where [Delete ] = 1
union 
SELECT CONVERT(varchar,5) + [frwObjects].Object_Name AS Perm
FROM [frwObjects] where [Print] = 1
union 
SELECT CONVERT(varchar,6) + [frwObjects].Object_Name AS Perm
FROM [frwObjects] where [Approval] = 1



GO

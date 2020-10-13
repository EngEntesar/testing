SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO


Create PROCEDURE [dbo].[frwSubPermissions] 
@Objects varchar(max)
 AS
set nocount on
SELECT CONVERT(varchar,1) + [frwObjects].Object_Name AS Perm
FROM [frwObjects] where [Show] = 1  and Object_Name in (@Objects)
union 
SELECT CONVERT(varchar,2) + [frwObjects].Object_Name AS Perm
FROM [frwObjects] where [Add] = 1 and Object_Name in (@Objects)
union 
SELECT CONVERT(varchar,3) + [frwObjects].Object_Name AS Perm
FROM [frwObjects] where [Edit] = 1 and Object_Name in (@Objects)
union 
SELECT CONVERT(varchar,4) + [frwObjects].Object_Name AS Perm
FROM [frwObjects] where [Delete] = 1 and Object_Name in (@Objects)
union 
SELECT CONVERT(varchar,5) + [frwObjects].Object_Name AS Perm
FROM [frwObjects] where [Print] = 1 and Object_Name in (@Objects)
union 
SELECT CONVERT(varchar,6) + [frwObjects].Object_Name AS Perm
FROM [frwObjects] where [Approval] = 1 and Object_Name in (@Objects)

GO

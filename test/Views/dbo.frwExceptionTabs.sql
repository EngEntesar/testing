SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[frwExceptionTabs]
AS
SELECT DISTINCT dbo.frwDefinitions.TabName, dbo.frwOBJECTS.Object_Name AS Object

FROM         dbo.frwDefinitions INNER JOIN
                      dbo.frwOBJECTS ON dbo.frwDefinitions.Object = dbo.frwOBJECTS.OBJECT



GO

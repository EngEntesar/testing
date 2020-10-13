SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO



 


CREATE VIEW [dbo].[frwSortedObjects]
AS
SELECT TOP (100) PERCENT 
dbo.frwOBJECTS.Object_Name, dbo.frwOBJECTS.OBJECTCAT_Sort, dbo.frwObjectCat.OBJECTCAT_NAME, dbo.frwObjectCat.Sort, 
               dbo.frwObjectCat.OBJECTCAT_ID ,  ROW_NUMBER() OVER (ORDER BY dbo.frwObjectCat.Sort, dbo.frwOBJECTS.OBJECTCAT_Sort ) AS RowNumber

FROM  dbo.frwOBJECTS INNER JOIN
               dbo.frwObjectCat ON dbo.frwOBJECTS.OBJECTCAT_ID = dbo.frwObjectCat.OBJECTCAT_ID
ORDER BY dbo.frwObjectCat.Sort, dbo.frwOBJECTS.OBJECTCAT_Sort




GO

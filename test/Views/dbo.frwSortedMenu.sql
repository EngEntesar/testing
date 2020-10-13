SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF
GO





CREATE VIEW [dbo].[frwSortedMenu]
AS
SELECT OBJECTCAT_ID, OBJECTCAT_NAME, Description, OBJECTCAT_NAMEAR, OBJECTCAT_Parent, Sort, Icon, GUID , ROW_NUMBER() OVER (ORDER BY frwObjectCat.Sort) AS RowNumber
FROM  dbo.frwObjectCat 



GO

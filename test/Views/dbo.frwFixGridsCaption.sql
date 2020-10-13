SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[frwFixGridsCaption]
AS
SELECT dbo.frwDefinitions.Field, dbo.frwDefinitions.Control, dbo.frwObjects.OBJECT, dbo.frwDefinitions.RighToLeftLanguage AS NameAr, dbo.frwDefinitions.Caption AS NameEn, dbo.frwObjects.Object_Name AS ObjectEn, 
             dbo.frwObjects.Object_NameAR AS ObjectAr
FROM   dbo.frwObjects INNER JOIN
             dbo.frwDefinitions ON dbo.frwObjects.OBJECT = dbo.frwDefinitions.LinkTable
WHERE (dbo.frwDefinitions.Control = 'Grid') OR
             (dbo.frwDefinitions.Control = 'GridTab')


GO

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[frwCaptions]
AS
SELECT     dbo.frwFields.Field, ISNULL(dbo.frwDefinitions.Caption, dbo.frwFields.FieldName) AS Caption, ISNULL(dbo.frwDefinitions.RighToLeftLanguage, 
                      dbo.frwFields.FieldName) AS RightToLeft, dbo.frwFields.name AS [Table], dbo.frwDefinitions.Invisible
FROM         dbo.frwFields LEFT OUTER JOIN
                      dbo.frwDefinitions ON dbo.frwFields.Field = dbo.frwDefinitions.Field



GO

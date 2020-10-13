SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO


Create View frwFieldsNameFix as 
SELECT dbo.frwDefinitions.Field AS DField, dbo.frwFields.Field AS FField
FROM  dbo.frwDefinitions INNER JOIN
         dbo.frwFields ON dbo.frwDefinitions.Field = dbo.frwFields.Field
GO

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[frwTranslation]
AS
SELECT    Field, Caption, RighToLeftLanguage AS [Arabic Caption],GUID, Control
FROM         dbo.frwDefinitions



GO

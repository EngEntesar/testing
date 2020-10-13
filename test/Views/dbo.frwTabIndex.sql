SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[frwTabIndex]
AS
SELECT     TOP (100) PERCENT Field, TabName, TabIndex, Control, Caption, RighToLeftLanguage AS [Arabic Caption], ToolTip, RighToLeftToolTip AS [Arabic ToolTip], Mandatory, 
                      Enabled, Invisible, GUID
FROM         dbo.frwDefinitions
ORDER BY TabName, TabIndex



GO

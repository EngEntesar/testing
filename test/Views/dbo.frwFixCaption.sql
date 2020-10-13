SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[frwFixCaption]
AS
SELECT     dbo.frwDefinitions.Field, dbo.frwDefinitions.Control, dbo.frwDefinitions.LinkTable, dbo.frwDefinitions.LinkField, dbo.frwDefinitions.DisplayField, 
                      dbo.frwDefinitions.TabName, dbo.frwDefinitions.TabIndex, dbo.frwDefinitions.Enabled, dbo.frwDefinitions.Invisible, dbo.frwDefinitions.GUID, 
                      dbo.frwDefinitions.RighToLeftLanguage, dbo.frwDefinitions.Formula, dbo.frwDefinitions.EventID, dbo.frwDefinitions.Reminder_Formula, 
                      dbo.frwDefinitions.Reminder_Report, dbo.frwDefinitions.Reminder_Msg, dbo.frwDefinitions.[Default], dbo.frwDefinitions.Caption, frwDefinitions_1.Control AS Expr1, 
                      frwDefinitions_1.DisplayField AS OldCaption
FROM         dbo.frwDefinitions INNER JOIN
                      dbo.frwDefinitions AS frwDefinitions_1 ON dbo.frwDefinitions.Field = frwDefinitions_1.Field AND dbo.frwDefinitions.Control <> frwDefinitions_1.Control
WHERE     (frwDefinitions_1.Control = 'Caption')



GO

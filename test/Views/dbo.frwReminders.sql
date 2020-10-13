SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[frwReminders]
AS
SELECT     dbo.frwDefinitions.Field, dbo.frwDefinitions.Period, dbo.frwDefinitions.PeriodType, dbo.frwPeriouds.Type, dbo.frwDefinitions.NotifyRequester, 
                      dbo.frwDefinitions.Reminder_Formula, dbo.frwDefinitions.Reminder_Msg, CAST(dbo.frwReportCategories.ReportCategory_Path AS varchar(1000)) 
                      + '\' + dbo.frwReports.Report_FileName AS Report, dbo.frwOBJECTS.Object_Name, dbo.frwOBJECTS.Requester, dbo.frwOBJECTS.OBJECT, 
                      dbo.frwDefinitions.LastSentTime
FROM         dbo.frwOBJECTS INNER JOIN
                      dbo.frwDefinitions INNER JOIN
                      dbo.frwPeriouds ON dbo.frwDefinitions.PeriodType = dbo.frwPeriouds.ID ON dbo.frwOBJECTS.OBJECT + '.' = LEFT(dbo.frwDefinitions.Field, 
                      LEN(dbo.frwOBJECTS.OBJECT) + 1) INNER JOIN
                      dbo.frwReports INNER JOIN
                      dbo.frwReportCategories ON dbo.frwReports.Report_CategoryID = dbo.frwReportCategories.ReportCateogry_ID ON 
                      dbo.frwOBJECTS.DefaultPrint = dbo.frwReports.GUID
WHERE     (dbo.frwDefinitions.NotifyRequester = 1) AND (NOT (dbo.frwOBJECTS.Requester IS NULL))



GO

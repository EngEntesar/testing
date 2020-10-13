SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[frwNotifications]
AS
SELECT     dbo.frwDefinitions.Reminder_Msg, dbo.frwDefinitions.Reminder_ArabicMsg, dbo.frwDefinitions.Reminder_Formula, dbo.frwNotificationList.User_Name, 
                      dbo.frwPeriouds.Type, dbo.frwNotificationList.Period, CAST(dbo.frwReportCategories.ReportCategory_Path AS varchar(1000)) 
                      + '\' + dbo.frwReports.Report_FileName AS Report, dbo.frwUsers.EMail, dbo.frwNotificationList.LastSentTime, dbo.frwNotificationList.GUID, 
                      dbo.frwOBJECTS.Object_Name, dbo.frwOBJECTS.GUID AS ObjectGUID, dbo.frwDefinitions.Field, dbo.frwReports.Report_Driver, 
                      dbo.frwReports.Report_DNS, dbo.frwOBJECTS.OBJECT
FROM         dbo.frwReportCategories INNER JOIN
                      dbo.frwReports ON dbo.frwReportCategories.ReportCateogry_ID = dbo.frwReports.Report_CategoryID INNER JOIN
                      dbo.frwOBJECTS INNER JOIN
                      dbo.frwDefinitions ON dbo.frwOBJECTS.OBJECT = LEFT(dbo.frwDefinitions.Field, CHARINDEX('.', dbo.frwDefinitions.Field) - 1) INNER JOIN
                      dbo.frwNotificationList ON dbo.frwDefinitions.Field = dbo.frwNotificationList.Field ON 
                      dbo.frwReports.GUID = dbo.frwDefinitions.Reminder_Report INNER JOIN
                      dbo.frwUsers ON dbo.frwNotificationList.User_Name = dbo.frwUsers.USER_NAME INNER JOIN
                      dbo.frwPeriouds ON dbo.frwNotificationList.PeriodType = dbo.frwPeriouds.ID
WHERE     (dbo.frwDefinitions.Reminder_Formula <> '') AND (dbo.frwDefinitions.NotifyUsers = 1) AND (NOT (dbo.frwUsers.EMail IS NULL))



GO

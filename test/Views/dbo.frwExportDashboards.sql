SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO





CREATE VIEW [dbo].[frwExportDashboards]
AS
SELECT PERMISSION_USERNAME, PERMISSION_OBJECT, [Select], GUID, PERMISSION_ACCESS
FROM     dbo.frwPermissions
WHERE  (PERMISSION_OBJECT IN
                      (SELECT Object_Name
                       FROM      dbo.frwOBJECTS
                       WHERE   (ISNULL(Status, 'Released') = 'Released') AND (Show = 1) AND (WizardID = 8))) AND (PERMISSION_ACCESS = 1)



GO

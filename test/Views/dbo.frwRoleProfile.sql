SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO






CREATE VIEW [dbo].[frwRoleProfile]
AS
SELECT     Object_Name AS Profile, Object_NameAR AS [الملف الشخصي], GUID, OBJECT
FROM         dbo.frwOBJECTS
WHERE     (WizardID = 8)




GO

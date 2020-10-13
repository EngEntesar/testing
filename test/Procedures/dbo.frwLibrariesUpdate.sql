SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[frwLibrariesUpdate] 
	 @strGUID uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
Declare @NewPath as varchar(max)
Declare @OldPath as varchar(max)

Set @OldPath = (Select frwConfig.ReplacePath from frwConfig) 
--Dashboard
Set @NewPath = (Select frwConfig.Dashboards from frwConfig) 
UPDATE frwOBJECTS SET ClassName = REPLACE(CAST(ClassName AS varchar(MAX)),@OldPath, @NewPath)
FROM frwOBJECTS
WHERE CHARINDEX(@OldPath,CAST(ClassName as varchar(MAX)))>0 and (WizardID = 8)


--Snap
Set @NewPath = (Select frwConfig.SnapReports from frwConfig) 
UPDATE frwOBJECTS SET ClassName = REPLACE(CAST(ClassName AS varchar(MAX)),@OldPath, @NewPath)
FROM frwOBJECTS
WHERE CHARINDEX(@OldPath,CAST(ClassName as varchar(MAX)))>0 and (WizardID = 11)

--SpreedSheet
Set @NewPath = (Select frwConfig.Spreadsheets from frwConfig) 
UPDATE frwOBJECTS SET ClassName = REPLACE(CAST(ClassName AS varchar(MAX)),@OldPath, @NewPath)
FROM frwOBJECTS
WHERE CHARINDEX(@OldPath,CAST(ClassName as varchar(MAX)))>0 and (WizardID = 12)


--Reports
Set @NewPath = (Select frwConfig.CRReports from frwConfig) 
UPDATE frwReportCategories SET ReportCategory_Path = REPLACE(CAST(ReportCategory_Path AS varchar(MAX)),@OldPath, @NewPath)
FROM frwReportCategories
WHERE CHARINDEX(@OldPath,CAST(ReportCategory_Path as varchar(MAX)))>0 

END

GO

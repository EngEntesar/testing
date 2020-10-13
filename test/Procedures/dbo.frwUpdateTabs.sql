SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[frwUpdateTabs]
	-- Add the parameters for the stored procedure here
	@strGUID uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
DECLARE @TableName varchar(255)


select @TableName=Object from frwDefinitions where [GUID]=@strGUID
	
Delete from frwtabs where [object] like ''+ @TableName +''

insert into frwtabs (TabName,Object,HasDataFetch) 
SELECT DISTINCT  dbo.frwDefinitions.TabName, dbo.frwOBJECTS.OBJECT AS Object, dbo.frwHasDataFetch(dbo.frwDefinitions.Object, dbo.frwDefinitions.TabName)  AS HasDataFetch 
FROM         dbo.frwDefinitions INNER JOIN    dbo.frwOBJECTS ON dbo.frwDefinitions.Object = dbo.frwOBJECTS.OBJECT 
WHERE     (dbo.frwOBJECTS.OBJECT like ''+ @TableName +'')
    

END


GO

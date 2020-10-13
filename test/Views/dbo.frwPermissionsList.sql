SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
Create VIEW [dbo].[frwPermissionsList]
AS
SELECT PERMISSION_USERNAME,PERMISSION_OBJECT, [1] As [Show],[2] as [Add],[3] as [Edit],[4] as [Delete],[5] as [Print],[6] as [Access],[7] as SecurityGroup1,[8] as SecurityGroup2,[9] as SecurityGroup3, [10] as SecurityGroup4,[11] as SecurityGroup5,PERMISSION_USERNAME+PERMISSION_OBJECT as GUID
FROM 
(SELECT PERMISSION_USERNAME,PERMISSION_OBJECT,PERMISSION_ACCESS
FROM   dbo.frwPermissions) p
PIVOT
(
 count(PERMISSION_ACCESS)
FOR PERMISSION_ACCESS IN
([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11])
) AS pvt
GO

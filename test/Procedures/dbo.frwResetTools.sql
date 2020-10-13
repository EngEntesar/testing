SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO




 






CREATE PROCEDURE [dbo].[frwResetTools]
	@strGUID uniqueidentifier
AS
BEGIN

Update frwObjects Set  ImportData = '' where GUID =@strGUID 


Update [frwObject_Approvals] set [Object] = (Select Object from frwOBJECTS where frwObject_Approvals.Object_Name = frwOBJECTS.Object_Name)

Update [frwValidations] set [Object] = (Select Object from frwOBJECTS where [frwValidations].ObjectID = frwOBJECTS.Object_Name)

Update [frwObject_Sequences] set [Object] = (Select Object from frwOBJECTS where [frwObject_Sequences].Object_Name = frwOBJECTS.Object_Name)

 
Update frwRestrictions set TableName = (Select Object from frwOBJECTS where frwRestrictions.Object = frwOBJECTS.Object_Name)

END

GO

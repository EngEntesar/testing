SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

--=============================================
-- Author: <InnovBase IML Layer>
-- Update date: <23/06/2016 19:09:38>
-- Description: <http://innovbase.visualsoft.com/visualerp/help/InnovBaseLayers>
-- ============================================= 


CREATE PROCEDURE [dbo].[frwResetTools_Web]
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

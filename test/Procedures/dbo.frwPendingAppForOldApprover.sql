SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[frwPendingAppForOldApprover]
	 @strGUID uniqueidentifier
AS
BEGIN
	Declare @From varchar(100)
	Declare @To varchar(100)
   	Declare @NumberofApprovals int
	Declare @OBJECTNAME varchar(255)  --[OBJECT_NAME]
	Declare @Tablename varchar(255)  --[OBJECT]
	Declare @Title varchar(100)  --Title
	Declare @TitleName varchar(100)
	Declare @ObjectGUID uniqueidentifier  --Object_GUID
   	Declare @DelegatePendingAppID int
	Declare @GUID uniqueidentifier



   Select @From = DelegatePendingApp_From , @To= DelegatePendingApp_ToNewApprover , @DelegatePendingAppID = DelegatePendingApp_ID from frwDelegatePendingApp Where [GUID]= @strGUID
   Select @NumberofApprovals = Count ([GUID]) From frwApprovals Where [User_Name] = @From And [Approval_Status] = 'Waiting'And sent = 'True' And [Close_Date] is null
   Update frwDelegatePendingApp Set DelegatePendingApp_NumberofApprovals = @NumberofApprovals Where [GUID]= @strGUID
   Delete from [frwPendingApprovalsGrid] where [PendingApprovals_DelegateID]=@DelegatePendingAppID


	Declare PendingApprovalsCursor Cursor for
    Select [GUID] From frwApprovals Where [User_Name] = @From And [Approval_Status] = 'Waiting' And sent = 'True' And [Close_Date] is null
	
	Open PendingApprovalsCursor
	Fetch Next From PendingApprovalsCursor Into @GUID
	While @@FETCH_STATUS = 0
	Begin 


    Select @OBJECTNAME = [Object_Name] , @ObjectGUID = [Object_GUID] From frwApprovals Where [GUID] = @GUID
    Select Distinct  @Title = Title , @Tablename = [OBJECT] From frwOBJECTS Where [OBJECT_NAME] = @OBJECTNAME

   INSERT INTO [dbo].[frwPendingApprovalsGrid]
           ([PendingApprovals_ObjectName]
           ,[PendingApprovals_ObjecTitle]
           ,[PendingApprovals_ApproverName]
           ,[PendingApprovals_DelegateID]
           ,[PendingApprovals_ObjectGUID])
     VALUES (@OBJECTNAME ,'' ,@From ,@DelegatePendingAppID ,@ObjectGUID)
	 Fetch Next From PendingApprovalsCursor Into @GUID
	End
	Close PendingApprovalsCursor
END



GO

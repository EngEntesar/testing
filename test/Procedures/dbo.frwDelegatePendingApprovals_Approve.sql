SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[frwDelegatePendingApprovals_Approve]
	 @strGUID uniqueidentifier
AS
BEGIN
	Declare @From varchar(100)
	Declare @To varchar(100)
   	Declare @NumberofApprovals int
   	Declare @DelegatePendingAppID int
   	Declare @GUID uniqueidentifier


   Select @From = DelegatePendingApp_From , @To= DelegatePendingApp_ToNewApprover , @DelegatePendingAppID = DelegatePendingApp_ID from frwDelegatePendingApp Where [GUID]= @strGUID

   Select @NumberofApprovals = Count ([GUID]) From frwApprovals Where [User_Name] = @From And [Approval_Status] = 'Waiting' And sent = 'True'  And [Close_Date] is null
   Update frwDelegatePendingApp Set DelegatePendingApp_NumberofApprovals = @NumberofApprovals , DelegatePendingApp_RequestStatus = 'Approved' Where [GUID]= @strGUID


   Select @From = DelegatePendingApp_From , @To= DelegatePendingApp_ToNewApprover from frwDelegatePendingApp Where [GUID]= @strGUID

	Declare PendingApprovalsCursor Cursor for
	Select [PendingApprovals_ObjectGUID] From frwPendingApprovalsGrid Where [PendingApprovals_DelegateID] = @DelegatePendingAppID And [PendingApprovals_Selected] = '1'

	Open PendingApprovalsCursor
	Fetch Next From PendingApprovalsCursor Into @GUID
	While @@FETCH_STATUS = 0
	Begin 
       Update frwApprovals Set [User_Name] = @To ,[Delegated Date] = GetDate()
       Where [User_Name] = @From And [Approval_Status] = 'Waiting' AND [Object_GUID] = @GUID  And [Close_Date] is null

 Fetch Next From PendingApprovalsCursor Into @GUID
	End
	Close PendingApprovalsCursor

END



GO

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[frwPendingApprovals_RejectedRequestStatus]
	@strGUID uniqueidentifier
AS
BEGIN
 Declare @ProjectNo varchar(8)
   Update frwDelegatePendingApp Set DelegatePendingApp_RequestStatus = 'Rejected' Where [GUID]= @strGUID

End


GO

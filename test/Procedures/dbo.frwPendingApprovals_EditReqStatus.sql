SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[frwPendingApprovals_EditReqStatus]
	@strGUID uniqueidentifier
AS
BEGIN

   Update frwDelegatePendingApp Set DelegatePendingApp_RequestStatus = 'In Progress' Where [GUID]= @strGUID

End



GO

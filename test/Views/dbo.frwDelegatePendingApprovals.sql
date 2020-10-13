SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO





CREATE VIEW [dbo].[frwDelegatePendingApprovals]
AS
SELECT        DelegatePendingApp_ID, DelegatePendingApp_From, DelegatePendingApp_ToNewApprover, GUID, DelegatePendingApp_CreateDate, DelegatePendingApp_Reason, DelegatePendingApp_Note, 
                         DelegatePendingApp_RequestStatus, DelegatePendingApp_NumberofApprovals, DelegatePendingApp_Attachment
FROM            dbo.frwDelegatePendingApp



GO

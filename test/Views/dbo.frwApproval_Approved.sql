SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[frwApproval_Approved] AS
SELECT DISTINCT Object_Name, Object_GUID, Object_Date, User_Name, Comments, Approved_Date, Approval_Status, Sequence, Approval_TypeID
FROM         dbo.frwApprovals
WHERE     (Approval_Status = 'Approved') AND (AdHoc = 0) AND (Sequence =
                          (SELECT     MAX(Sequence) AS Sequence
                             FROM         dbo.frwApprovals AS frwApprovals_1
                             WHERE     (Object_GUID = dbo.frwApprovals.Object_GUID))) AND (Object_GUID NOT IN
                          (SELECT     Object_GUID
                             FROM         dbo.frwApproval_NotApproved_AllMust))




GO

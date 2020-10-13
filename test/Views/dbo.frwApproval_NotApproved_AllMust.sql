SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[frwApproval_NotApproved_AllMust] AS
SELECT Approval_Status, Object_Name, Object_GUID, User_Name, Approved_Date, Sequence, Sent, AdHoc, Approval_TypeID
FROM     dbo.frwApprovals
WHERE  (Approval_Status <> 'Approved') AND (AdHoc = 0) AND (Sequence =
                      (SELECT MAX(Sequence) AS Expr1
                       FROM      dbo.frwApprovals AS frwApprovals_1
                       WHERE   (Object_GUID = dbo.frwApprovals.Object_GUID))) AND (Approval_TypeID = 2)



GO

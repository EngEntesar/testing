SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[frwEscalationNamedUser_Filter]
AS
SELECT        dbo.frwApprovals.GUID, dbo.frwApprovals.Object_Name, dbo.frwApprovals.Object_GUID, dbo.frwApprovals.Object_Date, dbo.frwApprovals.User_Name, dbo.frwApprovals.Comments, 
                         dbo.frwApprovals.Approval_Status, dbo.frwApprovals.Approved_Date, dbo.frwApprovals.Sequence, dbo.frwApprovals.Request_Time, dbo.frwPeriouds.Type, dbo.frwApprovals.Waiting, dbo.frwApprovals.Hierarchy, 
                         dbo.frwApprovals.Formula, dbo.frwApprovals.PeriodType, dbo.frwApprovals.EscalationTo, dbo.frwApprovals.Sent, dbo.frwApprovals.Close_Date, dbo.frwApprovals.User_Comments, dbo.frwApprovals.AdHoc, 
                         dbo.frwApprovals.Approval_TypeID, dbo.frwApprovals.[Delegated Date], dbo.frwApprovals.AfterApproval, dbo.frwApprovals.AfteRejection, dbo.frwApprovals.AfterApprovalWebService, 
                         dbo.frwApprovals.AfteRejectionWebService, dbo.frwApprovals.Object_NameAr
FROM            dbo.frwApprovals INNER JOIN
                         dbo.frwPeriouds ON dbo.frwApprovals.PeriodType = dbo.frwPeriouds.ID
WHERE        (dbo.frwApprovals.Approval_Status = 'Waiting') AND (dbo.frwApprovals.Object_GUID NOT IN
                             (SELECT        Object_GUID
                                FROM            dbo.frwApproval_Approved)) AND (NOT (dbo.frwPeriouds.Type IS NULL)) AND (NOT (dbo.frwApprovals.Waiting IS NULL)) AND (NOT (dbo.frwApprovals.EscalationTo IS NULL)) AND 
                         (dbo.frwApprovals.Waiting > 0)


GO

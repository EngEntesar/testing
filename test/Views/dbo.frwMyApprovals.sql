SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[frwMyApprovals]
AS
SELECT        GUID, Object_Name, Object_GUID, Object_Date, User_Name, Comments, Approval_Status, Approved_Date, Sequence, Request_Time, Sent, Close_Date, 
                         User_Comments, AdHoc, PeriodType, Waiting, EscalationTo, Hierarchy, Formula, Approval_TypeID
FROM            dbo.frwApprovals
WHERE        (User_Name LIKE SYSTEM_USER)



GO

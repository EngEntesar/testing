SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO





CREATE VIEW [dbo].[frwExportDashboardsHeader]
AS
SELECT        USER_NAME, USER_GROUPID, LAST_UPDATE, FIRSTTIME, DAYSAVAILABLE, LAST_PWDCHANGE, MASTERPWD, BLOCKEDUSER, BLOCKEDPCNAME, BLOCKEDUSERNAME, BLOCKEDDATE, BLOCKEDBADMIN, 
                         GUID, EMail, ForwardApprovals, Description, USER_AccountType, Until
FROM            dbo.frwUsers



GO
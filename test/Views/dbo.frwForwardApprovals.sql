SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO





CREATE VIEW [dbo].[frwForwardApprovals]
AS
SELECT     USER_NAME, EMail, ForwardApprovals, USER_GROUPID ,GUID,Until,Description
FROM         dbo.frwUsers





GO

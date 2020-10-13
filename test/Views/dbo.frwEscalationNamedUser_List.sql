SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[frwEscalationNamedUser_List]
AS
SELECT        *
FROM            frwEscalationNamedUser_Filter
WHERE        dbo.frwGetApprovalStatus(Object_GUID) = 'Waiting'

GO

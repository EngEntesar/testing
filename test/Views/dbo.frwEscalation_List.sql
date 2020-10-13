SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[frwEscalation_List]
AS

SELECT        *
FROM            frwEscalation_Filter
WHERE        dbo.frwGetApprovalStatus(Object_GUID) = 'Waiting'
GO

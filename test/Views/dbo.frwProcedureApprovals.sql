SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[frwProcedureApprovals]
AS
SELECT     Object_Name, GUID, Approval_TypeID, AfterApproval, Requester, Description, OBJECT
FROM         dbo.frwOBJECTS



GO

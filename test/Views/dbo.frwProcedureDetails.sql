SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO







CREATE VIEW [dbo].[frwProcedureDetails]
AS
SELECT        dbo.frwOBJECTS.Approval_TypeID, dbo.frwOBJECTS.AfterApproval, dbo.frwOBJECTS.Description AS [Object Description], dbo.frwOBJECTS.Requester, dbo.frwProcedure_Objects.GUID, 
                         dbo.frwProcedure_Objects.Procedure_GUID, dbo.frwProcedure_Objects.Object_Name, dbo.frwProcedure_Objects.Sequence, dbo.frwProcedure_Objects.Description, dbo.frwOBJECTS.GUID AS ObjectGUID, 
                         dbo.frwOBJECTS.Web
FROM            dbo.frwProcedure_Objects INNER JOIN
                         dbo.frwOBJECTS ON dbo.frwProcedure_Objects.Object_Name = dbo.frwOBJECTS.Object_Name



GO

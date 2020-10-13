SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[frwStoredProcedures]
AS
SELECT     TOP (100) PERCENT name AS Procedures
FROM         sys.objects
WHERE     (type = 'P')
ORDER BY Procedures



GO

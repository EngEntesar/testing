SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[frwTablesList]
AS
SELECT     TOP (100) PERCENT name AS TableName
FROM         sys.objects
WHERE     (type = 'U')
ORDER BY TableName



GO

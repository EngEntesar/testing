SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[frwSearchViews]
AS
SELECT     TOP (100) PERCENT name AS SearchViews
FROM         sys.objects
WHERE     (type = 'V') OR
                      (type = 'U')
ORDER BY SearchViews



GO

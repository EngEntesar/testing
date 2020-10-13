SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[frwYesNo]
AS
SELECT     dbo.frwYesNoNotApplicable.*
FROM         dbo.frwYesNoNotApplicable
WHERE     (YesNoOnly = 1)



GO

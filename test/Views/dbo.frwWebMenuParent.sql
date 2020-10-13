SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[frwWebMenuParent]
AS
SELECT        dbo.frwObjectCat.*
FROM            dbo.frwObjectCat
WHERE        (OBJECTCAT_Parent IS NULL)

GO

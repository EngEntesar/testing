SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO


 




CREATE VIEW [dbo].[frwUsersInfo]
AS
SELECT        USER_NAME, ISNULL(Description, USER_NAME) AS Description
FROM            dbo.frwUsers



GO

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO



 




Create PROCEDURE [dbo].[frwTrySendEmailAgain]
                -- Add the parameters for the stored procedure here
                @strGUID uniqueidentifier
AS
BEGIN
                -- SET NOCOUNT ON added to prevent extra result sets from
UPDATE    frwEmails
SET              emailErrorMsg = NULL


END



GO

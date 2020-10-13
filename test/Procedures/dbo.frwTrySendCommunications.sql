SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO





Create PROCEDURE [dbo].[frwTrySendCommunications]
                -- Add the parameters for the stored procedure here
                @strGUID uniqueidentifier
AS
BEGIN
                -- SET NOCOUNT ON added to prevent extra result sets from
UPDATE    frwEmails
SET              emailErrorMsg = NULL


UPDATE    frwSMS
SET              frwSMS.SMSErrorMsg = NULL



UPDATE    frwVoice
SET              frwVoice.VoiceErrorMsg = NULL


END


GO

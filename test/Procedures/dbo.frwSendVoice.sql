SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[frwSendVoice] 
	
	@VoiceTo varchar(max),
	@VoiceSubject varchar(max),
	@VoiceBody varchar(max)
	
	
AS
BEGIN


-- How to send Notification thru SP
--Declaration


Declare @emailBodySignatures varchar(max);
Declare @VoiceFrom varchar(max);


--Seting the values
--select @emailBodySignatures= IsNull(Signatures,'</a><br><br>With Respect & Regards<br>InnovBase® 2015 Automation Server') from frwConfig;
Select  @VoiceFrom= VoiceGatewaySender from frwConfig  with (nolock)  ;


--Insert inot frwEmails which will automaticlly send the email thrue InnovBase Automation Server
INSERT INTO [dbo].[frwVoice](VoiceFrom ,VoiceTo,VoiceSubject,VoiceBody,VoiceSentTime)
     VALUES (@VoiceFrom,@VoiceTo,@VoiceSubject,@VoiceBody,GETDATE());

 

END 




GO

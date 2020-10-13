SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[frwSendSMS] 
	
	@SMSTo varchar(max),
	@SMSSubject varchar(max),
	@SMSBody varchar(max)
	
	
AS
BEGIN


-- How to send Notification thru SP
--Declaration


Declare @emailBodySignatures varchar(max);
Declare @SMSFrom varchar(max);


--Seting the values
--select @emailBodySignatures= IsNull(Signatures,'</a><br><br>With Respect & Regards<br>InnovBase® 2015 Automation Server') from frwConfig;
Select  @SMSFrom= SMSGatewaySender from frwConfig  with (nolock)  ;


--Insert inot frwEmails which will automaticlly send the email thrue InnovBase Automation Server
INSERT INTO [dbo].[frwSMS](SMSFrom ,SMSTo,SMSSubject,SMSBody,SMSSentTime)
     VALUES (@SMSFrom,@SMSTo,@SMSSubject,@SMSBody,GETDATE());

 

END



GO

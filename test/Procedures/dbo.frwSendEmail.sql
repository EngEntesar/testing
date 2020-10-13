SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[frwSendEmail] 
	@emailTo varchar(max),
	@emailSubject varchar(max),
	@emailBody varchar(max),
	@emailReportID varchar(max)
AS
BEGIN


-- How to send Notification thru SP
--Declaration


Declare @emailBodySignatures varchar(max);
Declare @emailFrom varchar(max);


--Seting the values
select @emailBodySignatures= IsNull(Signatures,'</a><br><br>With Respect & Regards<br>InnovBase® 2015 Automation Server') from frwConfig;
Select  @emailFrom=Sender from frwConfig  with (nolock)  ;


--Insert inot frwEmails which will automaticlly send the email thrue InnovBase Automation Server
INSERT INTO [dbo].[frwEmails]([emailFrom] ,[emailTo],[emailSubject],[emailBody],emailStatus,[emailSentTime],[emailReportID])
     VALUES (@emailFrom ,@emailTo ,@emailSubject ,@emailBody + @emailBodySignatures,0 ,getdate() ,@emailReportID);


--Sample How to call use

--ALTER PROCEDURE [dbo].[sp_DueSinglePaymentApprove] 
--	@GUID uniqueidentifier
--AS
--BEGIN

--UPDATE    DuePayments
--SET              Approved = 1 Where GUID = @GUID

--insert into DuePaymentsApprovedLog select * from DuePayments where GUID = @GUID

--Declare @PaymentNo  varchar(10);
--select @PaymentNo = Cast(@PaymentNo as varchar(10)) from DuePayments where GUID = @GUID;

--Declare @emailSubject varchar(max);
--Declare	@emailBody varchar(max);
--Set @emailSubject ='Approval Notification for Payment Requet No.' + @PaymentNo;
--set @emailBody ='Payment No' + @PaymentNo + 'has been approved';

--exec frwSendNotification 'InnovBase@visualsoft.com', @emailSubject ,@emailBody ,null


END



GO

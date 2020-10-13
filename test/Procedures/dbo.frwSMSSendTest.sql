SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[frwSMSSendTest]
	 @strGUID uniqueidentifier
AS
BEGIN

Declare @Address varchar(max);
Declare @Sender varchar(50);
Declare @username varchar(max);
Declare @password varchar(max);
Declare @message  varchar(max);
Declare @get varchar(max);
Declare @sendto varchar(20);
Declare @lng	varchar(10);
Declare @SID varchar(255);

Declare @SMS_PostUser		varchar(50)
		,@SMS_PostPassword	varchar(50)
		,@SMS_PostSender	varchar(50)
		,@SMS_PostNumbers	varchar(50)
		,@SMS_PostMessage	varchar(50)
		,@SMS_PostExtra		varchar(50)
		,@ResultSend		varchar(250)

set @lng= 'en'

UPDATE frwConfig 
		   SET SMSResultTest=''
		    WHERE GUID=@strGUID
 

Select @Address=SMSGatewayAddress,@Sender=SMSGatewaySender,@username=SMSGatewayUserName,
		@password=SMSGatewayPassword,@message=SMSTestMsg,@sendto=SMSTestTo,@lng=Language ,@SID =SMSSID
		,@SMS_PostUser=SMS_PostUser,@SMS_PostPassword=SMS_PostPassword,@SMS_PostSender=SMS_PostSender,@SMS_PostNumbers=SMS_PostNumbers
		,@SMS_PostMessage=SMS_PostMessage,@SMS_PostExtra=SMS_PostExtra
	from frwConfig
	where GUID=@strGUID

IF((@Address IS NOT NULL) AND (@Sender IS NOT NULL) AND (@username IS NOT NULL) AND (@password IS NOT NULL) AND (@message IS NOT NULL)
     AND (@sendto IS NOT NULL)) Or (@SID IS NOT NULL and @Address IS NOT NULL  AND (@sendto IS NOT NULL) AND (@message IS NOT NULL))
 BEGIN
    
	   Declare @Object as Int;
	   Declare @ResponseText as Varchar(8000);
	   Declare @ErrCode   as varchar(max);
		if IsNull(@SID,'') = '' 
		Begin
		   --http://api.unifonic.com/wrapper/sendSMS.php?userid=[username]&password=[password]&msg=[english_body]&sender=[SenderID]&to=[Destination]
		   
		   
		   -- SET @get = @Address+'?user='+@username+'&password='+@password+'&numbers='+@sendto+'&sender='+@Sender+'&message='+@message+'&lang='+@lng 

			
		   SET @get = @Address+'?'+isnull(@SMS_PostUser,'user')+'='+@username+'&'+isnull(@SMS_PostPassword,'Password')+'='+@password+'&'+isnull(@SMS_PostNumbers,'numbers')+'='+@sendto+'&'+isnull(@SMS_PostSender,'sender')+'='+@Sender+'&'+isnull(@SMS_PostMessage,'message')+'='+@message+'&'+isnull(@SMS_PostExtra,'lng')+'='+isnull(@lng,'') 
		   
				Exec sp_OACreate 'MSXML2.XMLHTTP', @Object OUT;
				Exec sp_OAMethod @Object, 'open', NULL, 'GET',@get,'false'
				Exec sp_OAMethod @Object, 'send' 
		
				EXEC sp_OAMethod @Object,
										 'ResponseText',
										 @ResponseText OUTPUT
	 
				Exec sp_OADestroy @Object
		
		
				IF(@lng='English')
				 BEGIN
				 SET @ResultSend = 
   					  CASE 
					    When @ResponseText like 'Error : 0<br />MessageID :%'  THEN 'Sent successfully'
						WHEN @ResponseText like '1:'+@sendto THEN  'Sent successfully'
						WHEN @ResponseText like '0:'+@sendto THEN  'Sending Error'
						When @ResponseText like '100' Then  'Sent successfully'
						when @ResponseText like '101' Then  'Data Is Missing'
						when @ResponseText like '102' Then  'Username Incorrect'
						when @ResponseText like '103' Then  'Incorrect Password'
						when @ResponseText like '104' Then  'There is not enough credit'
						when @ResponseText like '105' Then  'Balance Not Enough'
						when @ResponseText like '106' Then  'Sender Name Not Available'
						when @ResponseText like '107' Then  'Sender Name is Blocked'
						when @ResponseText like '108' Then  'There are no valid numbers'
						when @ResponseText like '109' Then  'Message Long Can not Send'
						when @ResponseText like '110' Then  'Sending Error'
						when @ResponseText like '111' Then  'Send Closed'
						when @ResponseText like '112' Then  'Message Contains Blocked Word'
						when @ResponseText like '113' Then  'Account Not Enabled'
						when @ResponseText like '114' Then  'Account is disabled'
						when @ResponseText like '115' Then  'is not enabled mobile'
						when @ResponseText like '116' Then  'Not Activated Email'

						WHEN @ResponseText like 'Invalid login' THEN   'Access data error'
						WHEN @ResponseText like 'Missing or Empty Field' THEN   'There is a wrong value in a field, or there is a blank field'
						WHEN @ResponseText like 'Insufficent Balance' THEN  'Your balance is insufficient to complete the submission process'
						WHEN @ResponseText like 'Invalid Sender' THEN 'Error in senders name, senders name must be composed of English characters and'
						WHEN @ResponseText like 'Sender name is not activated' THEN  'The senders name is not enabled'
						WHEN @ResponseText like 'Invalid Message Language' THEN 'The message language is a violation of the value listed in the Lang variable'
						
						
						
						ELSE 
						  @ResponseText
				
			 
					END
				  END
				  ELSE
				  BEGIN

				 SET @ResultSend = 
   					 CASE 
						WHEN @ResponseText like  '1:'+@sendto THEN  'تم الإرسال بنجاح'
						WHEN @ResponseText like '0:'+@sendto THEN  'خطأ في الإرسال'
						WHEN @ResponseText like 'Invalid login' THEN  'خطأ في بيانات الدخول'
						WHEN @ResponseText like 'Missing or Empty Field' THEN  'توجد قيمة خاطئة في إحدى الحقول , أو هناك حقل فارغ'
						WHEN @ResponseText like 'Insufficent Balance' THEN  'رصيدك لايكفي لإتمام عملية الإرسال'
						WHEN @ResponseText like 'Invalid Sender' THEN  'خطأ في اسم المرسل , اسم المرسل لابد أن يتكون من حروف انجليزية وأرقام'
						WHEN @ResponseText like 'Sender name is not activated' THEN  'اسم المرسل غير مفعل'
						WHEN @ResponseText like 'Invalid Message Language' THEN  'لغة الرسالة مخالفة عن القيمة المذكورة في متغير Lang'
						When @ResponseText like '100' Then 'تم الإرسال بنجاح'
						when @ResponseText like '101' Then 'البيانات ناقصة'
							 
						when @ResponseText like '102' Then 'اسم المستخدم غير صحيح'
						when @ResponseText like '103' Then 'كلمة المرور غير صحيحة'
						when @ResponseText like '104' Then 'لا يوجد رصيد كافي'
						when @ResponseText like '105' Then 'الرصيد لا يكفي'
						when @ResponseText like '106' Then 'اسم المرسل غير متاح'
						when @ResponseText like '107' Then 'اسم المرسل محجوب'
						when @ResponseText like '108' Then 'لا يوجد ارقام صحيحة'
						when @ResponseText like '109' Then 'الرسالة طويلة لا يمكن الارسال'
						when @ResponseText like '110' Then 'خطأ في الإرسال'
						when @ResponseText like '111' Then 'الإرسال مغلق'
						when @ResponseText like '112' Then 'الرسالة تحتوي على كلمة محظورة'
						when @ResponseText like '113' Then 'الحساب غير مفعل'
						when @ResponseText like '114' Then 'الحساب موقوف'
						when @ResponseText like '115' Then 'غير مفعل جوالك'
						when @ResponseText like '116' Then 'غير مفعل البريد الإلكتروني'
						When @ResponseText like 'Error : 0<br />MessageID :%'  THEN 'تم الإرسال بنجاح'
						ELSE 
						  @ResponseText
				 
					END
				  END

				if(@ResultSend is null or @ResultSend like '')
				 begin
				   set @ResponseText = 'There is no connection to the intranet,  لا يوجد إتصال بالنت'
				 end
				UPDATE frwConfig 
				   SET SMSResultTest=@ResultSend  
					WHERE GUID=@strGUID
					Exec frwSMSUpdateBalance @strGUID
			End
		Else
			Begin

  				if Isnull( @lng,'English') <>'English' set @lng ='Arabic' else set @lng ='English'
				Set @get = 'AppSid='+@SID + '&Recipient=' + @sendto + '&Body=' +@message + '&SenderID=' + @Sender
				Set @Address = @Address + 'Messages/Send'
				Exec sp_OACreate 'MSXML2.ServerXMLHTTP', @Object OUT;
				Exec sp_OAMethod @Object, 'open', NULL, 'post',@Address,'false'
				Exec sp_OAMethod @Object ,'setRequestHeader'    ,NULL ,'Content-Type'   ,'application/x-www-form-urlencoded'
				Exec @ErrCode= sp_OAMethod @Object, 'send',null, @get 


				EXEC sp_OAMethod @Object,
										 'ResponseText',
										 @ResponseText OUTPUT
				Select @ErrCode as ERROR,@ResponseText as Response
				Exec sp_OADestroy @Object 

		
	 
			
			   if @ErrCode ='0'
				   Begin
						UPDATE frwConfig 
						SET  SMSResultTest = @ResponseText  
						WHERE GUID=@strGUID
						Exec frwSMSUpdateBalance @strGUID
				   END
			   else 
					 UPDATE frwConfig 
							   SET  SMSResultTest = @ErrCode
								WHERE GUID=@strGUID
			End
 
	END
 
END





GO

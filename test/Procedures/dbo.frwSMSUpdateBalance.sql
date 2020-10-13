SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[frwSMSUpdateBalance]
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
		,@SMSGateBalanceAddress		varchar(100)

set @lng= 'en'

UPDATE frwConfig 
		   SET SMSBalance =''
		    WHERE GUID=@strGUID
 

Select @Address=SMSGatewayAddress,@Sender=SMSGatewaySender,@username=SMSGatewayUserName,
		@password=SMSGatewayPassword,@message=SMSTestMsg,@sendto=SMSTestTo,@lng=Language ,@SID =SMSSID
		,@SMS_PostUser=SMS_PostUser,@SMS_PostPassword=SMS_PostPassword,@SMS_PostSender=SMS_PostSender,@SMS_PostNumbers=SMS_PostNumbers
		,@SMS_PostMessage=SMS_PostMessage,@SMS_PostExtra=SMS_PostExtra,@SMSGateBalanceAddress=SMSGateBalanceAddress
	from frwConfig
	where GUID=@strGUID

IF((@SMSGateBalanceAddress IS NOT NULL) AND (@Sender IS NOT NULL) AND (@username IS NOT NULL) AND (@password IS NOT NULL) 
     )  Or (@SID IS NOT NULL and @Address IS NOT NULL)
 BEGIN
 
 if IsNull(@SID,'') = '' 
	Begin
	   Declare @Object as Int;
	   Declare @ResponseText as Varchar(8000);
	   Declare @ErrCode   as varchar(max);
	   
	   --SET @get = @Address+'?user='+@username+'&password='+@password+'&action=get' 
	     --https://api.unifonic.com/wrapper/getBalance.php?userid={Email}&password={password}

	   SET @get = isnull(@SMSGateBalanceAddress,@Address)+'?'+isnull(@SMS_PostUser,'user')+'='+@username+'&'+isnull(@SMS_PostPassword,'paswword')+'='+@password+'&'+'action=get' 
		  
			Exec sp_OACreate 'MSXML2.XMLHTTP', @Object OUT;
			Exec sp_OAMethod @Object, 'open', NULL, 'GET',@get,'false'
			Exec sp_OAMethod @Object, 'send' 
		
			EXEC sp_OAMethod @Object,
									 'ResponseText',
									 @ResponseText OUTPUT
			Exec sp_OADestroy @Object
		
		
		   				
	
			UPDATE frwConfig 
			   SET  SMSBalance = @ResponseText 
				WHERE GUID=@strGUID
	End
	Else
	Begin
	 		Set @get = 'AppSid='+@SID
		Set @Address = @Address + 'Account/GetBalance'
		Exec sp_OACreate 'MSXML2.ServerXMLHTTP', @Object OUT;
		Exec sp_OAMethod @Object, 'open', NULL, 'post',@Address,'false'
		Exec sp_OAMethod @Object ,'setRequestHeader'    ,NULL ,'Content-Type'   ,'application/x-www-form-urlencoded'
        Exec @ErrCode= sp_OAMethod @Object, 'send',null, @get 


		EXEC sp_OAMethod @Object,
								 'ResponseText',
								 @ResponseText OUTPUT
	    Select @ErrCode as ERROR,@ResponseText as Response
		Exec sp_OADestroy @Object 

		 if  @ErrCode = '0' 
				begin
				 Select StringValue  from frwParseJSON(@ResponseText) where Name like 'Balance'
					UPDATE frwConfig 
					   SET  SMSBalance = (Select StringValue  from frwParseJSON(@ResponseText) where Name like 'Balance') 
						WHERE GUID=@strGUID
				end
			else
				UPDATE frwConfig Set  SMSBalance = @ErrCode WHERE GUID=@strGUID

 
	End

END
END


GO

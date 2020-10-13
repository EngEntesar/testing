SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO



-- Created By Abdullah Al Khatib 5.10.2015

CREATE  PROCEDURE [dbo].[frwVoiceSendTest]
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
set @lng= 'en'


Select @Address=VoiceGatewayAddress,@Sender=VoiceGatewaySender,@username=VoiceGatewayUserName,
		@password=VoiceGatewayPassword,@message=VoiceTestMsg,@sendto=VoiceTestTo,@lng=frwConfig.[Language],@SID =VoiceSID
	from frwConfig
	where GUID=@strGUID

IF((@Address IS NOT NULL) AND (@Sender IS NOT NULL) AND (@username IS NOT NULL) AND (@password IS NOT NULL) AND (@message IS NOT NULL)
     AND (@sendto IS NOT NULL)) Or (@SID IS NOT NULL and @Address IS NOT NULL  AND (@sendto IS NOT NULL) AND (@message IS NOT NULL))
 BEGIN
   Declare @Object as Int;
   Declare @ResponseText as Varchar(8000);
   Declare @ErrCode   as varchar(max);
  	    if Isnull( @lng,'English') <>'English' set @lng ='Arabic' else set @lng ='English'
		Set @get = 'AppSid='+@SID + '&Recipient=' + @sendto + '&Content=' +@message + '&Language=' + @lng
		Set @Address = @Address + 'Voice/TTSCall'
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
				SET  VoiceResultTest = @ResponseText  
				WHERE GUID=@strGUID
				 Execute frwVoiceUpdateBalance @strGUID
		   END
	   else 
			 UPDATE frwConfig 
					   SET  VoiceResultTest = @ErrCode
						WHERE GUID=@strGUID
END
END





GO

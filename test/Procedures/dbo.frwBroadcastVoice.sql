SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO







CREATE  PROCEDURE [dbo].[frwBroadcastVoice]
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
Declare @VoiceID int;
set @lng= 'en'


Select @Address=VoiceGatewayAddress,@Sender=VoiceGatewaySender,@username=VoiceGatewayUserName,
		@password=VoiceGatewayPassword,@message=VoiceTestMsg,@sendto=VoiceTestTo,@lng=frwConfig.[Language],@SID =VoiceSID
	from frwConfig

Select @VoiceID = frwVoiceBroadcast.ID ,@message =frwVoiceBroadcast.Text   from frwVoiceBroadcast where GUID=@strGUID


IF @message IS NOT NULL 

 BEGIN
  

		Insert into frwVoice (frwVoice.VoiceFrom , frwVoice.VoiceTo ,frwVoice.VoiceBody ,VoiceStatus, VoiceSentTime )
		SELECT Distinct @Sender, dbo.frwUsers.Mobile ,replace(@message, '@UserName',ISNULL(dbo.frwUsers.Description, dbo.frwUsers.USER_NAME))  ,0 , GETDATE()
		FROM     dbo.frwUsers CROSS JOIN
						  dbo.frwVoiceBroadcastList
		WHERE  (dbo.frwVoiceBroadcastList.BroadcastType = 1) AND (dbo.frwVoiceBroadcastList.VoiceID = @VoiceID) AND (IsNull(dbo.frwUsers.Mobile,'')<>'')
			   Or 

			  ((dbo.frwUsers.USER_NAME IN
							  (SELECT UserID
							   FROM      dbo.frwVoiceBroadcastList AS frwVoiceBroadcastList_2
							   WHERE   (VoiceID = @VoiceID And BroadcastType = 3))) AND (IsNull(dbo.frwUsers.Mobile,'')<>'')) OR
						  ((IsNull(dbo.frwUsers.Mobile,'')<>'') AND (dbo.frwUsers.USER_GROUPID IN
							  (SELECT GroupID
							   FROM      dbo.frwVoiceBroadcastList AS frwVoiceBroadcastList_1
							   WHERE   (VoiceID = @VoiceID And BroadcastType = 2)))) 
		Union
		     SELECT Distinct @Sender, dbo.frwVoiceBroadcastList.GustMobile ,replace(@message, '@UserName',ISNULL(dbo.frwVoiceBroadcastList.GustID, dbo.frwVoiceBroadcastList.GustMobile))  ,0 , GETDATE()
			 From dbo.frwVoiceBroadcastList WHERE   (VoiceID = @VoiceID And BroadcastType = 4 and IsNull(dbo.frwVoiceBroadcastList.GustMobile,'')<>'')
END
END






GO

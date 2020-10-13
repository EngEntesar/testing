SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO





---- Created By Abdullah Al Khatib 5.10.2015

CREATE  PROCEDURE [dbo].[frwBroadcastSMS]
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
Declare @SMSID int;
set @lng= 'en'


Select @Address=SMSGatewayAddress,@Sender=SMSGatewaySender,@username=SMSGatewayUserName,
		@password=SMSGatewayPassword,@message=SMSTestMsg,@sendto=SMSTestTo,@lng=frwConfig.[Language],@SID =SMSSID
	from frwConfig

Select @SMSID = frwSMSBroadcast.ID ,@message =frwSMSBroadcast.Text   from frwSMSBroadcast where GUID=@strGUID


IF @message IS NOT NULL

 BEGIN
  

		Insert into frwSMS (frwSMS.SMSFrom , frwSMS.SMSTo ,frwSMS.SMSBody ,SMSStatus, SMSSentTime )
		SELECT Distinct @Sender, dbo.frwUsers.Mobile ,replace(@message, '@UserName',ISNULL(dbo.frwUsers.Description, dbo.frwUsers.USER_NAME))  ,0 , GETDATE()
		FROM     dbo.frwUsers CROSS JOIN
						  dbo.frwSMSBroadcastList
		WHERE  (dbo.frwSMSBroadcastList.BroadcastType = 1) AND (dbo.frwSMSBroadcastList.SMSID = @SMSID) AND (IsNull(dbo.frwUsers.Mobile,'')<>'')
			   Or 

			  ((dbo.frwUsers.USER_NAME IN
							  (SELECT UserID
							   FROM      dbo.frwSMSBroadcastList AS frwSMSBroadcastList_2
							   WHERE   (SMSID = @SMSID And BroadcastType = 3))) AND (IsNull(dbo.frwUsers.Mobile,'')<>'')) OR
						  ((IsNull(dbo.frwUsers.Mobile,'')<>'') AND (dbo.frwUsers.USER_GROUPID IN
							  (SELECT GroupID
							   FROM      dbo.frwSMSBroadcastList AS frwSMSBroadcastList_1
							   WHERE   (SMSID = @SMSID And BroadcastType = 2)))) 
		Union
		     SELECT Distinct @Sender, dbo.frwSMSBroadcastList.GustMobile ,replace(@message, '@UserName',ISNULL(dbo.frwSMSBroadcastList.GustID, dbo.frwSMSBroadcastList.GustMobile))  ,0 , GETDATE()
			 From dbo.frwSMSBroadcastList WHERE   (SMSID = @SMSID And BroadcastType = 4 and IsNull(dbo.frwSMSBroadcastList.GustMobile,'')<>'')
END
END






GO

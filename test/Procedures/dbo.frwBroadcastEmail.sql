SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO




CREATE  PROCEDURE [dbo].[frwBroadcastEmail]
	 @strGUID uniqueidentifier
AS
BEGIN

Declare @Sender varchar(50);
Declare @message  varchar(max);
Declare @Subject varchar(max);
Declare @sendto varchar(20);
Declare @EmailID int;


Select @Sender=Sender 
	from frwConfig

Select @EmailID = frwEmailBroadcast.ID ,@message =frwEmailBroadcast.Text ,@Subject = frwEmailBroadcast.Subject  from frwEmailBroadcast where GUID=@strGUID


IF @message IS NOT NULL

 BEGIN
  

		Insert into frwEmails (frwEmail.EmailFrom , frwEmail.EmailTo ,frwEmail.emailSubject,frwEmail.EmailBody ,EmailStatus, EmailSentTime )
		SELECT Distinct @Sender, dbo.frwUsers.EMail ,@Subject ,replace(@message, '@UserName',ISNULL(dbo.frwUsers.Description, dbo.frwUsers.USER_NAME))  ,0 , GETDATE()
		FROM     dbo.frwUsers CROSS JOIN
						  dbo.frwEmailBroadcastList
		WHERE  (dbo.frwEmailBroadcastList.BroadcastType = 1) AND (dbo.frwEmailBroadcastList.EmailID = @EmailID) AND (IsNull(dbo.frwUsers.EMail,'')<>'')
			   Or 

			  ((dbo.frwUsers.USER_NAME IN
							  (SELECT UserID
							   FROM      dbo.frwEmailBroadcastList AS frwEmailBroadcastList_2
							   WHERE   (EmailID = @EmailID))) AND (IsNull(dbo.frwUsers.EMail,'')<>'')) OR
						  ((IsNull(dbo.frwUsers.EMail,'')<>'') AND (dbo.frwUsers.USER_GROUPID IN
							  (SELECT GroupID
							   FROM      dbo.frwEmailBroadcastList AS frwEmailBroadcastList_1
							   WHERE   (EmailID = @EmailID)))) 
		Union
		     SELECT Distinct @Sender, dbo.frwEmailBroadcastList.GustEmail ,@Subject ,replace(@message, '@UserName',ISNULL(dbo.frwEmailBroadcastList.GustID, dbo.frwEmailBroadcastList.GustEmail))  ,0 , GETDATE()
			 From dbo.frwEmailBroadcastList WHERE   (EmailID = @EmailID And BroadcastType = 4 and IsNull(dbo.frwEmailBroadcastList.GustEmail,'')<>'')

END
END






GO

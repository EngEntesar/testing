SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO







Create PROCEDURE [dbo].[frwForwardApprovalsUntil]
@strGUID uniqueidentifier      
AS
BEGIN
    Declare @FromUserName varchar(100)
    Declare @ToUserName varchar(100)
    Declare @FromEmail varchar(100)
    Declare @ToEmail varchar(100)
    Declare @FromDescription varchar(100)
    Declare @ToDescription varchar(100)
    Declare @UntilDate DateTime
    Declare @emailSubject varchar(200)
    Declare @emailBodyFrom varchar(200)
    Declare @emailBodyTo varchar(200)
    Declare @Sender varchar(100)
    Declare @Signatures varchar(max)

   Set @emailSubject = 'Forward Approvals Notification'

  Declare ForwardApprovalsCursor Cursor for
  
      SELECT [USER_NAME] FROM [dbo].[frwUsers]
      Where [Until] <= GETDATE() And ([ForwardApprovals] Is Not Null And [ForwardApprovals]<> '')
      
      Open ForwardApprovalsCursor
      Fetch Next From ForwardApprovalsCursor Into @FromUserName
      While @@FETCH_STATUS = 0
      Begin 
   -------------------------------------
    SELECT @FromEmail = [EMail],@FromDescription = [Description],@ToEmail = [ForwardApprovals] ,@UntilDate =[Until]
    FROM [dbo].[frwUsers] Where [USER_NAME] = @FromUserName
    
    SELECT @ToDescription = [Description] , @ToUserName = [USER_NAME] FROM [dbo].[frwUsers] Where [EMail] = @ToEmail
    SELECT @Sender = [Sender] , @Signatures = [Signatures] From frwConfig
    Set @emailBodyFrom = 'Dear ' + @FromDescription+ ' ,<br><br> ' + 'Please be inform that your authority given to ' + @ToDescription + ' for Forward Approver is expire. <br>' + @Signatures
       
        INSERT INTO [dbo].[frwEmails]
           ([emailFrom],[emailTo] ,[emailSubject] ,[emailBody] ,[emailStatus]
           ,[emailSentTime])
     VALUES
           (@Sender,@FromEmail,@emailSubject,@emailBodyFrom,0,GETDATE())
           
           
     SELECT @ToDescription = [Description] , @ToUserName = [USER_NAME] FROM [dbo].[frwUsers] Where [EMail] = @ToEmail
     INSERT INTO [dbo].[frwLog] ([GUID], [ObjectID] ,[UserName] ,[Log] ,[LogTime])
     VALUES     (newid() , 'Forward Approvals' , @FromUserName, @emailBodyFrom , GETDATE()) 
   -------------------------------------           
           
    SELECT @ToDescription = [Description] FROM [dbo].[frwUsers] Where [EMail] = @ToEmail
       Set @emailBodyTo =  'Dear ' + @ToDescription+ ' ,<br><br> ' + 'Please be inform that your authorization from ' + @FromDescription + ' for Forward Approver is expire.  <br>'  +  @Signatures

    INSERT INTO [dbo].[frwEmails]
           ([emailFrom],[emailTo] ,[emailSubject] ,[emailBody] ,[emailStatus]
           ,[emailSentTime])
     VALUES
           (@Sender,@ToEmail,@emailSubject,@emailBodyTo,0,GETDATE())
           
     SELECT @ToDescription = [Description] , @ToUserName = [USER_NAME] FROM [dbo].[frwUsers] Where [EMail] = @ToEmail         
     INSERT INTO [dbo].[frwLog] ([GUID], [ObjectID] ,[UserName] ,[Log] ,[LogTime])
     VALUES     (newid() , 'Forward Approvals' , @ToUserName, @emailBodyTo , GETDATE()) 
   -------------------------------------     
     
    Fetch Next From ForwardApprovalsCursor Into @FromUserName
      End
      Close ForwardApprovalsCursor
    deallocate ForwardApprovalsCursor
    
   BEGIN TRANSACTION;

    Update [frwUsers] Set [ForwardApprovals] = null , [Until] = null
    Where [Until] < GETDATE() And ([ForwardApprovals] Is Not Null)
    
   COMMIT TRANSACTION;

End

GO

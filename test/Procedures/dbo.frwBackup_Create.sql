SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- Author:		<Sameer and Abdullah,,Name>
-- Create date: <Create Date,,>
-- Description:	<Serial,,>
-- =============================================

 
CREATE PROCEDURE  [dbo].[frwBackup_Create] 
	@GUID UNIQUEIDENTIFIER
AS 
 
BEGIN
	
	DECLARE @LINK	VARCHAR(max)
		   ,@DATEDAY	DATETIME
		   ,@Email		varchar(max)
		   ,@username  varchar(max)
		   ,@message   varchar(max)
		   ,@sCmd	   varchar(4000)
		   ,@iRetCode  int
		   ,@zipfile	varchar(max)
		   ,@zipfolder varchar(max)
		   ,@Reportsfolder varchar(max)
		   ,@IncludeReports bit
		   ,@name VARCHAR(max) -- database name  
		   ,@path VARCHAR(max) -- path for backup files  
		   ,@fileName VARCHAR(max) -- filename for backup  
		   ,@fileDate VARCHAR(max) -- used for file name
		   ,@count   int
		   ,@chkdirectory as nvarchar(max)
           ,@sorcepath	varchar(max)	

	set @count = 0;
	SET @NAME  = DB_NAME();
-- specify database backup directory


	 select top(1) @sorcepath = [Backup], @Reportsfolder=CRReports   from frwConfig 
		     
     select @IncludeReports=IsNull(IncludeReports,0) from frwBackup where GUID =@GUID
 
-- specify filename format
	SELECT @fileDate =cast(newid() as varchar (100)) -- CONVERT(VARCHAR(20),GETDATE(),112) 
 
   
   SET @fileName = @sorcepath+'\' + @name   +'.bak' 
   SET @zipfile = @sorcepath+'\' + @name  + @fileDate +'.rar' 
   SET @zipfolder = @sorcepath  +'\*.bak'
    

   set @sCmd = 'del "' + @fileName +'"'
   EXEC @iRetCode = master..xp_cmdshell @sCmd
   set @sCmd = 'del "' + @sorcepath  +'\' + @name + '*.rar"'
   EXEC @iRetCode = master..xp_cmdshell @sCmd
    
   BACKUP DATABASE @name TO  DISK =  @fileName WITH INIT,  NAME =  N'Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10
   set @sCmd = 'E:\Visualsoft\VisualERP\Web\Tools\rar.exe a -ep1 -r "' + @zipfile + '" "' + @fileName +'"'
   EXEC @iRetCode = master..xp_cmdshell @sCmd
   if (@IncludeReports=1)
   Begin
    set @sCmd = 'E:\Visualsoft\VisualERP\Web\Tools\rar.exe a -ep1 -r "' + @zipfile + '" "' + @Reportsfolder+'\"'
	EXEC @iRetCode = master..xp_cmdshell @sCmd
   End


IF @iRetCode <> 0
    print('Error')

   set @LINK = @name+'.visualerp.net'+ '/download/' + @name +  @fileDate +'.rar'
   UPDATE frwBackup
   SET BackupDate = GETDATE(),
      Link = @LINK
	WHERE GUID =@GUID
	
	
	select @Email = EMail,@username = [USER_NAME]  from frwUsers 
	 where USER_NAME like SYSTEM_USER 

	 set @message = 'Dear '+@username + '<br><br> Thanks for your request... <br>' + 
	                'Backup download link: <a href='+ @LINK +'>' + @LINK + '</a><br>'

	exec dbo.frwSendEmail @Email,'Database Backup',@message,null
	
	 
END

GO

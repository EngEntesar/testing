SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

 


CREATE FUNCTION [dbo].[frwGetBackupPath]() 
RETURNS NVARCHAR(4000)
AS 
BEGIN 

   DECLARE @path NVARCHAR(4000) 

   Select @path = [Backup] from frwConfig

   if @path is null or @path =''
		Begin
		   EXEC master.dbo.xp_instance_regread 
					N'HKEY_LOCAL_MACHINE', 
					N'Software\Microsoft\MSSQLServer\MSSQLServer',N'BackupDirectory', 
					@path OUTPUT,  
					'no_output' 
		End

   RETURN @path 

END


GO

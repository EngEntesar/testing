SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		Abdullah Al Khatib-- Create date: 14-10-2017
-- Description:	
-- =============================================

CREATE PROCEDURE [dbo].[frwGrantAttachmentStore] 
	-- Add the parameters for the stored procedure here
	  @GUID AS UNIQUEIDENTIFIER
AS
BEGIN

	 DECLARE @UserID varchar(255)
	 DECLARE @AttachmentsDB varchar(255)
	 DECLARE @sCmd	   varchar(4000)
	 DECLARE UsersList CURSOR FAST_FORWARD FOR 
	 SELECT USER_NAME FROM frwUsers  
	 Select @AttachmentsDB =AttachmentsStore from frwConfig where GUID = @GUID 	
	 if @AttachmentsDB is not null 
	 begin
		OPEN UsersList 
		FETCH NEXT FROM UsersList INTO @UserID
   		 WHILE @@FETCH_STATUS = 0
			 BEGIN
				begin try

					begin try
						Set @sCMD ='Use [' + @AttachmentsDB +']; CREATE USER [' + @UserID +'] FOR LOGIN [' + @UserID +']'
						Execute (@sCmd)
					end try
					begin catch
					end catch
					Set @sCMD ='Use [' + @AttachmentsDB +'];EXEC sp_addrolemember N''db_datareader'', N'''+ @UserID +''''
					Execute (@sCmd)
					Set @sCMD ='Use [' + @AttachmentsDB +'];EXEC sp_addrolemember N''db_datawriter'', N'''+ @UserID +''''
					Execute (@sCmd)
				end try
				begin catch
				end catch
				FETCH NEXT FROM UsersList INTO @UserID
			END 
		 CLOSE UsersList
		 DEALLOCATE UsersList
	 end
END

GO

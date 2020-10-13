SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF
GO






Create Function [dbo].[frwGetAttachment]	(@strGUID uniqueidentifier,@Folder varchar(max))
RETURNS   VARCHAR(MAX)
AS
BEGIN

DECLARE @SQLFILE VARCHAR(MAX),
    @FILEPATH VARBINARY(MAX),
    @ObjectToken INT,
	@FILENAME VARCHAR(MAX)

DECLARE FILEPATH CURSOR FAST_FORWARD FOR 
        SELECT Data,[FileName] FROM frwAttachments_Store where [GUID] like @strGUID

OPEN FILEPATH 

FETCH NEXT FROM FILEPATH INTO @FILEPATH,@FILENAME

WHILE @@FETCH_STATUS = 0
    BEGIN
        
		SET @SQLFILE = IsNull(@Folder,'C:\Windows\Temp\') + @FILENAME

        EXEC sp_OACreate 'ADODB.Stream', @ObjectToken OUTPUT
        EXEC sp_OASetProperty @ObjectToken, 'Type', 1
        EXEC sp_OAMethod @ObjectToken, 'Open'
        EXEC sp_OAMethod @ObjectToken, 'Write', NULL, @FILEPATH
        EXEC sp_OAMethod @ObjectToken, 'SaveToFile', NULL, @SQLFILE, 2
        EXEC sp_OAMethod @ObjectToken, 'Close'
        EXEC sp_OADestroy @ObjectToken

        FETCH NEXT FROM FILEPATH INTO @FILEPATH,@FILENAME
    END 

CLOSE FILEPATH
DEALLOCATE FILEPATH

Return @SQLFILE

--Sample ... Null = C:\Windows\Temp\
--Select [dbo].[frwGetAttachmentPath] ('bb937fb6-e32f-41dd-bdd5-7165a0ba6c54',null)
END 



GO

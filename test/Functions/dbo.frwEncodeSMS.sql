SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO



CREATE FUNCTION [dbo].[frwEncodeSMS] (@value varchar(max))
RETURNS nvarchar(max)
AS
BEGIN
DECLARE @position int, @result nvarchar(max) 
SET @position = 1;  
set @result =right(convert(varchar(max), convert(varbinary, ASCII (SUBSTRING(@value, @position, 1))),2),4)
SET @position = 2

  WHILE @position <= DATALENGTH(@value)  
-- While these are still characters in the character string,  
   BEGIN  
		set @result =@result + right(convert(varchar(max), convert(varbinary, ASCII (SUBSTRING(@value, @position, 1))),2),4)
		set @position = @position + 1  
   END

    RETURN @result;
END

GO

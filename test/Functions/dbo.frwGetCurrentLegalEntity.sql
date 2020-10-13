SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO



CREATE FUNCTION [dbo].[frwGetCurrentLegalEntity](@UserName Varchar(100)) 
RETURNS varchar(10)
AS 
BEGIN 

   
   Declare @Start int
	Declare @End int
	Declare @Log varchar(max)

	Select TOP (1) 
		@Log = cast(Justification as varchar(max)), 
		@Start = charindex('(',cast(Justification as varchar(max))) , 
		@End = charindex(')',cast(Justification as varchar(max))) 

	FROM   frwLog
	WHERE (UserName like @UserName) AND (Event = 'Login')
	ORDER BY LogTime DESC

	Return substring(@Log, @Start +1, @End -@Start -1)
   

END



GO

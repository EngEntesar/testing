SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO




Create FUNCTION [dbo].[Mid] (@String varchar(max), @strS int, @StrL int)  
RETURNS varchar(max)
AS  
BEGIN 
DECLARE @Mid varchar(max)
Set @Mid =Right(Left(@String, @strS + @StrL - 1), @strL)
Return (@Mid)
END



GO

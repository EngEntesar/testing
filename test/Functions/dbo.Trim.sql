SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO




CREATE FUNCTION [dbo].[Trim] (@String varchar(max)) 
RETURNS varchar(max)
AS  
BEGIN 
Return (RTrim(LTrim(@String)))
END



GO

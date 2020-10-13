SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO






CREATE FUNCTION [dbo].[frwIsUniqueidentifier] (@unique varchar(100))  
RETURNS bit AS  
BEGIN 

declare @return bit 
set @return = 0


if right(left(@unique,9),1)+right(left(@unique,14),1)+right(left(@unique,19),1)+right(left(@unique,24),1) = '----'
if len(@unique) = 36
set @return = 1

return @return

END



GO

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO




CREATE FUNCTION [dbo].[frwHasDataFetch] (@Table varchar(max),@Tab varchar(max)) 
RETURNS  bit
AS  
BEGIN 
	declare @Value as varchar(max) 

	select @Value = TabName from frwDefinitions with (nolock) Where ( left([Formula],1) = '?' or isnull([Default],'') <>'')  and  [Object] like @Table and TabName like @Tab  


	if @Value is  null   set @Value=0 else set @Value =1

	return @Value
END



GO

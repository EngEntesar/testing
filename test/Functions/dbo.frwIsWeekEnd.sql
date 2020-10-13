SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF
GO






CREATE FUNCTION [dbo].[frwIsWeekEnd](@date [datetime], @calendar int )
RETURNS bit
AS 

Begin

	Declare @Saturday	bit	
	Declare @Sunday	bit	
	Declare @Monday	bit	
	Declare @Tuesday	bit	
	Declare @Wednesday	bit	
	Declare @Thursday	bit	
	Declare @Friday	bit	
	
	Select  
	 @Saturday	=	Saturday,
	 @Sunday	=	Sunday,
	 @Monday	=	Monday,
	 @Tuesday	=	Tuesday,
	 @Wednesday	=	Wednesday,
	 @Thursday	=	Thursday,
	 @Friday	=	Friday
	 from frwCalendars where code = @calendar


  if  DATENAME( dw, @date ) = 'Saturday' and @Saturday = 0 
   Return 1

 if  DATENAME( dw, @date ) = 'Sunday' and @Sunday = 0 
   Return 1

 if  DATENAME( dw, @date ) = 'Monday' and @Monday = 0 
   Return 1

 if  DATENAME( dw, @date ) = 'Tuesday' and @Tuesday = 0 
   Return 1

 if  DATENAME( dw, @date ) = 'Wednesday' and @Wednesday = 0 
   Return 1

 if  DATENAME( dw, @date ) = 'Thursday' and @Thursday = 0 
   Return 1

 if  DATENAME( dw, @date ) = 'Friday' and @Friday = 0 
   Return 1


Return 0

End




GO

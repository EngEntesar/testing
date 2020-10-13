SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF
GO





CREATE FUNCTION [dbo].[frwGetHolidaysCount](@from_date [datetime], @to_date [datetime], @calendar [int])
RETURNS int
AS 

Begin

	

	Declare @Month	smallint
	Declare @Day	smallint
	Declare @Guaranteed	bit	
	Declare @Calendar_Types	int	
	Declare @start_date datetime
	Declare @end_date datetime
	Declare @MainCalendar_Types	int	
	Select  @MainCalendar_Types	=	frwCalendar_Types from frwCalendars where code = @calendar

	Declare @Holidays int
	set @Holidays =0
	Declare @CalendarYear int
	Declare @MainCalendarYear int
	Declare @YearsCount int
	
	if @MainCalendar_Types =1 
		set @YearsCount = (dbo.InnovBase_ToUmAlQuraYear (@to_date) - dbo.InnovBase_ToUmAlQuraYear (@from_date)) +1
	else
		set @YearsCount = (year(@to_date) - year (@from_date)) +1

	set @start_date = @from_date


	While @YearsCount >0
	Begin
		DECLARE Holidays_Cursor CURSOR FOR  
				SELECT [Day],[Month],Guaranteed ,frwCalendar_Types
					FROM frwHolidaysAndEvents 
						WHERE Calendar_Code = @calendar and Holiday= 1
				
				OPEN Holidays_Cursor
				FETCH NEXT FROM Holidays_Cursor INTO @Day,@Month,@Guaranteed,@Calendar_Types
				WHILE @@FETCH_STATUS = 0   
				BEGIN   
					


					if @MainCalendar_Types =1 
							set @MainCalendarYear=dbo.InnovBase_ToUmAlQuraYear(@start_date)						
					else
							set @MainCalendarYear=year(@start_date)
	
			
					if @Calendar_Types =1 
							set @CalendarYear=dbo.InnovBase_ToUmAlQuraYear(@start_date)						
					else
							set @CalendarYear=year(@start_date)
			
					

					if  @YearsCount >1 
						set @end_date =  dbo.InnovBase_ToDateTime(@MainCalendarYear,12,dbo.InnovBase_GetDaysInMonth(@MainCalendarYear,12,@MainCalendar_Types),@MainCalendar_Types)
					else
						set @end_date = @to_date


					if dbo.InnovBase_ToDateTime(@CalendarYear,@Month,@Day,@Calendar_Types) >= @start_date and dbo.InnovBase_ToDateTime(@CalendarYear,@Month,@Day,@Calendar_Types) <= @end_date
						Begin
							if @Guaranteed = 1
								set @Holidays= @Holidays +1
							else 
								if  dbo.frwIsWeekEnd(dbo.InnovBase_ToDateTime(@CalendarYear,@Month,@Day,@Calendar_Types), @calendar) = 0
									set @Holidays= @Holidays +1
						End
					
					FETCH NEXT FROM Holidays_Cursor INTO  @Day,@Month,@Guaranteed,@Calendar_Types
				END   
			CLOSE Holidays_Cursor   
			DEALLOCATE Holidays_Cursor
			
			Set @YearsCount = @YearsCount -1
			Set @start_date =dbo.InnovBase_AddDays (1, @end_date,@Calendar_Types)
	End
	return @Holidays

End



GO

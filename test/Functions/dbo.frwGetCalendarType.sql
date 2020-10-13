SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF
GO






-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[frwGetCalendarType] 
(
	-- Add the parameters for the function here
	@CalendarCode int
)
RETURNS int
AS
BEGIN
	Declare @CaledarType int
	Select @CaledarType =frwCalendar_Types from frwCalendars	where Code = @CalendarCode

	return isnull(@CaledarType,2)

END



GO

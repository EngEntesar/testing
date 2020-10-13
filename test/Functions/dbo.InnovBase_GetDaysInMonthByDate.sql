CREATE FUNCTION [dbo].[InnovBase_GetDaysInMonthByDate]
(
	@datevalue [datetime],
	@calendar [int]
)
	RETURNS [bigint]
	WITH EXECUTE AS CALLER
AS
	EXTERNAL NAME [InnovBase].[InnovBase.UserDefinedFunctions].[InnovBase_GetDaysInMonthByDate]
GO

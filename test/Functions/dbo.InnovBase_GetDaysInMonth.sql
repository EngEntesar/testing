CREATE FUNCTION [dbo].[InnovBase_GetDaysInMonth]
(
	@year [int],
	@month [int],
	@calendar [int]
)
	RETURNS [bigint]
	WITH EXECUTE AS CALLER
AS
	EXTERNAL NAME [InnovBase].[InnovBase.UserDefinedFunctions].[InnovBase_GetDaysInMonth]
GO

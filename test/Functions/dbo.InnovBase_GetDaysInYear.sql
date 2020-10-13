CREATE FUNCTION [dbo].[InnovBase_GetDaysInYear]
(
	@year [int],
	@calendar [int]
)
	RETURNS [bigint]
	WITH EXECUTE AS CALLER
AS
	EXTERNAL NAME [InnovBase].[InnovBase.UserDefinedFunctions].[InnovBase_GetDaysInYear]
GO

CREATE FUNCTION [dbo].[InnovBase_AddYears]
(
	@years [int],
	@datevalue [datetime],
	@calendar [int]
)
	RETURNS [datetime]
	WITH EXECUTE AS CALLER
AS
	EXTERNAL NAME [InnovBase].[InnovBase.UserDefinedFunctions].[InnovBase_AddYears]
GO

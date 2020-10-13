CREATE FUNCTION [dbo].[InnovBase_AddDays]
(
	@Days [int],
	@datevalue [datetime],
	@calendar [int]
)
	RETURNS [datetime]
	WITH EXECUTE AS CALLER
AS
	EXTERNAL NAME [InnovBase].[InnovBase.UserDefinedFunctions].[InnovBase_AddDays]
GO

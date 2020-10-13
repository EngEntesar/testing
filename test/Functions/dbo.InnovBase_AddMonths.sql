CREATE FUNCTION [dbo].[InnovBase_AddMonths]
(
	@Months [int],
	@datevalue [datetime],
	@calendar [int]
)
	RETURNS [datetime]
	WITH EXECUTE AS CALLER
AS
	EXTERNAL NAME [InnovBase].[InnovBase.UserDefinedFunctions].[InnovBase_AddMonths]
GO

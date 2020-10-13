CREATE FUNCTION [dbo].[InnovBase_ToDecimal]
(
	@Value [numeric](38, 18),
	@Precision [int]
)
	RETURNS [float]
	WITH EXECUTE AS CALLER
AS
	EXTERNAL NAME [InnovBase].[InnovBase.UserDefinedFunctions].[InnovBase_ToDecimal]
GO

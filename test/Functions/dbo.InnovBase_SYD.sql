CREATE FUNCTION [dbo].[InnovBase_SYD]
(
	@Cost [float],
	@Salvage [float],
	@Life [float],
	@Period [float],
	@RoundDigits [int]
)
	RETURNS [float]
	WITH EXECUTE AS CALLER
AS
	EXTERNAL NAME [InnovBase].[InnovBase.InnovBaseFunctions].[InnovBase_SYD]
GO

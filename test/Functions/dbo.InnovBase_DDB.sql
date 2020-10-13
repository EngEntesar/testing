CREATE FUNCTION [dbo].[InnovBase_DDB]
(
	@Cost [float],
	@Salvage [float],
	@Life [float],
	@Period [float],
	@Factor [float],
	@RoundDigits [int]
)
	RETURNS [float]
	WITH EXECUTE AS CALLER
AS
	EXTERNAL NAME [InnovBase].[InnovBase.InnovBaseFunctions].[InnovBase_DDB]
GO

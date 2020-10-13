CREATE FUNCTION [dbo].[InnovBase_SLN]
(
	@Cost [float],
	@Salvage [float],
	@Life [float],
	@RoundDigits [int]
)
	RETURNS [float]
	WITH EXECUTE AS CALLER
AS
	EXTERNAL NAME [InnovBase].[InnovBase.InnovBaseFunctions].[InnovBase_SLN]
GO

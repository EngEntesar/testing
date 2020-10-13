CREATE FUNCTION [dbo].[InnovBase_PPMT]
(
	@Rate [float],
	@Per [float],
	@NPer [float],
	@PV [float],
	@FV [float],
	@Type [bit],
	@RoundDigits [int]
)
	RETURNS [float]
	WITH EXECUTE AS CALLER
AS
	EXTERNAL NAME [InnovBase].[InnovBase.InnovBaseFunctions].[InnovBase_PPMT]
GO

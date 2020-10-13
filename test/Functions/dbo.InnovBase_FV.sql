CREATE FUNCTION [dbo].[InnovBase_FV]
(
	@Rate [float],
	@NPer [float],
	@Pmt [float],
	@PV [float],
	@Type [bit],
	@RoundDigits [int]
)
	RETURNS [float]
	WITH EXECUTE AS CALLER
AS
	EXTERNAL NAME [InnovBase].[InnovBase.InnovBaseFunctions].[InnovBase_FV]
GO

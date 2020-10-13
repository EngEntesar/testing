CREATE FUNCTION [dbo].[InnovBase_PV]
(
	@Rate [float],
	@NPer [float],
	@Pmt [float],
	@FV [float],
	@Type [bit],
	@RoundDigits [int]
)
	RETURNS [float]
	WITH EXECUTE AS CALLER
AS
	EXTERNAL NAME [InnovBase].[InnovBase.InnovBaseFunctions].[InnovBase_PV]
GO

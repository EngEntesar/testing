CREATE FUNCTION [dbo].[InnovBase_Rate]
(
	@NPer [float],
	@Pmt [float],
	@PV [float],
	@FV [float],
	@Type [bit],
	@Guess [float],
	@RoundDigits [int]
)
	RETURNS [float]
	WITH EXECUTE AS CALLER
AS
	EXTERNAL NAME [InnovBase].[InnovBase.InnovBaseFunctions].[InnovBase_Rate]
GO

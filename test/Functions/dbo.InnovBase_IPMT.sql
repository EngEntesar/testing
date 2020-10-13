CREATE FUNCTION [dbo].[InnovBase_IPMT]
(
	@Rate [float],
	@NPer [float],
	@PV [float],
	@FV [float],
	@Type [bit],
	@RoundDigits [int]
)
	RETURNS [float]
	WITH EXECUTE AS CALLER
AS
	EXTERNAL NAME [InnovBase].[InnovBase.InnovBaseFunctions].[InnovBase_IPMT]
GO

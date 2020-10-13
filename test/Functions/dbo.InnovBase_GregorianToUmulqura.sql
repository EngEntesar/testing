CREATE FUNCTION [dbo].[InnovBase_GregorianToUmulqura]
(
	@GregorianDate [datetime],
	@RightToLeft [int]
)
	RETURNS nvarchar(max)
	WITH EXECUTE AS CALLER
AS
	EXTERNAL NAME [InnovBase].[InnovBase.UserDefinedFunctions].[InnovBase_GregorianToUmulqura]
GO

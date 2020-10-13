CREATE FUNCTION [dbo].[InnovBase_ToUmAlQuraMonth]
(
	@datevalue [datetime]
)
	RETURNS [bigint]
	WITH EXECUTE AS CALLER
AS
	EXTERNAL NAME [InnovBase].[InnovBase.UserDefinedFunctions].[InnovBase_ToUmAlQuraMonth]
GO

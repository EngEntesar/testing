CREATE FUNCTION [dbo].[InnovBase_ToUmAlQuraYear]
(
	@datevalue [datetime]
)
	RETURNS [bigint]
	WITH EXECUTE AS CALLER
AS
	EXTERNAL NAME [InnovBase].[InnovBase.UserDefinedFunctions].[InnovBase_ToUmAlQuraYear]
GO

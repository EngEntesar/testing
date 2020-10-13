CREATE FUNCTION [dbo].[InnovBase_ToDateTime]
(
	@year [int],
	@month [int],
	@day [int],
	@calendar [int]
)
	RETURNS [datetime]
	WITH EXECUTE AS CALLER
AS
	EXTERNAL NAME [InnovBase].[InnovBase.UserDefinedFunctions].[InnovBase_ToDateTime]
GO

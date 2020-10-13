CREATE FUNCTION [dbo].[InnovBase_DateDiffByMonths]
(
	@starting_date [datetime],
	@ending_date [datetime],
	@calendar [int]
)
	RETURNS [bigint]
	WITH EXECUTE AS CALLER
AS
	EXTERNAL NAME [InnovBase].[InnovBase.UserDefinedFunctions].[InnovBase_DateDiffByMonths]
GO

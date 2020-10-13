CREATE FUNCTION [dbo].[InnovBase_ToWordsEnglish]
(
	@Value [float]
)
	RETURNS nvarchar(max)
	WITH EXECUTE AS CALLER
AS
	EXTERNAL NAME [InnovBase].[InnovBase.InnovBaseFunctions].[InnovBase_ToWordsEnglish]
GO

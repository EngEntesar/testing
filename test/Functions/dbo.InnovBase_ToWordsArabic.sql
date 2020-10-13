CREATE FUNCTION [dbo].[InnovBase_ToWordsArabic]
(
	@Value [float]
)
	RETURNS nvarchar(max)
	WITH EXECUTE AS CALLER
AS
	EXTERNAL NAME [InnovBase].[InnovBase.InnovBaseFunctions].[InnovBase_ToWordsArabic]
GO

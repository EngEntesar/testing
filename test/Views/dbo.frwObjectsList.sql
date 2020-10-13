SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO





CREATE VIEW [dbo].[frwObjectsList]
AS
SELECT name AS Object, type
FROM  sys.objects
WHERE (type IN ('U', 'V', 'P'))




GO

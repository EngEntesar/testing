SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[frwMUFavorites]
AS
SELECT     GUID, Name, ObjectLink, [User], SortOrder, Color, Image, Height
FROM         dbo.frwMFavorites



GO

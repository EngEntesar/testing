SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Project_Approved]
	@strGUID uniqueidentifier
AS
BEGIN
	
	UPDATE Projects
	SET Status=3
	WHERE GUID=@strGUID
END
GO

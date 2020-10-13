SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Project_Rejected]
	@strGUID uniqueidentifier
AS
BEGIN
	
	UPDATE Projects
	SET Status=4
	WHERE GUID=@strGUID
END
GO

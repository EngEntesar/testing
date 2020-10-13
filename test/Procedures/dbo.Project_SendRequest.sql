SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Project_SendRequest]
	@strGUID uniqueidentifier
AS
BEGIN
	
	UPDATE Projects
	SET Status=2
	WHERE GUID=@strGUID
END
GO

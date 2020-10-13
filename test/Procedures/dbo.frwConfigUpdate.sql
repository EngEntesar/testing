SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[frwConfigUpdate]

	@strGUID uniqueidentifier
AS
BEGIN
Exec [frwInMemCreate] @strGUID
Exec [frwInMemUpdate] @strGUID


End


GO

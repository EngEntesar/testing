SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

 




CREATE FUNCTION [dbo].[frwHelpAssestant] (@MessageID VARCHAR(20))
RETURNS VARCHAR(MAX)
AS
BEGIN

DECLARE @MSGDescription		VARCHAR(MAX)
DECLARE @MSGLanguges			VARCHAR(20)

	SELECT @MSGLanguges	=	Language
	FROM frwSetting
	WHERE [SchemaUser]	=	SYSTEM_USER

	IF @MSGLanguges	=	'English'
		BEGIN
			SET @MSGDescription = (SELECT DescriptionEn FROM frwMessages	WHERE MsgID	=	@MessageID) --+ CHAR(10)  + CHAR(10) +'MsgID : ' + @MessageID
		END
	ELSE
	BEGIN
			SET @MSGDescription = (SELECT DescriptionAr FROM frwMessages	WHERE MsgID	=	@MessageID) --+ CHAR(10) + CHAR(10) +'رقم الرسالة: ' + @MessageID

	END


	RETURN @MSGDescription + CHAR(10)  + CHAR(10) +'MsgID: ' + @MessageID
END





GO

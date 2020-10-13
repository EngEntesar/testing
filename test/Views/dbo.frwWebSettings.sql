SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[frwWebSettings]
AS
SELECT   GUID, Color_Mandatory, Color_NotMandatory, Color_New, Color_Open, Color_Show, Color_Expression, SchemaUser, Background, Language, WebColumns, AskApproval, AskPrint
FROM     dbo.frwSetting
WHERE   (SchemaUser = SYSTEM_USER)

GO

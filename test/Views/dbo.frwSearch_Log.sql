SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[frwSearch_Log]
AS
SELECT     LogTime AS Time, Event, ObjectID AS [Table  Name], UserName AS [User Name], GUID
FROM         dbo.frwLog



GO

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[frwLog] (
		[GUID]              [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[ObjectID]          [varchar](50) COLLATE Arabic_CI_AS NULL,
		[UserName]          [varchar](50) COLLATE Arabic_CI_AS NULL,
		[Log]               [text] COLLATE Arabic_CI_AS NULL,
		[ObjectGUID]        [uniqueidentifier] NULL,
		[LogTime]           [datetime] NULL,
		[Event]             [varchar](50) COLLATE Arabic_CI_AS NULL,
		[Justification]     [text] COLLATE Arabic_CI_AS NULL,
		[Database]          [varchar](250) COLLATE Arabic_CI_AS NULL,
		CONSTRAINT [PK_frwLog]
		PRIMARY KEY
		CLUSTERED
		([GUID])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwLog]
	WITH CHECK
	ADD CONSTRAINT [FK_frwLog_frwEventsType]
	FOREIGN KEY ([Event]) REFERENCES [dbo].[frwEventsType] ([Event_Type])
	ON UPDATE CASCADE
ALTER TABLE [dbo].[frwLog]
	CHECK CONSTRAINT [FK_frwLog_frwEventsType]

GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwLog]
	ON [dbo].[frwLog] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwLog] SET (LOCK_ESCALATION = TABLE)
GO

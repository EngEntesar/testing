SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[frwEventsType] (
		[Event_Type]     [varchar](50) COLLATE Arabic_CI_AS NOT NULL,
		[Event_ID]       [int] NOT NULL,
		[GUID]           [uniqueidentifier] NULL ROWGUIDCOL,
		CONSTRAINT [PK_frwEventsType]
		PRIMARY KEY
		CLUSTERED
		([Event_Type])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwEventsType]
	ADD
	CONSTRAINT [DF_frwEventsType_GUID]
	DEFAULT (newid()) FOR [GUID]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwEventsType]
	ON [dbo].[frwEventsType] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwEventsType] SET (LOCK_ESCALATION = TABLE)
GO

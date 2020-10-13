SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[frwVoiceBroadcast] (
		[GUID]     [uniqueidentifier] NULL ROWGUIDCOL,
		[ID]       [int] NOT NULL,
		[Text]     [varchar](max) COLLATE Arabic_CI_AS NOT NULL,
		CONSTRAINT [frwVoiceBroadcast_Code]
		PRIMARY KEY
		CLUSTERED
		([ID])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwVoiceBroadcast]
	ADD
	CONSTRAINT [frwVoiceBroadcast_GUID]
	DEFAULT (newid()) FOR [GUID]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwVoiceBroadcast]
	ON [dbo].[frwVoiceBroadcast] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwVoiceBroadcast] SET (LOCK_ESCALATION = TABLE)
GO

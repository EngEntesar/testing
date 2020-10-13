SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[frwEmailBroadcast] (
		[GUID]        [uniqueidentifier] NULL ROWGUIDCOL,
		[ID]          [int] NOT NULL,
		[Text]        [varchar](max) COLLATE Arabic_CI_AS NOT NULL,
		[Subject]     [varchar](max) COLLATE Arabic_CI_AS NOT NULL,
		CONSTRAINT [frwEmailBroadcast_Code]
		PRIMARY KEY
		CLUSTERED
		([ID])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwEmailBroadcast]
	ADD
	CONSTRAINT [frwEmailBroadcast_GUID]
	DEFAULT (newid()) FOR [GUID]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwEmailBroadcast]
	ON [dbo].[frwEmailBroadcast] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwEmailBroadcast] SET (LOCK_ESCALATION = TABLE)
GO

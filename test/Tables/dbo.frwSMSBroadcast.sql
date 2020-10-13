SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[frwSMSBroadcast] (
		[GUID]     [uniqueidentifier] NULL ROWGUIDCOL,
		[ID]       [int] NOT NULL,
		[Text]     [varchar](max) COLLATE Arabic_CI_AS NOT NULL,
		CONSTRAINT [frwSMSBroadcast_Code]
		PRIMARY KEY
		CLUSTERED
		([ID])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwSMSBroadcast]
	ADD
	CONSTRAINT [frwSMSBroadcast_GUID]
	DEFAULT (newid()) FOR [GUID]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwSMSBroadcast]
	ON [dbo].[frwSMSBroadcast] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwSMSBroadcast] SET (LOCK_ESCALATION = TABLE)
GO

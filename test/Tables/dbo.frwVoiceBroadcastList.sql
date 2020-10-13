SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[frwVoiceBroadcastList] (
		[VoiceID]           [int] NOT NULL,
		[GUID]              [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[BroadcastType]     [int] NOT NULL,
		[GroupID]           [int] NULL,
		[UserID]            [varchar](100) COLLATE Arabic_CI_AS NULL,
		[GustID]            [varchar](255) COLLATE Arabic_CI_AS NULL,
		[GustMobile]        [varchar](30) COLLATE Arabic_CI_AS NULL,
		CONSTRAINT [PK_frwVoiceBroadcastList]
		PRIMARY KEY
		CLUSTERED
		([VoiceID], [GUID])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwVoiceBroadcastList]
	ADD
	CONSTRAINT [DF_frwVoiceBroadcastList_GUID]
	DEFAULT (newid()) FOR [GUID]
GO
ALTER TABLE [dbo].[frwVoiceBroadcastList]
	WITH CHECK
	ADD CONSTRAINT [FK_frwVoiceBroadcastList_frwBroadcast_Types]
	FOREIGN KEY ([BroadcastType]) REFERENCES [dbo].[frwBroadcast_Types] ([ID])
	ON UPDATE CASCADE
ALTER TABLE [dbo].[frwVoiceBroadcastList]
	CHECK CONSTRAINT [FK_frwVoiceBroadcastList_frwBroadcast_Types]

GO
ALTER TABLE [dbo].[frwVoiceBroadcastList]
	WITH CHECK
	ADD CONSTRAINT [FK_frwVoiceBroadcastList_frwGroups]
	FOREIGN KEY ([GroupID]) REFERENCES [dbo].[frwGROUPS] ([GROUP_ID])
ALTER TABLE [dbo].[frwVoiceBroadcastList]
	CHECK CONSTRAINT [FK_frwVoiceBroadcastList_frwGroups]

GO
ALTER TABLE [dbo].[frwVoiceBroadcastList]
	WITH CHECK
	ADD CONSTRAINT [FK_frwVoiceBroadcastList_frwUsers]
	FOREIGN KEY ([UserID]) REFERENCES [dbo].[frwUsers] ([USER_NAME])
ALTER TABLE [dbo].[frwVoiceBroadcastList]
	CHECK CONSTRAINT [FK_frwVoiceBroadcastList_frwUsers]

GO
ALTER TABLE [dbo].[frwVoiceBroadcastList]
	WITH CHECK
	ADD CONSTRAINT [FK_frwVoiceBroadcastList_frwVoiceBroadcast]
	FOREIGN KEY ([VoiceID]) REFERENCES [dbo].[frwVoiceBroadcast] ([ID])
	ON DELETE CASCADE
	ON UPDATE CASCADE
ALTER TABLE [dbo].[frwVoiceBroadcastList]
	CHECK CONSTRAINT [FK_frwVoiceBroadcastList_frwVoiceBroadcast]

GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwVoiceBroadcastList]
	ON [dbo].[frwVoiceBroadcastList] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwVoiceBroadcastList] SET (LOCK_ESCALATION = TABLE)
GO

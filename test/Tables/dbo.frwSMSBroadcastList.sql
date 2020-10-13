SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[frwSMSBroadcastList] (
		[SMSID]             [int] NOT NULL,
		[GUID]              [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[BroadcastType]     [int] NOT NULL,
		[GroupID]           [int] NULL,
		[UserID]            [varchar](100) COLLATE Arabic_CI_AS NULL,
		[GustID]            [varchar](255) COLLATE Arabic_CI_AS NULL,
		[GustMobile]        [varchar](30) COLLATE Arabic_CI_AS NULL,
		CONSTRAINT [PK_frwSMSBroadcastList]
		PRIMARY KEY
		CLUSTERED
		([SMSID], [GUID])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwSMSBroadcastList]
	ADD
	CONSTRAINT [DF_frwSMSBroadcastList_GUID]
	DEFAULT (newid()) FOR [GUID]
GO
ALTER TABLE [dbo].[frwSMSBroadcastList]
	WITH CHECK
	ADD CONSTRAINT [FK_frwSMSBroadcastList_frwBroadcast_Types]
	FOREIGN KEY ([BroadcastType]) REFERENCES [dbo].[frwBroadcast_Types] ([ID])
	ON UPDATE CASCADE
ALTER TABLE [dbo].[frwSMSBroadcastList]
	CHECK CONSTRAINT [FK_frwSMSBroadcastList_frwBroadcast_Types]

GO
ALTER TABLE [dbo].[frwSMSBroadcastList]
	WITH CHECK
	ADD CONSTRAINT [FK_frwSMSBroadcastList_frwGroups]
	FOREIGN KEY ([GroupID]) REFERENCES [dbo].[frwGROUPS] ([GROUP_ID])
ALTER TABLE [dbo].[frwSMSBroadcastList]
	CHECK CONSTRAINT [FK_frwSMSBroadcastList_frwGroups]

GO
ALTER TABLE [dbo].[frwSMSBroadcastList]
	WITH CHECK
	ADD CONSTRAINT [FK_frwSMSBroadcastList_frwSMSBroadcast]
	FOREIGN KEY ([SMSID]) REFERENCES [dbo].[frwSMSBroadcast] ([ID])
	ON DELETE CASCADE
	ON UPDATE CASCADE
ALTER TABLE [dbo].[frwSMSBroadcastList]
	CHECK CONSTRAINT [FK_frwSMSBroadcastList_frwSMSBroadcast]

GO
ALTER TABLE [dbo].[frwSMSBroadcastList]
	WITH CHECK
	ADD CONSTRAINT [FK_frwSMSBroadcastList_frwUsers]
	FOREIGN KEY ([UserID]) REFERENCES [dbo].[frwUsers] ([USER_NAME])
ALTER TABLE [dbo].[frwSMSBroadcastList]
	CHECK CONSTRAINT [FK_frwSMSBroadcastList_frwUsers]

GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwSMSBroadcastList]
	ON [dbo].[frwSMSBroadcastList] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwSMSBroadcastList] SET (LOCK_ESCALATION = TABLE)
GO

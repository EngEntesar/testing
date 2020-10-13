SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[frwEmailBroadcastList] (
		[EmailID]           [int] NOT NULL,
		[GUID]              [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[BroadcastType]     [int] NOT NULL,
		[GroupID]           [int] NULL,
		[UserID]            [varchar](100) COLLATE Arabic_CI_AS NULL,
		[GustID]            [varchar](255) COLLATE Arabic_CI_AS NULL,
		[GustEmail]         [varchar](255) COLLATE Arabic_CI_AS NULL,
		CONSTRAINT [PK_frwEmailBroadcastList]
		PRIMARY KEY
		CLUSTERED
		([EmailID], [GUID])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwEmailBroadcastList]
	ADD
	CONSTRAINT [DF_frwEmailBroadcastList_GUID]
	DEFAULT (newid()) FOR [GUID]
GO
ALTER TABLE [dbo].[frwEmailBroadcastList]
	WITH CHECK
	ADD CONSTRAINT [FK_frwEmailBroadcastList_frwBroadcast_Types]
	FOREIGN KEY ([BroadcastType]) REFERENCES [dbo].[frwBroadcast_Types] ([ID])
	ON UPDATE CASCADE
ALTER TABLE [dbo].[frwEmailBroadcastList]
	CHECK CONSTRAINT [FK_frwEmailBroadcastList_frwBroadcast_Types]

GO
ALTER TABLE [dbo].[frwEmailBroadcastList]
	WITH CHECK
	ADD CONSTRAINT [FK_frwEmailBroadcastList_frwEmailBroadcast]
	FOREIGN KEY ([EmailID]) REFERENCES [dbo].[frwEmailBroadcast] ([ID])
	ON DELETE CASCADE
	ON UPDATE CASCADE
ALTER TABLE [dbo].[frwEmailBroadcastList]
	CHECK CONSTRAINT [FK_frwEmailBroadcastList_frwEmailBroadcast]

GO
ALTER TABLE [dbo].[frwEmailBroadcastList]
	WITH CHECK
	ADD CONSTRAINT [FK_frwEmailBroadcastList_frwGroups]
	FOREIGN KEY ([GroupID]) REFERENCES [dbo].[frwGROUPS] ([GROUP_ID])
ALTER TABLE [dbo].[frwEmailBroadcastList]
	CHECK CONSTRAINT [FK_frwEmailBroadcastList_frwGroups]

GO
ALTER TABLE [dbo].[frwEmailBroadcastList]
	WITH CHECK
	ADD CONSTRAINT [FK_frwEmailBroadcastList_frwUsers]
	FOREIGN KEY ([UserID]) REFERENCES [dbo].[frwUsers] ([USER_NAME])
ALTER TABLE [dbo].[frwEmailBroadcastList]
	CHECK CONSTRAINT [FK_frwEmailBroadcastList_frwUsers]

GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwEmailBroadcastList]
	ON [dbo].[frwEmailBroadcastList] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwEmailBroadcastList] SET (LOCK_ESCALATION = TABLE)
GO

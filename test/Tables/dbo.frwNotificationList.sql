SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[frwNotificationList] (
		[Field]            [varchar](100) COLLATE Arabic_CI_AS NOT NULL,
		[User_Name]        [varchar](100) COLLATE Arabic_CI_AS NOT NULL,
		[GUID]             [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[PeriodType]       [int] NULL,
		[Period]           [float] NULL,
		[LastSentTime]     [datetime] NULL,
		CONSTRAINT [PK_frwNotificationList]
		PRIMARY KEY
		CLUSTERED
		([GUID])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwNotificationList]
	ADD
	CONSTRAINT [DF_frwNotificationList_GUID]
	DEFAULT (newid()) FOR [GUID]
GO
ALTER TABLE [dbo].[frwNotificationList]
	WITH CHECK
	ADD CONSTRAINT [FK_frwNotificationList_frwDefinitions]
	FOREIGN KEY ([Field]) REFERENCES [dbo].[frwDefinitions] ([Field])
	ON DELETE CASCADE
	ON UPDATE CASCADE
ALTER TABLE [dbo].[frwNotificationList]
	CHECK CONSTRAINT [FK_frwNotificationList_frwDefinitions]

GO
ALTER TABLE [dbo].[frwNotificationList]
	WITH CHECK
	ADD CONSTRAINT [FK_frwNotificationList_frwUsers]
	FOREIGN KEY ([User_Name]) REFERENCES [dbo].[frwUsers] ([USER_NAME])
	ON DELETE CASCADE
	ON UPDATE CASCADE
ALTER TABLE [dbo].[frwNotificationList]
	CHECK CONSTRAINT [FK_frwNotificationList_frwUsers]

GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwNotificationList]
	ON [dbo].[frwNotificationList] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwNotificationList] SET (LOCK_ESCALATION = TABLE)
GO

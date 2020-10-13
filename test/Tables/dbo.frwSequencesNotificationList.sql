SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[frwSequencesNotificationList] (
		[Object_Name]         [varchar](50) COLLATE Arabic_CI_AS NOT NULL,
		[Sequence]            [int] NOT NULL,
		[Approval_TypeID]     [int] NOT NULL,
		[User_Name]           [varchar](100) COLLATE Arabic_CI_AS NOT NULL,
		[GUID]                [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[Formula]             [varchar](max) COLLATE Arabic_CI_AS NULL,
		CONSTRAINT [PK_frwSequencesNotificationList_1]
		PRIMARY KEY
		CLUSTERED
		([Object_Name], [Sequence], [User_Name])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwSequencesNotificationList]
	ADD
	CONSTRAINT [DF_frwSequencesNotificationList_GUID]
	DEFAULT (newid()) FOR [GUID]
GO
ALTER TABLE [dbo].[frwSequencesNotificationList]
	WITH CHECK
	ADD CONSTRAINT [FK_frwSequencesNotificationList_frwObject_Sequences]
	FOREIGN KEY ([Object_Name], [Sequence]) REFERENCES [dbo].[frwObject_Sequences] ([Object_Name], [Sequence])
	ON DELETE CASCADE
	ON UPDATE CASCADE
ALTER TABLE [dbo].[frwSequencesNotificationList]
	CHECK CONSTRAINT [FK_frwSequencesNotificationList_frwObject_Sequences]

GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwSequencesNotificationList]
	ON [dbo].[frwSequencesNotificationList] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwSequencesNotificationList] SET (LOCK_ESCALATION = TABLE)
GO

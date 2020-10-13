SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[frwDiscussions] (
		[Discussion_ObjectName]     [varchar](50) COLLATE Arabic_CI_AS NULL,
		[Discussion_ObjectGUID]     [uniqueidentifier] NOT NULL,
		[Discussion_User]           [varchar](100) COLLATE Arabic_CI_AS NULL,
		[Discussion_Time]           [datetime] NOT NULL,
		[Discussion_Text]           [varchar](max) COLLATE Arabic_CI_AS NOT NULL,
		[GUID]                      [uniqueidentifier] NOT NULL ROWGUIDCOL,
		CONSTRAINT [PK_frwDiscussion]
		PRIMARY KEY
		CLUSTERED
		([GUID])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwDiscussions]
	ADD
	CONSTRAINT [DF_frwDiscussion_GUID]
	DEFAULT (newid()) FOR [GUID]
GO
ALTER TABLE [dbo].[frwDiscussions]
	WITH CHECK
	ADD CONSTRAINT [FK_frwDiscussions_frwOBJECTS]
	FOREIGN KEY ([Discussion_ObjectName]) REFERENCES [dbo].[frwObjects] ([Object_Name])
	ON DELETE SET NULL
	ON UPDATE CASCADE
ALTER TABLE [dbo].[frwDiscussions]
	CHECK CONSTRAINT [FK_frwDiscussions_frwOBJECTS]

GO
ALTER TABLE [dbo].[frwDiscussions]
	WITH CHECK
	ADD CONSTRAINT [FK_frwDiscussions_frwUsers]
	FOREIGN KEY ([Discussion_User]) REFERENCES [dbo].[frwUsers] ([USER_NAME])
	ON DELETE SET NULL
	ON UPDATE CASCADE
ALTER TABLE [dbo].[frwDiscussions]
	CHECK CONSTRAINT [FK_frwDiscussions_frwUsers]

GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwDiscussions]
	ON [dbo].[frwDiscussions] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwDiscussions] SET (LOCK_ESCALATION = TABLE)
GO

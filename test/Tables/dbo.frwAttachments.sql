SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[frwAttachments] (
		[Attachment_ObjectID]       [varchar](50) COLLATE Arabic_CI_AS NOT NULL,
		[Attachment_ObjectGUID]     [uniqueidentifier] NOT NULL,
		[Attachment_FileName]       [varchar](max) COLLATE Arabic_CI_AS NOT NULL,
		[Attachment_Comments]       [varchar](max) COLLATE Arabic_CI_AS NULL,
		[Attachment_TypeID]         [uniqueidentifier] NULL,
		[GUID]                      [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[Attachment_User]           [varchar](20) COLLATE Arabic_CI_AS NULL,
		[Attachment_FileNameDB]     [uniqueidentifier] NULL,
		CONSTRAINT [PK_frwAttachments]
		PRIMARY KEY
		CLUSTERED
		([GUID])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwAttachments]
	ADD
	CONSTRAINT [DF_frwAttachments_GUID]
	DEFAULT (newid()) FOR [GUID]
GO
ALTER TABLE [dbo].[frwAttachments]
	WITH CHECK
	ADD CONSTRAINT [FK_frwAttachments_frwAttachment_Types]
	FOREIGN KEY ([Attachment_TypeID]) REFERENCES [dbo].[frwAttachment_Types] ([GUID])
ALTER TABLE [dbo].[frwAttachments]
	CHECK CONSTRAINT [FK_frwAttachments_frwAttachment_Types]

GO
ALTER TABLE [dbo].[frwAttachments]
	WITH CHECK
	ADD CONSTRAINT [FK_frwAttachments_frwOBJECTS]
	FOREIGN KEY ([Attachment_ObjectID]) REFERENCES [dbo].[frwObjects] ([Object_Name])
	ON DELETE CASCADE
	ON UPDATE CASCADE
ALTER TABLE [dbo].[frwAttachments]
	CHECK CONSTRAINT [FK_frwAttachments_frwOBJECTS]

GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwAttachments]
	ON [dbo].[frwAttachments] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwAttachments] SET (LOCK_ESCALATION = TABLE)
GO

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[frwAttachment_Types] (
		[Attachment_TypeName]     [varchar](100) COLLATE Arabic_CI_AS NOT NULL,
		[GUID]                    [uniqueidentifier] NOT NULL ROWGUIDCOL,
		CONSTRAINT [PK_frwAttachment_Types]
		PRIMARY KEY
		CLUSTERED
		([GUID])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwAttachment_Types]
	ADD
	CONSTRAINT [DF_frwAttachment_Types_GUID]
	DEFAULT (newid()) FOR [GUID]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwAttachment_Types]
	ON [dbo].[frwAttachment_Types] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwAttachment_Types] SET (LOCK_ESCALATION = TABLE)
GO

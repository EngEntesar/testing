SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[frwAttachments_Store] (
		[GUID]         [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[FileName]     [varchar](255) COLLATE Arabic_CI_AS NOT NULL,
		[Data]         [varbinary](max) NULL,
		CONSTRAINT [frwAttachments_Store_FileName]
		PRIMARY KEY
		CLUSTERED
		([GUID])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwAttachments_Store]
	ADD
	CONSTRAINT [frwAttachments_Store_GUID]
	DEFAULT (newid()) FOR [GUID]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwAttachments_Store]
	ON [dbo].[frwAttachments_Store] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwAttachments_Store] SET (LOCK_ESCALATION = TABLE)
GO

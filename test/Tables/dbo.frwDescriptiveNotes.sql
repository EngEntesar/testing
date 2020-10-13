SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[frwDescriptiveNotes] (
		[DescriptiveNote_ObjectName]     [varchar](50) COLLATE Arabic_CI_AS NULL,
		[DescriptiveNote_ObjectGUID]     [uniqueidentifier] NOT NULL,
		[DescriptiveNote_User]           [varchar](100) COLLATE Arabic_CI_AS NULL,
		[DescriptiveNote_Time]           [datetime] NOT NULL,
		[DescriptiveNote_Text]           [varchar](max) COLLATE Arabic_CI_AS NOT NULL,
		[GUID]                           [uniqueidentifier] NOT NULL ROWGUIDCOL,
		CONSTRAINT [PK_frwDescriptiveNote]
		PRIMARY KEY
		CLUSTERED
		([GUID])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwDescriptiveNotes]
	ADD
	CONSTRAINT [DF_frwDescriptiveNote_GUID]
	DEFAULT (newid()) FOR [GUID]
GO
ALTER TABLE [dbo].[frwDescriptiveNotes]
	WITH CHECK
	ADD CONSTRAINT [FK_frwDescriptiveNotes_frwOBJECTS]
	FOREIGN KEY ([DescriptiveNote_ObjectName]) REFERENCES [dbo].[frwObjects] ([Object_Name])
	ON DELETE SET NULL
	ON UPDATE CASCADE
ALTER TABLE [dbo].[frwDescriptiveNotes]
	CHECK CONSTRAINT [FK_frwDescriptiveNotes_frwOBJECTS]

GO
ALTER TABLE [dbo].[frwDescriptiveNotes]
	WITH CHECK
	ADD CONSTRAINT [FK_frwDescriptiveNotes_frwUsers]
	FOREIGN KEY ([DescriptiveNote_User]) REFERENCES [dbo].[frwUsers] ([USER_NAME])
	ON DELETE SET NULL
	ON UPDATE CASCADE
ALTER TABLE [dbo].[frwDescriptiveNotes]
	CHECK CONSTRAINT [FK_frwDescriptiveNotes_frwUsers]

GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwDescriptiveNotes]
	ON [dbo].[frwDescriptiveNotes] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwDescriptiveNotes] SET (LOCK_ESCALATION = TABLE)
GO

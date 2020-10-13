SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[frwObjectTypes] (
		[GUID]     [uniqueidentifier] NULL ROWGUIDCOL,
		[Code]     [varchar](5) COLLATE Arabic_CI_AS NOT NULL,
		[Type]     [varchar](60) COLLATE Arabic_CI_AS NOT NULL,
		CONSTRAINT [frwObjectTypes_Code]
		PRIMARY KEY
		CLUSTERED
		([Code])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwObjectTypes]
	ADD
	CONSTRAINT [frwObjectTypes_GUID]
	DEFAULT (newid()) FOR [GUID]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwObjectTypes]
	ON [dbo].[frwObjectTypes] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwObjectTypes] SET (LOCK_ESCALATION = TABLE)
GO

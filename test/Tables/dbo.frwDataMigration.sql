SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[frwDataMigration] (
		[GUID]     [uniqueidentifier] NOT NULL ROWGUIDCOL,
		CONSTRAINT [PK_frwDataMigration]
		PRIMARY KEY
		CLUSTERED
		([GUID])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwDataMigration]
	ADD
	CONSTRAINT [frwDataMigration_GUID]
	DEFAULT (newid()) FOR [GUID]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwDataMigration]
	ON [dbo].[frwDataMigration] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwDataMigration] SET (LOCK_ESCALATION = TABLE)
GO

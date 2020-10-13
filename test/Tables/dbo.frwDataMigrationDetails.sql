SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[frwDataMigrationDetails] (
		[GUID]              [uniqueidentifier] NULL ROWGUIDCOL,
		[MigrationGUID]     [uniqueidentifier] NOT NULL,
		[ID]                [float] NOT NULL,
		[Source]            [varchar](255) COLLATE Arabic_CI_AS NULL,
		[Destination]       [varchar](255) COLLATE Arabic_CI_AS NOT NULL,
		[Skip]              [bit] NOT NULL,
		[Notes]             [varchar](255) COLLATE Arabic_CI_AS NULL,
		CONSTRAINT [frwDataMigrationDetails_ID]
		PRIMARY KEY
		CLUSTERED
		([MigrationGUID], [ID])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwDataMigrationDetails]
	ADD
	CONSTRAINT [frwDataMigrationDetails_GUID]
	DEFAULT (newid()) FOR [GUID]
GO
ALTER TABLE [dbo].[frwDataMigrationDetails]
	WITH CHECK
	ADD CONSTRAINT [FK_frwDataMigrationDetails_frwDataMigration1]
	FOREIGN KEY ([MigrationGUID]) REFERENCES [dbo].[frwDataMigration] ([GUID])
	ON DELETE CASCADE
	ON UPDATE CASCADE
ALTER TABLE [dbo].[frwDataMigrationDetails]
	CHECK CONSTRAINT [FK_frwDataMigrationDetails_frwDataMigration1]

GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwDataMigrationDetails]
	ON [dbo].[frwDataMigrationDetails] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwDataMigrationDetails] SET (LOCK_ESCALATION = TABLE)
GO

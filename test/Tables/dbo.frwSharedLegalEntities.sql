SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[frwSharedLegalEntities] (
		[Object_Name]       [varchar](50) COLLATE Arabic_CI_AS NOT NULL,
		[LegalEntityID]     [varchar](10) COLLATE Arabic_CI_AS NOT NULL,
		[GUID]              [uniqueidentifier] NULL ROWGUIDCOL,
		[Domain]            [varchar](50) COLLATE Arabic_CI_AS NOT NULL,
		CONSTRAINT [PK_frwSharedLegalEntities]
		PRIMARY KEY
		CLUSTERED
		([Object_Name], [LegalEntityID], [Domain])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwSharedLegalEntities]
	ADD
	CONSTRAINT [DF_frwSharedLegalEntities_GUID]
	DEFAULT (newid()) FOR [GUID]
GO
ALTER TABLE [dbo].[frwSharedLegalEntities]
	WITH CHECK
	ADD CONSTRAINT [FK_frwSharedLegalEntities_frwLegalEntities]
	FOREIGN KEY ([LegalEntityID]) REFERENCES [dbo].[frwLegalEntities] ([LegalEntityID])
	ON DELETE CASCADE
	ON UPDATE CASCADE
ALTER TABLE [dbo].[frwSharedLegalEntities]
	CHECK CONSTRAINT [FK_frwSharedLegalEntities_frwLegalEntities]

GO
ALTER TABLE [dbo].[frwSharedLegalEntities]
	WITH CHECK
	ADD CONSTRAINT [FK_frwSharedLegalEntities_frwOBJECTS]
	FOREIGN KEY ([Object_Name]) REFERENCES [dbo].[frwObjects] ([Object_Name])
	ON DELETE CASCADE
	ON UPDATE CASCADE
ALTER TABLE [dbo].[frwSharedLegalEntities]
	CHECK CONSTRAINT [FK_frwSharedLegalEntities_frwOBJECTS]

GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwSharedLegalEntities]
	ON [dbo].[frwSharedLegalEntities] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwSharedLegalEntities] SET (LOCK_ESCALATION = TABLE)
GO

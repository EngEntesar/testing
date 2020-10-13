SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[frwLegalEntities] (
		[LegalEntityID]     [varchar](10) COLLATE Arabic_CI_AS NOT NULL,
		[Description]       [varchar](255) COLLATE Arabic_CI_AS NOT NULL,
		[GUID]              [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[DescriptionAR]     [varchar](255) COLLATE Arabic_CI_AS NULL,
		CONSTRAINT [PK_frwLegalEntities]
		PRIMARY KEY
		CLUSTERED
		([LegalEntityID])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwLegalEntities]
	ADD
	CONSTRAINT [DF_frwLegalEntities_GUID]
	DEFAULT (newid()) FOR [GUID]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwLegalEntities]
	ON [dbo].[frwLegalEntities] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwLegalEntities] SET (LOCK_ESCALATION = TABLE)
GO

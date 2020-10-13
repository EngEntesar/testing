SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[frwLanguagePacks] (
		[LanguageID]     [int] NOT NULL,
		[Field]          [varchar](100) COLLATE Arabic_CI_AS NOT NULL,
		[Caption]        [varchar](100) COLLATE Arabic_CI_AS NOT NULL,
		[ToolTip]        [nchar](10) COLLATE Arabic_CI_AS NULL,
		CONSTRAINT [PK_frwLanguagePacks]
		PRIMARY KEY
		CLUSTERED
		([LanguageID], [Field])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwLanguagePacks]
	WITH CHECK
	ADD CONSTRAINT [FK_frwLanguagePacks_frwDefinitions]
	FOREIGN KEY ([Field]) REFERENCES [dbo].[frwDefinitions] ([Field])
	ON DELETE CASCADE
	ON UPDATE CASCADE
ALTER TABLE [dbo].[frwLanguagePacks]
	CHECK CONSTRAINT [FK_frwLanguagePacks_frwDefinitions]

GO
ALTER TABLE [dbo].[frwLanguagePacks]
	WITH CHECK
	ADD CONSTRAINT [FK_frwLanguagePacks_frwLanguages]
	FOREIGN KEY ([LanguageID]) REFERENCES [dbo].[frwLanguages] ([ID])
	ON DELETE CASCADE
	ON UPDATE CASCADE
ALTER TABLE [dbo].[frwLanguagePacks]
	CHECK CONSTRAINT [FK_frwLanguagePacks_frwLanguages]

GO
ALTER TABLE [dbo].[frwLanguagePacks] SET (LOCK_ESCALATION = TABLE)
GO

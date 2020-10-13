SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[frwTutorials] (
		[Object_Name]        [varchar](50) COLLATE Arabic_CI_AS NOT NULL,
		[LanguageID]         [int] NOT NULL,
		[PlatformID]         [int] NOT NULL,
		[TutorialTypeID]     [int] NOT NULL,
		[Link]               [varchar](max) COLLATE Arabic_CI_AS NOT NULL,
		[GUID]               [uniqueidentifier] NOT NULL ROWGUIDCOL,
		CONSTRAINT [PK_frwTutorials]
		PRIMARY KEY
		CLUSTERED
		([Object_Name], [LanguageID], [PlatformID], [TutorialTypeID])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwTutorials]
	ADD
	CONSTRAINT [DF__frwTutoria__GUID__4476C863]
	DEFAULT (newid()) FOR [GUID]
GO
ALTER TABLE [dbo].[frwTutorials]
	WITH CHECK
	ADD CONSTRAINT [FK_frwTutorials_frwLanguages]
	FOREIGN KEY ([LanguageID]) REFERENCES [dbo].[frwLanguages] ([ID])
	ON UPDATE CASCADE
ALTER TABLE [dbo].[frwTutorials]
	CHECK CONSTRAINT [FK_frwTutorials_frwLanguages]

GO
ALTER TABLE [dbo].[frwTutorials]
	WITH CHECK
	ADD CONSTRAINT [FK_frwTutorials_frwObjects]
	FOREIGN KEY ([Object_Name]) REFERENCES [dbo].[frwObjects] ([Object_Name])
	ON DELETE CASCADE
	ON UPDATE CASCADE
ALTER TABLE [dbo].[frwTutorials]
	CHECK CONSTRAINT [FK_frwTutorials_frwObjects]

GO
ALTER TABLE [dbo].[frwTutorials]
	WITH CHECK
	ADD CONSTRAINT [FK_frwTutorials_frwPlatforms]
	FOREIGN KEY ([PlatformID]) REFERENCES [dbo].[frwPlatforms] ([ID])
	ON UPDATE CASCADE
ALTER TABLE [dbo].[frwTutorials]
	CHECK CONSTRAINT [FK_frwTutorials_frwPlatforms]

GO
ALTER TABLE [dbo].[frwTutorials]
	WITH CHECK
	ADD CONSTRAINT [FK_frwTutorials_frwTutorial_Types]
	FOREIGN KEY ([TutorialTypeID]) REFERENCES [dbo].[frwTutorial_Types] ([ID])
	ON UPDATE CASCADE
ALTER TABLE [dbo].[frwTutorials]
	CHECK CONSTRAINT [FK_frwTutorials_frwTutorial_Types]

GO
ALTER TABLE [dbo].[frwTutorials] SET (LOCK_ESCALATION = TABLE)
GO

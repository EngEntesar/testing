SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[frwLanguages] (
		[LanguageName]     [varchar](50) COLLATE Arabic_CI_AS NOT NULL,
		[RightToLeft]      [bit] NULL,
		[GUID]             [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[ID]               [int] NOT NULL,
		[ShortCut]         [varchar](10) COLLATE Arabic_CI_AS NULL,
		CONSTRAINT [PK_frwLanguages]
		PRIMARY KEY
		CLUSTERED
		([ID])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwLanguages]
	ADD
	CONSTRAINT [DF__frwLanguag__GUID__17C286CF]
	DEFAULT (newid()) FOR [GUID]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_frwLanguages]
	ON [dbo].[frwLanguages] ([LanguageName])
	ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwLanguages]
	ON [dbo].[frwLanguages] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwLanguages] SET (LOCK_ESCALATION = TABLE)
GO

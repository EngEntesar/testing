SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[frwFavorites] (
		[Favorite_Table]           [varchar](60) COLLATE Arabic_CI_AS NOT NULL,
		[Favorite_Field]           [varchar](60) COLLATE Arabic_CI_AS NOT NULL,
		[Favorite_Description]     [varchar](100) COLLATE Arabic_CI_AS NOT NULL,
		[Favorite_User]            [varchar](20) COLLATE Arabic_CI_AS NULL,
		[GUID]                     [uniqueidentifier] NOT NULL ROWGUIDCOL,
		CONSTRAINT [PK_frwFavorites_1]
		PRIMARY KEY
		CLUSTERED
		([GUID])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwFavorites]
	ADD
	CONSTRAINT [DF_frwFavorites_GUID]
	DEFAULT (newid()) FOR [GUID]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwFavorites]
	ON [dbo].[frwFavorites] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwFavorites] SET (LOCK_ESCALATION = TABLE)
GO

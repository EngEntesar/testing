SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[frwMFavorites] (
		[GUID]           [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[Name]           [varchar](50) COLLATE Arabic_CI_AS NOT NULL,
		[ObjectLink]     [varchar](100) COLLATE Arabic_CI_AS NOT NULL,
		[User]           [varchar](60) COLLATE Arabic_CI_AS NOT NULL,
		[AllUsers]       [bit] NULL,
		[SortOrder]      [float] NULL,
		[Color]          [int] NULL,
		[Height]         [float] NULL,
		[Image]          [varbinary](max) NULL,
		CONSTRAINT [frwMFavorites_Name]
		PRIMARY KEY
		CLUSTERED
		([Name], [ObjectLink], [User])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwMFavorites]
	ADD
	CONSTRAINT [frwMFavorites_GUID]
	DEFAULT (newid()) FOR [GUID]
GO
ALTER TABLE [dbo].[frwMFavorites]
	ADD
	CONSTRAINT [DF_frwMFavorites_Height_1]
	DEFAULT ('4') FOR [Height]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwMFavorites]
	ON [dbo].[frwMFavorites] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwMFavorites] SET (LOCK_ESCALATION = TABLE)
GO

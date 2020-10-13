SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[frwPlatforms] (
		[ID]                [int] NOT NULL,
		[DescriptionAr]     [varchar](100) COLLATE Arabic_CI_AS NOT NULL,
		[DescriptionEn]     [varchar](100) COLLATE Arabic_CI_AS NOT NULL,
		[GUID]              [uniqueidentifier] NOT NULL ROWGUIDCOL,
		CONSTRAINT [PK_frwPlatforms]
		PRIMARY KEY
		CLUSTERED
		([ID])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwPlatforms]
	ADD
	CONSTRAINT [DF__frwPlatfor__GUID__5B0E7E4A]
	DEFAULT (newid()) FOR [GUID]
GO
ALTER TABLE [dbo].[frwPlatforms] SET (LOCK_ESCALATION = TABLE)
GO

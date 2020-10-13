SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[frwLayers] (
		[GUID]       [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[Layer]      [varchar](max) COLLATE Arabic_CI_AS NOT NULL,
		[Object]     [varchar](max) COLLATE Arabic_CI_AS NOT NULL,
		[Status]     [bit] NOT NULL,
		CONSTRAINT [PK_frwLayers]
		PRIMARY KEY
		CLUSTERED
		([GUID])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwLayers]
	ADD
	CONSTRAINT [DF_frwLayers_GUID]
	DEFAULT (newid()) FOR [GUID]
GO
ALTER TABLE [dbo].[frwLayers]
	ADD
	CONSTRAINT [DF_frwLayers_Status]
	DEFAULT ((0)) FOR [Status]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwLayers]
	ON [dbo].[frwLayers] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwLayers] SET (LOCK_ESCALATION = TABLE)
GO

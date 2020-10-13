SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[frwTabs] (
		[TabName]          [varchar](100) COLLATE Arabic_CI_AS NOT NULL,
		[Object]           [varchar](50) COLLATE Arabic_CI_AS NOT NULL,
		[HasDataFetch]     [bit] NOT NULL,
		[GUID]             [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[HasMandatory]     [bit] NOT NULL,
		CONSTRAINT [PK_frwTabs]
		PRIMARY KEY
		CLUSTERED
		([TabName], [Object])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwTabs]
	ADD
	CONSTRAINT [DF_frwTabs_HasDataFetch]
	DEFAULT ((0)) FOR [HasDataFetch]
GO
ALTER TABLE [dbo].[frwTabs]
	ADD
	CONSTRAINT [DF_frwTabs_GUID]
	DEFAULT (newid()) FOR [GUID]
GO
ALTER TABLE [dbo].[frwTabs]
	ADD
	CONSTRAINT [DF_frwTabs_HasMandatory]
	DEFAULT ((1)) FOR [HasMandatory]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwTabs]
	ON [dbo].[frwTabs] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwTabs] SET (LOCK_ESCALATION = TABLE)
GO

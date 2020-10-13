SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[frwLayoutSettings] (
		[GUID]            [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[User]            [varchar](50) COLLATE Arabic_CI_AS NOT NULL,
		[Description]     [varchar](255) COLLATE Arabic_CI_AS NOT NULL,
		[Object_Name]     [varchar](255) COLLATE Arabic_CI_AS NOT NULL,
		[Language]        [varchar](50) COLLATE Arabic_CI_AS NOT NULL,
		[DateTime]        [datetime] NOT NULL,
		[GridData]        [varchar](max) COLLATE Arabic_CI_AS NULL,
		[CardData]        [varchar](max) COLLATE Arabic_CI_AS NULL,
		[PivotData]       [varchar](max) COLLATE Arabic_CI_AS NULL,
		CONSTRAINT [frwLayoutSettings_User]
		PRIMARY KEY
		CLUSTERED
		([GUID])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwLayoutSettings]
	ADD
	CONSTRAINT [frwLayoutSettings_GUID]
	DEFAULT (newid()) FOR [GUID]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwLayoutSettings]
	ON [dbo].[frwLayoutSettings] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwLayoutSettings] SET (LOCK_ESCALATION = TABLE)
GO

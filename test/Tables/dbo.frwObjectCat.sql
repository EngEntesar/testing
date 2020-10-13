SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[frwObjectCat] (
		[OBJECTCAT_ID]         [int] NOT NULL,
		[OBJECTCAT_NAME]       [varchar](50) COLLATE Arabic_CI_AS NOT NULL,
		[GUID]                 [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[OBJECTCAT_Parent]     [int] NULL,
		[Description]          [varchar](255) COLLATE Arabic_CI_AS NULL,
		[OBJECTCAT_NAMEAR]     [varchar](50) COLLATE Arabic_CI_AS NULL,
		[Sort]                 [float] NOT NULL,
		[Icon]                 [varbinary](max) NULL,
		[Dashboard]            [varchar](255) COLLATE Arabic_CI_AS NULL,
		CONSTRAINT [PK_frwObjectCat]
		PRIMARY KEY
		CLUSTERED
		([OBJECTCAT_ID])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwObjectCat]
	ADD
	CONSTRAINT [DF_frw_OBJECTCAT__GUID__2E5B39D7]
	DEFAULT (newid()) FOR [GUID]
GO
ALTER TABLE [dbo].[frwObjectCat]
	WITH CHECK
	ADD CONSTRAINT [FK_frwObjectCat_frwObjectCat]
	FOREIGN KEY ([OBJECTCAT_Parent]) REFERENCES [dbo].[frwObjectCat] ([OBJECTCAT_ID])
ALTER TABLE [dbo].[frwObjectCat]
	CHECK CONSTRAINT [FK_frwObjectCat_frwObjectCat]

GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_frwObjectCat]
	ON [dbo].[frwObjectCat] ([OBJECTCAT_NAME])
	ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwObjectCat]
	ON [dbo].[frwObjectCat] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwObjectCat] SET (LOCK_ESCALATION = TABLE)
GO

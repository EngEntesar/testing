SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[frwObjects_DrillIdentifier] (
		[ObjectName]         [varchar](50) COLLATE Arabic_CI_AS NOT NULL,
		[Caption]            [varchar](255) COLLATE Arabic_CI_AS NOT NULL,
		[Arabic Caption]     [varchar](255) COLLATE Arabic_CI_AS NULL,
		[Filter Field]       [varchar](255) COLLATE Arabic_CI_AS NULL,
		[Prerequisite]       [varchar](255) COLLATE Arabic_CI_AS NULL,
		[Target]             [varchar](255) COLLATE Arabic_CI_AS NULL,
		[GUID]               [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[Filter Value]       [varchar](255) COLLATE Arabic_CI_AS NULL,
		[TargetDataBase]     [varchar](255) COLLATE Arabic_CI_AS NULL,
		[Sort]               [int] NULL,
		CONSTRAINT [PK_frwObjects_DrillIdentifier]
		PRIMARY KEY
		CLUSTERED
		([ObjectName], [Caption], [GUID])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwObjects_DrillIdentifier]
	ADD
	CONSTRAINT [DF_frwObjects_DrillIdentifier_GUID]
	DEFAULT (newid()) FOR [GUID]
GO
ALTER TABLE [dbo].[frwObjects_DrillIdentifier]
	WITH CHECK
	ADD CONSTRAINT [FK_frwObjects_DrillIdentifier_frwOBJECTS1]
	FOREIGN KEY ([ObjectName]) REFERENCES [dbo].[frwObjects] ([Object_Name])
	ON DELETE CASCADE
	ON UPDATE CASCADE
ALTER TABLE [dbo].[frwObjects_DrillIdentifier]
	CHECK CONSTRAINT [FK_frwObjects_DrillIdentifier_frwOBJECTS1]

GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwObjects_DrillIdentifier]
	ON [dbo].[frwObjects_DrillIdentifier] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwObjects_DrillIdentifier] SET (LOCK_ESCALATION = TABLE)
GO

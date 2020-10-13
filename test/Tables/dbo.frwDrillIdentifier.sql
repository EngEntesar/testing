SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[frwDrillIdentifier] (
		[GUID]                       [uniqueidentifier] NULL ROWGUIDCOL,
		[ObjectName]                 [varchar](50) COLLATE Arabic_CI_AS NOT NULL,
		[ObjectIdentifier]           [varchar](255) COLLATE Arabic_CI_AS NOT NULL,
		[FieldIdentifier]            [varchar](255) COLLATE Arabic_CI_AS NOT NULL,
		[FieldTargetObject]          [varchar](255) COLLATE Arabic_CI_AS NOT NULL,
		[RelatedFieldIdentifier]     [varchar](255) COLLATE Arabic_CI_AS NOT NULL,
		CONSTRAINT [frwDrillIdentifier_ObjectName]
		PRIMARY KEY
		CLUSTERED
		([ObjectName])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwDrillIdentifier]
	ADD
	CONSTRAINT [frwDrillIdentifier_GUID]
	DEFAULT (newid()) FOR [GUID]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwDrillIdentifier]
	ON [dbo].[frwDrillIdentifier] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwDrillIdentifier] SET (LOCK_ESCALATION = TABLE)
GO

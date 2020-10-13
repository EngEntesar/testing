SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[frwActions] (
		[Field]                [varchar](100) COLLATE Arabic_CI_AS NOT NULL,
		[Action]               [varchar](255) COLLATE Arabic_CI_AS NOT NULL,
		[GUID]                 [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[Arabic Title]         [varchar](255) COLLATE Arabic_CI_AS NULL,
		[PermissionFrom]       [varchar](255) COLLATE Arabic_CI_AS NULL,
		[TargetObject]         [varchar](255) COLLATE Arabic_CI_AS NULL,
		[TargetObjectGUID]     [varchar](255) COLLATE Arabic_CI_AS NULL,
		[Sort]                 [smallint] NULL,
		[Title]                [varchar](255) COLLATE Arabic_CI_AS NOT NULL,
		[Active]               [bit] NOT NULL,
		[Parameters]           [varchar](255) COLLATE Arabic_CI_AS NULL,
		CONSTRAINT [PK_frwActions]
		PRIMARY KEY
		CLUSTERED
		([Field], [Action])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwActions]
	ADD
	CONSTRAINT [DF_frwActions_GUID]
	DEFAULT (newid()) FOR [GUID]
GO
ALTER TABLE [dbo].[frwActions]
	WITH CHECK
	ADD CONSTRAINT [FK_frwActions_frwDefinitions]
	FOREIGN KEY ([Field]) REFERENCES [dbo].[frwDefinitions] ([Field])
	ON DELETE CASCADE
	ON UPDATE CASCADE
ALTER TABLE [dbo].[frwActions]
	CHECK CONSTRAINT [FK_frwActions_frwDefinitions]

GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwActions]
	ON [dbo].[frwActions] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwActions] SET (LOCK_ESCALATION = TABLE)
GO

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[frwRestrictions] (
		[GroupID]       [int] NOT NULL,
		[Object]        [varchar](50) COLLATE Arabic_CI_AS NOT NULL,
		[Field]         [varchar](255) COLLATE Arabic_CI_AS NULL,
		[Value]         [varchar](255) COLLATE Arabic_CI_AS NULL,
		[GUID]          [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[ApplyAll]      [bit] NULL,
		[TableName]     [varchar](255) COLLATE Arabic_CI_AS NULL,
		CONSTRAINT [PK_frwRestrictions]
		PRIMARY KEY
		CLUSTERED
		([GroupID], [Object], [GUID])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwRestrictions]
	ADD
	CONSTRAINT [DF__frwRestric__GUID__39237A9A]
	DEFAULT (newid()) FOR [GUID]
GO
ALTER TABLE [dbo].[frwRestrictions]
	WITH CHECK
	ADD CONSTRAINT [FK_frwRestrictions_frwGROUPS]
	FOREIGN KEY ([GroupID]) REFERENCES [dbo].[frwGROUPS] ([GROUP_ID])
	ON DELETE CASCADE
	ON UPDATE CASCADE
ALTER TABLE [dbo].[frwRestrictions]
	CHECK CONSTRAINT [FK_frwRestrictions_frwGROUPS]

GO
ALTER TABLE [dbo].[frwRestrictions]
	WITH CHECK
	ADD CONSTRAINT [FK_frwRestrictions_frwOBJECTS1]
	FOREIGN KEY ([Object]) REFERENCES [dbo].[frwObjects] ([Object_Name])
	ON DELETE CASCADE
	ON UPDATE CASCADE
ALTER TABLE [dbo].[frwRestrictions]
	CHECK CONSTRAINT [FK_frwRestrictions_frwOBJECTS1]

GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwRestrictions]
	ON [dbo].[frwRestrictions] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwRestrictions] SET (LOCK_ESCALATION = TABLE)
GO

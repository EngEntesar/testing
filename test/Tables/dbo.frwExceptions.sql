SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[frwExceptions] (
		[GroupID]     [int] NOT NULL,
		[Object]      [varchar](50) COLLATE Arabic_CI_AS NOT NULL,
		[Tab]         [varchar](255) COLLATE Arabic_CI_AS NOT NULL,
		[GUID]        [uniqueidentifier] NOT NULL ROWGUIDCOL,
		CONSTRAINT [PK_frwExceptions]
		PRIMARY KEY
		CLUSTERED
		([GroupID], [Object], [Tab])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwExceptions]
	ADD
	CONSTRAINT [DF__frwExcepti__GUID__436BFEE3]
	DEFAULT (newid()) FOR [GUID]
GO
ALTER TABLE [dbo].[frwExceptions]
	WITH CHECK
	ADD CONSTRAINT [FK_frwExceptions_frwGROUPS]
	FOREIGN KEY ([GroupID]) REFERENCES [dbo].[frwGROUPS] ([GROUP_ID])
	ON DELETE CASCADE
	ON UPDATE CASCADE
ALTER TABLE [dbo].[frwExceptions]
	CHECK CONSTRAINT [FK_frwExceptions_frwGROUPS]

GO
ALTER TABLE [dbo].[frwExceptions]
	WITH CHECK
	ADD CONSTRAINT [FK_frwExceptions_frwOBJECTS]
	FOREIGN KEY ([Object]) REFERENCES [dbo].[frwObjects] ([Object_Name])
	ON DELETE CASCADE
	ON UPDATE CASCADE
ALTER TABLE [dbo].[frwExceptions]
	CHECK CONSTRAINT [FK_frwExceptions_frwOBJECTS]

GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwExceptions]
	ON [dbo].[frwExceptions] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwExceptions] SET (LOCK_ESCALATION = TABLE)
GO

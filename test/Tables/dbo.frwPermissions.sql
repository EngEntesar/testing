SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[frwPermissions] (
		[PERMISSION_USERNAME]     [varchar](100) COLLATE Arabic_CI_AS NOT NULL,
		[PERMISSION_OBJECT]       [varchar](50) COLLATE Arabic_CI_AS NOT NULL,
		[PERMISSION_ACCESS]       [tinyint] NOT NULL,
		[GUID]                    [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[Select]                  [bit] NOT NULL,
		CONSTRAINT [PK_frwPermissions]
		PRIMARY KEY
		CLUSTERED
		([PERMISSION_USERNAME], [PERMISSION_OBJECT], [PERMISSION_ACCESS])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwPermissions]
	ADD
	CONSTRAINT [DF_frwPermissions_PERMISSION_ACCESS]
	DEFAULT ((0)) FOR [PERMISSION_ACCESS]
GO
ALTER TABLE [dbo].[frwPermissions]
	ADD
	CONSTRAINT [DF__frwPERMISS__GUID__151B244E]
	DEFAULT (newid()) FOR [GUID]
GO
ALTER TABLE [dbo].[frwPermissions]
	ADD
	CONSTRAINT [DF_frwPermissions_Select]
	DEFAULT ((0)) FOR [Select]
GO
ALTER TABLE [dbo].[frwPermissions]
	WITH NOCHECK
	ADD CONSTRAINT [FK_frwPermissions_frwOBJECTS]
	FOREIGN KEY ([PERMISSION_OBJECT]) REFERENCES [dbo].[frwObjects] ([Object_Name])
	ON DELETE CASCADE
	ON UPDATE CASCADE
	NOT FOR REPLICATION
ALTER TABLE [dbo].[frwPermissions]
	CHECK CONSTRAINT [FK_frwPermissions_frwOBJECTS]

GO
ALTER TABLE [dbo].[frwPermissions]
	WITH CHECK
	ADD CONSTRAINT [FK_frwPermissions_frwUsers]
	FOREIGN KEY ([PERMISSION_USERNAME]) REFERENCES [dbo].[frwUsers] ([USER_NAME])
	ON DELETE CASCADE
	ON UPDATE CASCADE
ALTER TABLE [dbo].[frwPermissions]
	CHECK CONSTRAINT [FK_frwPermissions_frwUsers]

GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwPermissions]
	ON [dbo].[frwPermissions] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwPermissions] SET (LOCK_ESCALATION = TABLE)
GO

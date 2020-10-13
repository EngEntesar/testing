SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[frwObjects_Collection] (
		[Object_Name]      [varchar](50) COLLATE Arabic_CI_AS NOT NULL,
		[Collection]       [varchar](50) COLLATE Arabic_CI_AS NOT NULL,
		[Filter]           [varchar](max) COLLATE Arabic_CI_AS NULL,
		[Title]            [varchar](255) COLLATE Arabic_CI_AS NULL,
		[Arabic Title]     [varchar](255) COLLATE Arabic_CI_AS NULL,
		[GUID]             [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[Index]            [smallint] NOT NULL,
		CONSTRAINT [PK_frwFormsCollection]
		PRIMARY KEY
		CLUSTERED
		([Object_Name], [Collection], [GUID])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwObjects_Collection]
	ADD
	CONSTRAINT [DF__frwFormsCo__GUID__57A99868]
	DEFAULT (newid()) FOR [GUID]
GO
ALTER TABLE [dbo].[frwObjects_Collection]
	WITH CHECK
	ADD CONSTRAINT [FK_frwObjects_Collection_frwOBJECTS]
	FOREIGN KEY ([Object_Name]) REFERENCES [dbo].[frwObjects] ([Object_Name])
	ON DELETE CASCADE
	ON UPDATE CASCADE
ALTER TABLE [dbo].[frwObjects_Collection]
	CHECK CONSTRAINT [FK_frwObjects_Collection_frwOBJECTS]

GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwObjects_Collection]
	ON [dbo].[frwObjects_Collection] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwObjects_Collection] SET (LOCK_ESCALATION = TABLE)
GO

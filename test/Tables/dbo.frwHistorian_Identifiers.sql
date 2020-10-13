SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[frwHistorian_Identifiers] (
		[Field]          [varchar](255) COLLATE Arabic_CI_AS NOT NULL,
		[TableName]      [varchar](255) COLLATE Arabic_CI_AS NOT NULL,
		[Object]         [varchar](50) COLLATE Arabic_CI_AS NOT NULL,
		[Expression]     [varchar](255) COLLATE Arabic_CI_AS NOT NULL,
		[GUID]           [uniqueidentifier] NOT NULL ROWGUIDCOL,
		CONSTRAINT [PK_frwHistorian_Identifiers]
		PRIMARY KEY
		CLUSTERED
		([Field], [TableName], [Object])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwHistorian_Identifiers]
	ADD
	CONSTRAINT [DF_frwHistorian_Identifiers_GUID]
	DEFAULT (newid()) FOR [GUID]
GO
ALTER TABLE [dbo].[frwHistorian_Identifiers]
	WITH CHECK
	ADD CONSTRAINT [FK_frwHistorian_Identifiers_frwOBJECTS]
	FOREIGN KEY ([Object]) REFERENCES [dbo].[frwObjects] ([Object_Name])
ALTER TABLE [dbo].[frwHistorian_Identifiers]
	CHECK CONSTRAINT [FK_frwHistorian_Identifiers_frwOBJECTS]

GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwHistorian_Identifiers]
	ON [dbo].[frwHistorian_Identifiers] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwHistorian_Identifiers] SET (LOCK_ESCALATION = TABLE)
GO

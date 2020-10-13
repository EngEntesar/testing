SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[frwNewTables] (
		[TableName]      [varchar](255) COLLATE Arabic_CI_AS NOT NULL,
		[PrimaryKey]     [varchar](255) COLLATE Arabic_CI_AS NOT NULL,
		[GUID]           [uniqueidentifier] NULL ROWGUIDCOL,
		[Length]         [int] NULL,
		[DataType]       [varchar](50) COLLATE Arabic_CI_AS NULL,
		[Field1]         [varchar](255) COLLATE Arabic_CI_AS NULL,
		[Length1]        [int] NULL,
		[DataType1]      [varchar](50) COLLATE Arabic_CI_AS NULL,
		CONSTRAINT [PK_frwNewTables]
		PRIMARY KEY
		CLUSTERED
		([TableName])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwNewTables]
	ADD
	CONSTRAINT [DF_frwNewTables_GUID]
	DEFAULT (newid()) FOR [GUID]
GO
ALTER TABLE [dbo].[frwNewTables]
	ADD
	CONSTRAINT [DF_frwNewTables_Length]
	DEFAULT ('50') FOR [Length]
GO
ALTER TABLE [dbo].[frwNewTables]
	ADD
	CONSTRAINT [DF_frwNewTables_DataType]
	DEFAULT ('50') FOR [DataType]
GO
ALTER TABLE [dbo].[frwNewTables]
	ADD
	CONSTRAINT [DF_frwNewTables_Length1]
	DEFAULT ('50') FOR [Length1]
GO
ALTER TABLE [dbo].[frwNewTables]
	ADD
	CONSTRAINT [DF_frwNewTables_DataType1]
	DEFAULT ('50') FOR [DataType1]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwNewTables]
	ON [dbo].[frwNewTables] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwNewTables] SET (LOCK_ESCALATION = TABLE)
GO

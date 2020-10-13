SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Units] (
		[UnitID]      [int] IDENTITY(1, 1) NOT NULL,
		[Name]        [varchar](50) COLLATE Arabic_CI_AS NOT NULL,
		[fkDepID]     [int] NOT NULL,
		[GUID]        [uniqueidentifier] NULL ROWGUIDCOL,
		CONSTRAINT [PK_Units]
		PRIMARY KEY
		CLUSTERED
		([UnitID])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[Units]
	WITH CHECK
	ADD CONSTRAINT [FK_Units_Departments]
	FOREIGN KEY ([fkDepID]) REFERENCES [dbo].[Departments] ([DepID])
ALTER TABLE [dbo].[Units]
	CHECK CONSTRAINT [FK_Units_Departments]

GO
EXEC sp_addextendedproperty N'MS_Description', N'"اسم الوحدة"', 'SCHEMA', N'dbo', 'TABLE', N'Units', 'COLUMN', N'Name'
GO
EXEC sp_addextendedproperty N'MS_Description', N'"القسم"', 'SCHEMA', N'dbo', 'TABLE', N'Units', 'COLUMN', N'fkDepID'
GO
ALTER TABLE [dbo].[Units] SET (LOCK_ESCALATION = TABLE)
GO

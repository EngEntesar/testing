SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Departments] (
		[DepID]         [int] IDENTITY(1, 1) NOT NULL,
		[Name]          [varchar](50) COLLATE Arabic_CI_AS NOT NULL,
		[fkManagID]     [int] NOT NULL,
		[GUID]          [uniqueidentifier] NULL ROWGUIDCOL,
		CONSTRAINT [PK_Departments]
		PRIMARY KEY
		CLUSTERED
		([DepID])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[Departments]
	WITH CHECK
	ADD CONSTRAINT [FK_Departments_Managers]
	FOREIGN KEY ([fkManagID]) REFERENCES [dbo].[Managers] ([ManagID])
ALTER TABLE [dbo].[Departments]
	CHECK CONSTRAINT [FK_Departments_Managers]

GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_Departments]
	ON [dbo].[Departments] ([GUID])
	ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'"القسم"', 'SCHEMA', N'dbo', 'TABLE', N'Departments', 'COLUMN', N'Name'
GO
EXEC sp_addextendedproperty N'MS_Description', N'"مدير القسم"', 'SCHEMA', N'dbo', 'TABLE', N'Departments', 'COLUMN', N'fkManagID'
GO
ALTER TABLE [dbo].[Departments] SET (LOCK_ESCALATION = TABLE)
GO

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Managers] (
		[ManagID]         [int] IDENTITY(1, 1) NOT NULL,
		[Name]            [varchar](50) COLLATE Arabic_CI_AS NOT NULL,
		[Description]     [varchar](50) COLLATE Arabic_CI_AS NULL,
		[GUID]            [uniqueidentifier] NULL ROWGUIDCOL,
		CONSTRAINT [PK_Managers]
		PRIMARY KEY
		CLUSTERED
		([ManagID])
	ON [PRIMARY]
)
GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_Managers]
	ON [dbo].[Managers] ([GUID])
	ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'"الاسم"', 'SCHEMA', N'dbo', 'TABLE', N'Managers', 'COLUMN', N'Name'
GO
EXEC sp_addextendedproperty N'MS_Description', N'"الوصف"', 'SCHEMA', N'dbo', 'TABLE', N'Managers', 'COLUMN', N'Description'
GO
ALTER TABLE [dbo].[Managers] SET (LOCK_ESCALATION = TABLE)
GO

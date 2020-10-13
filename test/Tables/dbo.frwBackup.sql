SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[frwBackup] (
		[GUID]               [uniqueidentifier] NOT NULL,
		[ID]                 [int] IDENTITY(1, 1) NOT NULL,
		[Title]              [varchar](250) COLLATE Arabic_CI_AS NULL,
		[BackupDate]         [datetime] NULL,
		[Link]               [varchar](250) COLLATE Arabic_CI_AS NULL,
		[Createduser]        [varchar](50) COLLATE Arabic_CI_AS NULL,
		[CreatedDate]        [datetime] NULL,
		[IncludeReports]     [bit] NULL,
		CONSTRAINT [PK_frwBackup]
		PRIMARY KEY
		CLUSTERED
		([ID])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwBackup]
	ADD
	CONSTRAINT [DF_frwBackup_GUID]
	DEFAULT (newid()) FOR [GUID]
GO
ALTER TABLE [dbo].[frwBackup] SET (LOCK_ESCALATION = TABLE)
GO

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[frwWizard] (
		[Wizard]     [varchar](50) COLLATE Arabic_CI_AS NOT NULL,
		[GUID]       [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[ID]         [int] NOT NULL,
		CONSTRAINT [PK_frwWizard]
		PRIMARY KEY
		CLUSTERED
		([ID])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwWizard]
	ADD
	CONSTRAINT [DF_frwWizard_GUID]
	DEFAULT (newid()) FOR [GUID]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwWizard]
	ON [dbo].[frwWizard] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwWizard] SET (LOCK_ESCALATION = TABLE)
GO

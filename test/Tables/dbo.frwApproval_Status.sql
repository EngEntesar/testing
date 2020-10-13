SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[frwApproval_Status] (
		[GUID]                  [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[Approval_Status]       [varchar](50) COLLATE Arabic_CI_AS NOT NULL,
		[Approval_StatusAR]     [varchar](100) COLLATE Arabic_CI_AS NULL,
		CONSTRAINT [PK_frwApproval_Status]
		PRIMARY KEY
		CLUSTERED
		([Approval_Status])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwApproval_Status]
	ADD
	CONSTRAINT [DF_frwApproval_Status_GUID]
	DEFAULT (newid()) FOR [GUID]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwApproval_Status]
	ON [dbo].[frwApproval_Status] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwApproval_Status] SET (LOCK_ESCALATION = TABLE)
GO

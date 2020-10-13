SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[frwApproval_Type] (
		[Approval_Type]       [varchar](50) COLLATE Arabic_CI_AS NOT NULL,
		[Approval_TypeID]     [int] NOT NULL,
		[GUID]                [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[Approval_TypeAR]     [varchar](100) COLLATE Arabic_CI_AS NULL,
		CONSTRAINT [PK_frwApproval_Type]
		PRIMARY KEY
		CLUSTERED
		([Approval_TypeID])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwApproval_Type]
	ADD
	CONSTRAINT [DF__frwApprova__GUID__117F9D94]
	DEFAULT (newid()) FOR [GUID]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwApproval_Type]
	ON [dbo].[frwApproval_Type] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwApproval_Type] SET (LOCK_ESCALATION = TABLE)
GO

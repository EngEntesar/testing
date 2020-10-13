SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[frwWorkflow] (
		[GUID]              [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[Object_Name]       [varchar](50) COLLATE Arabic_CI_AS NOT NULL,
		[Action]            [varchar](200) COLLATE Arabic_CI_AS NOT NULL,
		[ApprovalType]      [int] NOT NULL,
		[ApprovalEvent]     [varchar](100) COLLATE Arabic_CI_AS NULL,
		[Order]             [int] NOT NULL,
		[FinalApprover]     [varchar](100) COLLATE Arabic_CI_AS NULL,
		CONSTRAINT [frwWorkflow_Object]
		PRIMARY KEY
		CLUSTERED
		([GUID])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwWorkflow]
	ADD
	CONSTRAINT [frwWorkflow_GUID]
	DEFAULT (newid()) FOR [GUID]
GO
ALTER TABLE [dbo].[frwWorkflow]
	WITH CHECK
	ADD CONSTRAINT [FK_frwWorkflow_frwApproval_Type]
	FOREIGN KEY ([ApprovalType]) REFERENCES [dbo].[frwApproval_Type] ([Approval_TypeID])
ALTER TABLE [dbo].[frwWorkflow]
	CHECK CONSTRAINT [FK_frwWorkflow_frwApproval_Type]

GO
ALTER TABLE [dbo].[frwWorkflow]
	WITH CHECK
	ADD CONSTRAINT [FK_frwWorkflow_frwOBJECTS]
	FOREIGN KEY ([Object_Name]) REFERENCES [dbo].[frwObjects] ([Object_Name])
ALTER TABLE [dbo].[frwWorkflow]
	CHECK CONSTRAINT [FK_frwWorkflow_frwOBJECTS]

GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwWorkflow]
	ON [dbo].[frwWorkflow] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwWorkflow] SET (LOCK_ESCALATION = TABLE)
GO

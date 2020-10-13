SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[frwWorkflow_Approvals] (
		[GUID]                   [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[Workflow_GUID]          [uniqueidentifier] NULL,
		[RecirculationAfter]     [float] NULL,
		[PeriodType]             [int] NULL,
		[Specific]               [varchar](100) COLLATE Arabic_CI_AS NULL,
		[Hierarchy]              [varchar](100) COLLATE Arabic_CI_AS NULL,
		CONSTRAINT [PK_frwWorkflow_Approvals]
		PRIMARY KEY
		CLUSTERED
		([GUID])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwWorkflow_Approvals]
	WITH CHECK
	ADD CONSTRAINT [FK_frwWorkflow_Approvals_frwHierarchy]
	FOREIGN KEY ([Hierarchy]) REFERENCES [dbo].[frwHierarchy] ([Hierarchy])
ALTER TABLE [dbo].[frwWorkflow_Approvals]
	CHECK CONSTRAINT [FK_frwWorkflow_Approvals_frwHierarchy]

GO
ALTER TABLE [dbo].[frwWorkflow_Approvals]
	WITH CHECK
	ADD CONSTRAINT [FK_frwWorkflow_Approvals_frwUsers]
	FOREIGN KEY ([Specific]) REFERENCES [dbo].[frwUsers] ([USER_NAME])
ALTER TABLE [dbo].[frwWorkflow_Approvals]
	CHECK CONSTRAINT [FK_frwWorkflow_Approvals_frwUsers]

GO
ALTER TABLE [dbo].[frwWorkflow_Approvals]
	WITH CHECK
	ADD CONSTRAINT [FK_frwWorkflow_Approvals_frwWorkflow]
	FOREIGN KEY ([Workflow_GUID]) REFERENCES [dbo].[frwWorkflow] ([GUID])
	ON DELETE CASCADE
	ON UPDATE CASCADE
ALTER TABLE [dbo].[frwWorkflow_Approvals]
	CHECK CONSTRAINT [FK_frwWorkflow_Approvals_frwWorkflow]

GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwWorkflow_Approvals]
	ON [dbo].[frwWorkflow_Approvals] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwWorkflow_Approvals] SET (LOCK_ESCALATION = TABLE)
GO

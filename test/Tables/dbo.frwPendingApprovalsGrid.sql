SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[frwPendingApprovalsGrid] (
		[GUID]                              [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[PendingApprovals_ObjectName]       [varchar](50) COLLATE Arabic_CI_AS NULL,
		[PendingApprovals_ObjecTitle]       [varchar](255) COLLATE Arabic_CI_AS NULL,
		[PendingApprovals_ApproverName]     [varchar](100) COLLATE Arabic_CI_AS NULL,
		[PendingApprovals_DelegateID]       [int] NULL,
		[PendingApprovals_Selected]         [bit] NULL,
		[PendingApprovals_ObjectGUID]       [uniqueidentifier] NULL,
		CONSTRAINT [PK_frwPendingApprovalsGrid]
		PRIMARY KEY
		CLUSTERED
		([GUID])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwPendingApprovalsGrid]
	ADD
	CONSTRAINT [DF_frwPendingApprovalsGrid_GUID]
	DEFAULT (newid()) FOR [GUID]
GO
ALTER TABLE [dbo].[frwPendingApprovalsGrid]
	WITH CHECK
	ADD CONSTRAINT [FK_frwPendingApprovalsGrid_frwDelegatePendingApp]
	FOREIGN KEY ([PendingApprovals_DelegateID]) REFERENCES [dbo].[frwDelegatePendingApp] ([DelegatePendingApp_ID])
	ON DELETE CASCADE
	ON UPDATE CASCADE
ALTER TABLE [dbo].[frwPendingApprovalsGrid]
	CHECK CONSTRAINT [FK_frwPendingApprovalsGrid_frwDelegatePendingApp]

GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwPendingApprovalsGrid]
	ON [dbo].[frwPendingApprovalsGrid] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwPendingApprovalsGrid] SET (LOCK_ESCALATION = TABLE)
GO

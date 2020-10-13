SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[frwHierarchy] (
		[GUID]               [uniqueidentifier] NULL ROWGUIDCOL,
		[Hierarchy]          [varchar](100) COLLATE Arabic_CI_AS NOT NULL,
		[ReadFrom]           [varchar](100) COLLATE Arabic_CI_AS NOT NULL,
		[Requester]          [varchar](100) COLLATE Arabic_CI_AS NOT NULL,
		[Approver]           [varchar](100) COLLATE Arabic_CI_AS NOT NULL,
		[RequesterEmail]     [varchar](100) COLLATE Arabic_CI_AS NULL,
		[ApproverEmail]      [varchar](100) COLLATE Arabic_CI_AS NULL,
		[ApproverLogin]      [varchar](100) COLLATE Arabic_CI_AS NULL,
		[RequesterLogin]     [varchar](100) COLLATE Arabic_CI_AS NULL,
		CONSTRAINT [frwHierarchy_Hierarchy]
		PRIMARY KEY
		CLUSTERED
		([Hierarchy])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwHierarchy]
	ADD
	CONSTRAINT [frwHierarchy_GUID]
	DEFAULT (newid()) FOR [GUID]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwHierarchy]
	ON [dbo].[frwHierarchy] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwHierarchy] SET (LOCK_ESCALATION = TABLE)
GO

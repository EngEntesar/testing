SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[frwApproval_Consultants] (
		[Approval_GUID]      [uniqueidentifier] NOT NULL,
		[GUID]               [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[User_Name]          [varchar](100) COLLATE Arabic_CI_AS NOT NULL,
		[Consultation]       [varchar](max) COLLATE Arabic_CI_AS NULL,
		[Resent]             [bit] NULL,
		[Sent]               [bit] NULL,
		[Feedback]           [varchar](max) COLLATE Arabic_CI_AS NULL,
		[Object_Name]        [varchar](50) COLLATE Arabic_CI_AS NULL,
		[Object_GUID]        [varchar](100) COLLATE Arabic_CI_AS NULL,
		[Object_Date]        [datetime] NULL,
		[User_Requester]     [varchar](100) COLLATE Arabic_CI_AS NULL,
		[Reference]          [varchar](255) COLLATE Arabic_CI_AS NULL,
		[Public]             [bit] NULL,
		CONSTRAINT [PK_frwApproval_Consultants_1]
		PRIMARY KEY
		CLUSTERED
		([Approval_GUID], [GUID], [User_Name])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwApproval_Consultants]
	WITH CHECK
	ADD CONSTRAINT [FK_frwApproval_Consultants_frwApprovals]
	FOREIGN KEY ([Approval_GUID]) REFERENCES [dbo].[frwApprovals] ([GUID])
	ON DELETE CASCADE
	ON UPDATE CASCADE
ALTER TABLE [dbo].[frwApproval_Consultants]
	CHECK CONSTRAINT [FK_frwApproval_Consultants_frwApprovals]

GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwApproval_Consultants]
	ON [dbo].[frwApproval_Consultants] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwApproval_Consultants] SET (LOCK_ESCALATION = TABLE)
GO

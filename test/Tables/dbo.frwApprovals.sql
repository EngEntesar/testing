SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[frwApprovals] (
		[GUID]                        [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[Object_Name]                 [varchar](50) COLLATE Arabic_CI_AS NULL,
		[Object_GUID]                 [uniqueidentifier] NULL,
		[Object_Date]                 [datetime] NULL,
		[User_Name]                   [varchar](100) COLLATE Arabic_CI_AS NULL,
		[Comments]                    [varchar](255) COLLATE Arabic_CI_AS NULL,
		[Approval_Status]             [varchar](50) COLLATE Arabic_CI_AS NULL,
		[Approved_Date]               [datetime] NULL,
		[Sequence]                    [int] NULL,
		[Request_Time]                [datetime] NULL,
		[Sent]                        [bit] NULL,
		[Close_Date]                  [datetime] NULL,
		[User_Comments]               [varchar](max) COLLATE Arabic_CI_AS NULL,
		[AdHoc]                       [bit] NULL,
		[PeriodType]                  [int] NULL,
		[Waiting]                     [float] NULL,
		[EscalationTo]                [varchar](100) COLLATE Arabic_CI_AS NULL,
		[Hierarchy]                   [varchar](100) COLLATE Arabic_CI_AS NULL,
		[Formula]                     [varchar](max) COLLATE Arabic_CI_AS NULL,
		[Approval_TypeID]             [int] NULL,
		[Delegated Date]              [date] NULL,
		[AfterApproval]               [varchar](255) COLLATE Arabic_CI_AS NULL,
		[AfteRejection]               [varchar](255) COLLATE Arabic_CI_AS NULL,
		[AfterApprovalWebService]     [varchar](255) COLLATE Arabic_CI_AS NULL,
		[AfteRejectionWebService]     [varchar](255) COLLATE Arabic_CI_AS NULL,
		[Object_NameAr]               [varchar](255) COLLATE Arabic_CI_AS NULL,
		CONSTRAINT [PK_frwApprovals]
		PRIMARY KEY
		CLUSTERED
		([GUID])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwApprovals]
	ADD
	CONSTRAINT [DF_frwApprovals_GUID]
	DEFAULT (newid()) FOR [GUID]
GO
ALTER TABLE [dbo].[frwApprovals]
	ADD
	CONSTRAINT [DF_frwApprovals_Sent]
	DEFAULT ((0)) FOR [Sent]
GO
ALTER TABLE [dbo].[frwApprovals]
	ADD
	CONSTRAINT [DF_frwApprovals_Ad hoc]
	DEFAULT ((0)) FOR [AdHoc]
GO
ALTER TABLE [dbo].[frwApprovals]
	WITH CHECK
	ADD CONSTRAINT [FK_frwApprovals_frwApproval_Status]
	FOREIGN KEY ([Approval_Status]) REFERENCES [dbo].[frwApproval_Status] ([Approval_Status])
	ON DELETE CASCADE
	ON UPDATE CASCADE
ALTER TABLE [dbo].[frwApprovals]
	CHECK CONSTRAINT [FK_frwApprovals_frwApproval_Status]

GO
ALTER TABLE [dbo].[frwApprovals]
	WITH CHECK
	ADD CONSTRAINT [FK_frwApprovals_frwOBJECTS]
	FOREIGN KEY ([Object_Name]) REFERENCES [dbo].[frwObjects] ([Object_Name])
	ON DELETE CASCADE
	ON UPDATE CASCADE
ALTER TABLE [dbo].[frwApprovals]
	CHECK CONSTRAINT [FK_frwApprovals_frwOBJECTS]

GO
ALTER TABLE [dbo].[frwApprovals]
	WITH CHECK
	ADD CONSTRAINT [FK_frwApprovals_frwUsers]
	FOREIGN KEY ([User_Name]) REFERENCES [dbo].[frwUsers] ([USER_NAME])
	ON DELETE CASCADE
	ON UPDATE CASCADE
ALTER TABLE [dbo].[frwApprovals]
	CHECK CONSTRAINT [FK_frwApprovals_frwUsers]

GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwApprovals]
	ON [dbo].[frwApprovals] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwApprovals] SET (LOCK_ESCALATION = TABLE)
GO

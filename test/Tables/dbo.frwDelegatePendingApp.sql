SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[frwDelegatePendingApp] (
		[DelegatePendingApp_ID]                    [int] IDENTITY(1, 1) NOT NULL,
		[DelegatePendingApp_From]                  [varchar](100) COLLATE Arabic_CI_AS NULL,
		[DelegatePendingApp_ToNewApprover]         [varchar](100) COLLATE Arabic_CI_AS NULL,
		[GUID]                                     [uniqueidentifier] NULL ROWGUIDCOL,
		[DelegatePendingApp_CreateDate]            [datetime] NULL,
		[DelegatePendingApp_Reason]                [varchar](max) COLLATE Arabic_CI_AS NULL,
		[DelegatePendingApp_Note]                  [varchar](max) COLLATE Arabic_CI_AS NULL,
		[DelegatePendingApp_RequestStatus]         [varchar](100) COLLATE Arabic_CI_AS NULL,
		[DelegatePendingApp_NumberofApprovals]     [int] NULL,
		[DelegatePendingApp_Attachment]            [uniqueidentifier] NULL,
		CONSTRAINT [PK_frwDelegatePendingApp]
		PRIMARY KEY
		CLUSTERED
		([DelegatePendingApp_ID])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwDelegatePendingApp]
	ADD
	CONSTRAINT [DF_frwDelegatePendingApp_GUID]
	DEFAULT (newid()) FOR [GUID]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwDelegatePendingApp]
	ON [dbo].[frwDelegatePendingApp] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwDelegatePendingApp] SET (LOCK_ESCALATION = TABLE)
GO

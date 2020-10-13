SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[frwUsers] (
		[USER_NAME]            [varchar](100) COLLATE Arabic_CI_AS NOT NULL,
		[USER_GROUPID]         [int] NULL,
		[LAST_UPDATE]          [datetime] NULL,
		[FIRSTTIME]            [bit] NULL,
		[DAYSAVAILABLE]        [int] NULL,
		[LAST_PWDCHANGE]       [datetime] NULL,
		[MASTERPWD]            [varchar](30) COLLATE Arabic_CI_AS NULL,
		[BLOCKEDUSER]          [bit] NOT NULL,
		[BLOCKEDPCNAME]        [varchar](50) COLLATE Arabic_CI_AS NULL,
		[BLOCKEDUSERNAME]      [varchar](50) COLLATE Arabic_CI_AS NULL,
		[BLOCKEDDATE]          [datetime] NULL,
		[BLOCKEDBADMIN]        [bit] NOT NULL,
		[GUID]                 [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[EMail]                [nvarchar](100) COLLATE Arabic_CI_AS NULL,
		[ForwardApprovals]     [varchar](100) COLLATE Arabic_CI_AS NULL,
		[Description]          [varchar](100) COLLATE Arabic_CI_AS NULL,
		[USER_AccountType]     [int] NOT NULL,
		[Until]                [datetime] NULL,
		[Title]                [varchar](100) COLLATE Arabic_CI_AS NULL,
		[OneTimePassword]      [bit] NULL,
		[Mobile]               [varchar](30) COLLATE Arabic_CI_AS NULL,
		[Country]              [varchar](50) COLLATE Arabic_CI_AS NULL,
		[City]                 [varchar](50) COLLATE Arabic_CI_AS NULL,
		CONSTRAINT [PK_frwUsers]
		PRIMARY KEY
		CLUSTERED
		([USER_NAME])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwUsers]
	ADD
	CONSTRAINT [DF_frwUsers_USER_GROUPID]
	DEFAULT ((0)) FOR [USER_GROUPID]
GO
ALTER TABLE [dbo].[frwUsers]
	ADD
	CONSTRAINT [DF_frwUsers_FIRSTTIME]
	DEFAULT ((0)) FOR [FIRSTTIME]
GO
ALTER TABLE [dbo].[frwUsers]
	ADD
	CONSTRAINT [DF_frwUsers_DAYSAVAILABLE]
	DEFAULT ((0)) FOR [DAYSAVAILABLE]
GO
ALTER TABLE [dbo].[frwUsers]
	ADD
	CONSTRAINT [DF_frwUsers_BLOCKEDUSER]
	DEFAULT ((0)) FOR [BLOCKEDUSER]
GO
ALTER TABLE [dbo].[frwUsers]
	ADD
	CONSTRAINT [DF_frwUsers_BLOCKEDBADMIN]
	DEFAULT ((0)) FOR [BLOCKEDBADMIN]
GO
ALTER TABLE [dbo].[frwUsers]
	ADD
	CONSTRAINT [DF_frw_USERS__GUID__0ADCF370]
	DEFAULT (newid()) FOR [GUID]
GO
ALTER TABLE [dbo].[frwUsers]
	ADD
	CONSTRAINT [DF_USER_AccountType]
	DEFAULT ((1)) FOR [USER_AccountType]
GO
ALTER TABLE [dbo].[frwUsers]
	WITH NOCHECK
	ADD CONSTRAINT [FK_frw_USERS_frwGROUPS]
	FOREIGN KEY ([USER_GROUPID]) REFERENCES [dbo].[frwGROUPS] ([GROUP_ID])
	ON UPDATE CASCADE
ALTER TABLE [dbo].[frwUsers]
	CHECK CONSTRAINT [FK_frw_USERS_frwGROUPS]

GO
ALTER TABLE [dbo].[frwUsers]
	WITH CHECK
	ADD CONSTRAINT [FK_frwUsers_frwAccount_Types]
	FOREIGN KEY ([USER_AccountType]) REFERENCES [dbo].[frwAccount_Types] ([ID])
	ON UPDATE CASCADE
ALTER TABLE [dbo].[frwUsers]
	CHECK CONSTRAINT [FK_frwUsers_frwAccount_Types]

GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwUsers]
	ON [dbo].[frwUsers] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwUsers] SET (LOCK_ESCALATION = TABLE)
GO

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[frwObject_Approvals] (
		[Object_Name]      [varchar](50) COLLATE Arabic_CI_AS NOT NULL,
		[User_Name]        [varchar](100) COLLATE Arabic_CI_AS NOT NULL,
		[Sequence]         [int] NULL,
		[GUID]             [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[Waiting]          [float] NULL,
		[Hierarchy]        [varchar](100) COLLATE Arabic_CI_AS NULL,
		[Formula]          [varchar](max) COLLATE Arabic_CI_AS NULL,
		[PeriodType]       [int] NULL,
		[EscalationTo]     [varchar](100) COLLATE Arabic_CI_AS NULL,
		[Object]           [varchar](255) COLLATE Arabic_CI_AS NULL,
		CONSTRAINT [PK_frwObject_Approvals]
		PRIMARY KEY
		CLUSTERED
		([GUID])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwObject_Approvals]
	ADD
	CONSTRAINT [DF_frwObject_Approvals_GUID]
	DEFAULT (newid()) FOR [GUID]
GO
ALTER TABLE [dbo].[frwObject_Approvals]
	WITH CHECK
	ADD CONSTRAINT [FK_frwObject_Approvals_frwObject_Sequences]
	FOREIGN KEY ([Object_Name], [Sequence]) REFERENCES [dbo].[frwObject_Sequences] ([Object_Name], [Sequence])
	ON DELETE CASCADE
	ON UPDATE CASCADE
ALTER TABLE [dbo].[frwObject_Approvals]
	CHECK CONSTRAINT [FK_frwObject_Approvals_frwObject_Sequences]

GO
ALTER TABLE [dbo].[frwObject_Approvals]
	WITH CHECK
	ADD CONSTRAINT [FK_frwObject_Approvals_frwPeriouds]
	FOREIGN KEY ([PeriodType]) REFERENCES [dbo].[frwPeriouds] ([ID])
	ON DELETE CASCADE
	ON UPDATE CASCADE
ALTER TABLE [dbo].[frwObject_Approvals]
	CHECK CONSTRAINT [FK_frwObject_Approvals_frwPeriouds]

GO
ALTER TABLE [dbo].[frwObject_Approvals]
	WITH CHECK
	ADD CONSTRAINT [FK_frwObject_frwApprovals_frwUsers]
	FOREIGN KEY ([User_Name]) REFERENCES [dbo].[frwUsers] ([USER_NAME])
	ON DELETE CASCADE
	ON UPDATE CASCADE
ALTER TABLE [dbo].[frwObject_Approvals]
	CHECK CONSTRAINT [FK_frwObject_frwApprovals_frwUsers]

GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwObject_Approvals]
	ON [dbo].[frwObject_Approvals] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwObject_Approvals] SET (LOCK_ESCALATION = TABLE)
GO

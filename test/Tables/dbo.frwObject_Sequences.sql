SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[frwObject_Sequences] (
		[Object_Name]                 [varchar](50) COLLATE Arabic_CI_AS NOT NULL,
		[Sequence]                    [int] NOT NULL,
		[Approval_TypeID]             [int] NOT NULL,
		[GUID]                        [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[AfterApproval]               [varchar](255) COLLATE Arabic_CI_AS NULL,
		[AfteRejection]               [varchar](255) COLLATE Arabic_CI_AS NULL,
		[AfterApprovalWebService]     [varchar](max) COLLATE Arabic_CI_AS NULL,
		[AfteRejectionWebService]     [varchar](max) COLLATE Arabic_CI_AS NULL,
		[Object]                      [varchar](255) COLLATE Arabic_CI_AS NULL,
		CONSTRAINT [PK_frwObject_Sequences]
		PRIMARY KEY
		CLUSTERED
		([Object_Name], [Sequence])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwObject_Sequences]
	ADD
	CONSTRAINT [DF_frwObject_Sequences_GUID]
	DEFAULT (newid()) FOR [GUID]
GO
ALTER TABLE [dbo].[frwObject_Sequences]
	WITH CHECK
	ADD CONSTRAINT [FK_frwObject_Sequences_frwApproval_Type]
	FOREIGN KEY ([Approval_TypeID]) REFERENCES [dbo].[frwApproval_Type] ([Approval_TypeID])
	ON DELETE CASCADE
	ON UPDATE CASCADE
ALTER TABLE [dbo].[frwObject_Sequences]
	CHECK CONSTRAINT [FK_frwObject_Sequences_frwApproval_Type]

GO
ALTER TABLE [dbo].[frwObject_Sequences]
	WITH CHECK
	ADD CONSTRAINT [FK_frwObject_Sequences_frwObject_Sequences]
	FOREIGN KEY ([Object_Name], [Sequence]) REFERENCES [dbo].[frwObject_Sequences] ([Object_Name], [Sequence])
ALTER TABLE [dbo].[frwObject_Sequences]
	CHECK CONSTRAINT [FK_frwObject_Sequences_frwObject_Sequences]

GO
ALTER TABLE [dbo].[frwObject_Sequences]
	WITH CHECK
	ADD CONSTRAINT [FK_frwObject_Sequences_frwOBJECTS]
	FOREIGN KEY ([Object_Name]) REFERENCES [dbo].[frwObjects] ([Object_Name])
	ON DELETE CASCADE
	ON UPDATE CASCADE
ALTER TABLE [dbo].[frwObject_Sequences]
	CHECK CONSTRAINT [FK_frwObject_Sequences_frwOBJECTS]

GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwObject_Sequences]
	ON [dbo].[frwObject_Sequences] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwObject_Sequences] SET (LOCK_ESCALATION = TABLE)
GO

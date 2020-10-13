SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProjectPlans] (
		[PlanID]               [int] IDENTITY(1, 1) NOT NULL,
		[ProjRequirements]     [varchar](250) COLLATE Arabic_CI_AS NOT NULL,
		[IsRequired]           [bit] NOT NULL,
		[Email]                [varchar](250) COLLATE Arabic_CI_AS NOT NULL,
		[Remarks]              [text] COLLATE Arabic_CI_AS NULL,
		[GUID]                 [uniqueidentifier] NULL ROWGUIDCOL,
		[fkUSER_NAME]          [varchar](100) COLLATE Arabic_CI_AS NOT NULL,
		[fkProjID]             [int] NOT NULL,
		CONSTRAINT [PK_ProjectPlans]
		PRIMARY KEY
		CLUSTERED
		([PlanID])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[ProjectPlans]
	ADD
	CONSTRAINT [DF_ProjectPlans_IsRequired]
	DEFAULT ((0)) FOR [IsRequired]
GO
ALTER TABLE [dbo].[ProjectPlans]
	WITH CHECK
	ADD CONSTRAINT [FK_ProjectPlans_Projects]
	FOREIGN KEY ([fkProjID]) REFERENCES [dbo].[Projects] ([ProjID])
ALTER TABLE [dbo].[ProjectPlans]
	CHECK CONSTRAINT [FK_ProjectPlans_Projects]

GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_ProjectPlans]
	ON [dbo].[ProjectPlans] ([GUID])
	ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'"متطلبات المشروع"', 'SCHEMA', N'dbo', 'TABLE', N'ProjectPlans', 'COLUMN', N'ProjRequirements'
GO
EXEC sp_addextendedproperty N'MS_Description', N'"هل هو مطلوب؟"', 'SCHEMA', N'dbo', 'TABLE', N'ProjectPlans', 'COLUMN', N'IsRequired'
GO
EXEC sp_addextendedproperty N'MS_Description', N'"الايميل"', 'SCHEMA', N'dbo', 'TABLE', N'ProjectPlans', 'COLUMN', N'Email'
GO
EXEC sp_addextendedproperty N'MS_Description', N'"ملاحظات"', 'SCHEMA', N'dbo', 'TABLE', N'ProjectPlans', 'COLUMN', N'Remarks'
GO
ALTER TABLE [dbo].[ProjectPlans] SET (LOCK_ESCALATION = TABLE)
GO

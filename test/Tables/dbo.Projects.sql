SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Projects] (
		[ProjID]                [int] IDENTITY(1, 1) NOT NULL,
		[ProjectNum]            [varchar](10) COLLATE Arabic_CI_AS NOT NULL,
		[CreationDate]          [date] NULL,
		[ProjectTitle]          [varchar](50) COLLATE Arabic_CI_AS NULL,
		[fkDepID]               [int] NOT NULL,
		[fkUnitID]              [int] NOT NULL,
		[Originator]            [varchar](50) COLLATE Arabic_CI_AS NOT NULL,
		[ForecastedBudget]      [float] NULL,
		[Status]                [varchar](50) COLLATE Arabic_CI_AS NULL,
		[Analyzer Engineer]     [varchar](50) COLLATE Arabic_CI_AS NULL,
		[QA/QC Engineer]        [varchar](50) COLLATE Arabic_CI_AS NULL,
		[Attachment]            [image] NULL,
		[GUID]                  [uniqueidentifier] NULL ROWGUIDCOL,
		[fkUSER_NAME]           [varchar](100) COLLATE Arabic_CI_AS NOT NULL,
		CONSTRAINT [PK_Projects]
		PRIMARY KEY
		CLUSTERED
		([ProjID])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[Projects]
	ADD
	CONSTRAINT [DF_Projects_ProjectNum]
	DEFAULT ((20)-(1)) FOR [ProjectNum]
GO
ALTER TABLE [dbo].[Projects]
	WITH CHECK
	ADD CONSTRAINT [FK_Projects_Departments]
	FOREIGN KEY ([fkDepID]) REFERENCES [dbo].[Departments] ([DepID])
ALTER TABLE [dbo].[Projects]
	CHECK CONSTRAINT [FK_Projects_Departments]

GO
ALTER TABLE [dbo].[Projects]
	WITH CHECK
	ADD CONSTRAINT [FK_Projects_Units]
	FOREIGN KEY ([fkUnitID]) REFERENCES [dbo].[Units] ([UnitID])
ALTER TABLE [dbo].[Projects]
	CHECK CONSTRAINT [FK_Projects_Units]

GO
ALTER TABLE [dbo].[Projects]
	WITH CHECK
	ADD CONSTRAINT [FK_Projects_frwUsers]
	FOREIGN KEY ([fkUSER_NAME]) REFERENCES [dbo].[frwUsers] ([USER_NAME])
ALTER TABLE [dbo].[Projects]
	CHECK CONSTRAINT [FK_Projects_frwUsers]

GO
EXEC sp_addextendedproperty N'MS_Description', N'"رقم المشروع"', 'SCHEMA', N'dbo', 'TABLE', N'Projects', 'COLUMN', N'ProjectNum'
GO
EXEC sp_addextendedproperty N'MS_Description', N'"تاريخ الإنشاء"', 'SCHEMA', N'dbo', 'TABLE', N'Projects', 'COLUMN', N'CreationDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'"عنوان المشروع"', 'SCHEMA', N'dbo', 'TABLE', N'Projects', 'COLUMN', N'ProjectTitle'
GO
EXEC sp_addextendedproperty N'MS_Description', N'"القسم"', 'SCHEMA', N'dbo', 'TABLE', N'Projects', 'COLUMN', N'fkDepID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'"الوحدة"', 'SCHEMA', N'dbo', 'TABLE', N'Projects', 'COLUMN', N'fkUnitID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'"منشئ المشروع"', 'SCHEMA', N'dbo', 'TABLE', N'Projects', 'COLUMN', N'Originator'
GO
EXEC sp_addextendedproperty N'MS_Description', N'"الميزانية المتوقعة"', 'SCHEMA', N'dbo', 'TABLE', N'Projects', 'COLUMN', N'ForecastedBudget'
GO
EXEC sp_addextendedproperty N'MS_Description', N'"حالة طلب الموافقة"', 'SCHEMA', N'dbo', 'TABLE', N'Projects', 'COLUMN', N'Status'
GO
EXEC sp_addextendedproperty N'MS_Description', N'"المراجعون الفنيون"', 'SCHEMA', N'dbo', 'TABLE', N'Projects', 'COLUMN', N'QA/QC Engineer'
GO
EXEC sp_addextendedproperty N'MS_Description', N'"المرفق"', 'SCHEMA', N'dbo', 'TABLE', N'Projects', 'COLUMN', N'Attachment'
GO
ALTER TABLE [dbo].[Projects] SET (LOCK_ESCALATION = TABLE)
GO

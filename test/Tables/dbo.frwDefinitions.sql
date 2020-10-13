SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[frwDefinitions] (
		[Field]                       [varchar](100) COLLATE Arabic_CI_AS NOT NULL,
		[Control]                     [varchar](100) COLLATE Arabic_CI_AS NOT NULL,
		[LinkTable]                   [varchar](100) COLLATE Arabic_CI_AS NULL,
		[LinkField]                   [varchar](100) COLLATE Arabic_CI_AS NULL,
		[DisplayField]                [varchar](100) COLLATE Arabic_CI_AS NULL,
		[TabName]                     [varchar](100) COLLATE Arabic_CI_AS NULL,
		[TabIndex]                    [float] NULL,
		[Enabled]                     [bit] NULL,
		[Invisible]                   [bit] NULL,
		[GUID]                        [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[RighToLeftLanguage]          [varchar](100) COLLATE Arabic_CI_AS NULL,
		[ToolTip]                     [varchar](255) COLLATE Arabic_CI_AS NULL,
		[Others]                      [varchar](50) COLLATE Arabic_CI_AS NULL,
		[Formula]                     [varchar](max) COLLATE Arabic_CI_AS NULL,
		[EventID]                     [int] NULL,
		[Reminder_Formula]            [varchar](max) COLLATE Arabic_CI_AS NULL,
		[Reminder_Report]             [uniqueidentifier] NULL,
		[Reminder_Msg]                [varchar](50) COLLATE Arabic_CI_AS NULL,
		[Default]                     [varchar](max) COLLATE Arabic_CI_AS NULL,
		[Caption]                     [varchar](100) COLLATE Arabic_CI_AS NULL,
		[RighToLeftToolTip]           [varchar](255) COLLATE Arabic_CI_AS NULL,
		[DrillField]                  [varchar](255) COLLATE Arabic_CI_AS NULL,
		[LineNo]                      [int] NULL,
		[Value_Minimum]               [varchar](255) COLLATE Arabic_CI_AS NULL,
		[Value_Maximum]               [varchar](255) COLLATE Arabic_CI_AS NULL,
		[IntegerOnly]                 [bit] NULL,
		[Date_Minimum]                [datetime] NULL,
		[Date_Maximum]                [datetime] NULL,
		[MonthYearOnly]               [bit] NULL,
		[Statistical]                 [varchar](max) COLLATE Arabic_CI_AS NULL,
		[Summary]                     [bit] NULL,
		[FilterBy]                    [varchar](100) COLLATE Arabic_CI_AS NULL,
		[FilterValue]                 [varchar](100) COLLATE Arabic_CI_AS NULL,
		[DockValue]                   [bit] NULL,
		[RighToLeftDisplayField]      [varchar](100) COLLATE Arabic_CI_AS NULL,
		[Mandatory]                   [bit] NULL,
		[Updatable]                   [bit] NULL,
		[Format]                      [varchar](50) COLLATE Arabic_CI_AS NULL,
		[GridReadFrom]                [varchar](100) COLLATE Arabic_CI_AS NULL,
		[GridParameters]              [varchar](max) COLLATE Arabic_CI_AS NULL,
		[Reminder_ArabicMsg]          [varchar](100) COLLATE Arabic_CI_AS NULL,
		[Learn]                       [bit] NULL,
		[SmartTag]                    [varchar](255) COLLATE Arabic_CI_AS NULL,
		[NotifyRequester]             [bit] NULL,
		[NotifyUsers]                 [bit] NULL,
		[PeriodType]                  [bigint] NULL,
		[Period]                      [float] NULL,
		[LastSentTime]                [datetime] NULL,
		[Object]                      [varchar](255) COLLATE Arabic_CI_AS NOT NULL,
		[EnabledFormula]              [varchar](max) COLLATE Arabic_CI_AS NULL,
		[SystemColor]                 [bit] NULL,
		[UserDefinedColor]            [bit] NULL,
		[UserDefinedColorValue]       [int] NULL,
		[UserDefinedColorFormula]     [varchar](max) COLLATE Arabic_CI_AS NULL,
		[SecurityGroup1]              [bit] NULL,
		[SecurityGroup2]              [bit] NULL,
		[SecurityGroup3]              [bit] NULL,
		[SecurityGroup4]              [bit] NULL,
		[SecurityGroup5]              [bit] NULL,
		[SecurityGroupUnassigned]     [bit] NULL,
		[JavaScripts]                 [varchar](max) COLLATE Arabic_CI_AS NULL,
		[EnableNew]                   [bit] NULL,
		[WebInvisible]                [bit] NULL,
		[SortBy]                      [varchar](255) COLLATE Arabic_CI_AS NULL,
		[NotifyRequesterSMS]          [bit] NULL,
		[NotifyRequesterVoice]        [bit] NULL,
		[WebEnabledFormula]           [varchar](max) COLLATE Arabic_CI_AS NULL,
		CONSTRAINT [PK_frwDefinitions]
		PRIMARY KEY
		CLUSTERED
		([Field])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwDefinitions]
	ADD
	CONSTRAINT [DF_frwDefinition_TabIndex]
	DEFAULT ((0)) FOR [TabIndex]
GO
ALTER TABLE [dbo].[frwDefinitions]
	ADD
	CONSTRAINT [DF_frwDefinition_Enabled]
	DEFAULT ((1)) FOR [Enabled]
GO
ALTER TABLE [dbo].[frwDefinitions]
	ADD
	CONSTRAINT [DF_frwDefinitions_Invisible]
	DEFAULT ((0)) FOR [Invisible]
GO
ALTER TABLE [dbo].[frwDefinitions]
	ADD
	CONSTRAINT [DF__frwDefinit__GUID__4079EA12]
	DEFAULT (newid()) FOR [GUID]
GO
ALTER TABLE [dbo].[frwDefinitions]
	ADD
	CONSTRAINT [DF_frwDefinitions_Summary]
	DEFAULT ((0)) FOR [Summary]
GO
ALTER TABLE [dbo].[frwDefinitions]
	ADD
	CONSTRAINT [DF_frwDefinitions_Mandatory]
	DEFAULT ((0)) FOR [Mandatory]
GO
ALTER TABLE [dbo].[frwDefinitions]
	ADD
	CONSTRAINT [DF_frwDefinitions_Updatable]
	DEFAULT ((1)) FOR [Updatable]
GO
ALTER TABLE [dbo].[frwDefinitions]
	ADD
	CONSTRAINT [DF_frwDefinitions_Learn]
	DEFAULT ((0)) FOR [Learn]
GO
ALTER TABLE [dbo].[frwDefinitions]
	ADD
	CONSTRAINT [DF_frwDefinitions_SystemColor]
	DEFAULT ((1)) FOR [SystemColor]
GO
ALTER TABLE [dbo].[frwDefinitions]
	ADD
	CONSTRAINT [DF_frwDefinitions_UserDefinedColorValue]
	DEFAULT ((-1)) FOR [UserDefinedColorValue]
GO
ALTER TABLE [dbo].[frwDefinitions]
	WITH CHECK
	ADD CONSTRAINT [FK_frwDefinitions_frwControl_Types]
	FOREIGN KEY ([Control]) REFERENCES [dbo].[frwControl_Types] ([Control_Type])
	ON UPDATE CASCADE
ALTER TABLE [dbo].[frwDefinitions]
	CHECK CONSTRAINT [FK_frwDefinitions_frwControl_Types]

GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_frwDefinitions]
	ON [dbo].[frwDefinitions] ([GUID])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_frwDefinitions_1]
	ON [dbo].[frwDefinitions] ([Object])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_frwDefinitions_2]
	ON [dbo].[frwDefinitions] ([TabName])
	ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwDefinitions]
	ON [dbo].[frwDefinitions] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwDefinitions] SET (LOCK_ESCALATION = TABLE)
GO

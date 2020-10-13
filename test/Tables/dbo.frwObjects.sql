SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[frwObjects] (
		[Object_Name]                       [varchar](50) COLLATE Arabic_CI_AS NOT NULL,
		[Show]                              [bit] NOT NULL,
		[Add]                               [bit] NOT NULL,
		[Edit]                              [bit] NOT NULL,
		[Delete]                            [bit] NOT NULL,
		[Print]                             [bit] NOT NULL,
		[Approval]                          [bit] NULL,
		[LAST_UPDATE]                       [datetime] NULL,
		[Object_NameAR]                     [varchar](255) COLLATE Arabic_CI_AS NULL,
		[OBJECTCAT_ID]                      [int] NULL,
		[OBJECTCAT_Sort]                    [float] NULL,
		[OBJECT]                            [varchar](255) COLLATE Arabic_CI_AS NULL,
		[GUID]                              [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[Created Event]                     [varchar](255) COLLATE Arabic_CI_AS NULL,
		[Modified Event]                    [varchar](255) COLLATE Arabic_CI_AS NULL,
		[Deleted Event]                     [varchar](255) COLLATE Arabic_CI_AS NULL,
		[WizardID]                          [int] NULL,
		[TreeView_FieldID]                  [varchar](100) COLLATE Arabic_CI_AS NULL,
		[TreeView_FieldName]                [varchar](100) COLLATE Arabic_CI_AS NULL,
		[TreeView_Formate]                  [varchar](20) COLLATE Arabic_CI_AS NULL,
		[QuickInfo]                         [varchar](255) COLLATE Arabic_CI_AS NULL,
		[Approval_TypeID]                   [int] NULL,
		[SearchView]                        [varchar](255) COLLATE Arabic_CI_AS NULL,
		[Run Audit Trail]                   [bit] NULL,
		[Relations]                         [varchar](255) COLLATE Arabic_CI_AS NULL,
		[AfterApproval]                     [varchar](255) COLLATE Arabic_CI_AS NULL,
		[Description]                       [text] COLLATE Arabic_CI_AS NULL,
		[Spelling Check]                    [smallint] NULL,
		[Parameters]                        [text] COLLATE Arabic_CI_AS NULL,
		[ParameterObjectID]                 [varchar](255) COLLATE Arabic_CI_AS NULL,
		[GridParameters]                    [text] COLLATE Arabic_CI_AS NULL,
		[GridParameterObjectID]             [varchar](255) COLLATE Arabic_CI_AS NULL,
		[DefaultPrint]                      [uniqueidentifier] NULL,
		[PrerequisiteObjectID]              [varchar](50) COLLATE Arabic_CI_AS NULL,
		[PrerequisiteParameters]            [varchar](max) COLLATE Arabic_CI_AS NULL,
		[ClassName]                         [varchar](255) COLLATE Arabic_CI_AS NULL,
		[TreeView_RightToLeftFieldName]     [varchar](100) COLLATE Arabic_CI_AS NULL,
		[QuickInfoRightToLeft]              [varchar](255) COLLATE Arabic_CI_AS NULL,
		[SearchViewRightToLeft]             [varchar](255) COLLATE Arabic_CI_AS NULL,
		[ReportPrerequisite]                [varchar](255) COLLATE Arabic_CI_AS NULL,
		[HugeData]                          [bit] NULL,
		[DrillView]                         [varchar](255) COLLATE Arabic_CI_AS NULL,
		[Requester]                         [varchar](100) COLLATE Arabic_CI_AS NULL,
		[OriginalTable]                     [varchar](100) COLLATE Arabic_CI_AS NULL,
		[AuditSubTable]                     [bit] NULL,
		[BeforeDeleteEvent]                 [varchar](255) COLLATE Arabic_CI_AS NULL,
		[PasteEvent]                        [varchar](255) COLLATE Arabic_CI_AS NULL,
		[Title]                             [varchar](255) COLLATE Arabic_CI_AS NULL,
		[SortBy]                            [varchar](255) COLLATE Arabic_CI_AS NULL,
		[SortAToZ]                          [bit] NULL,
		[DetailEvent]                       [varchar](255) COLLATE Arabic_CI_AS NULL,
		[DetailInfo]                        [varchar](255) COLLATE Arabic_CI_AS NULL,
		[Assembly]                          [varbinary](max) NULL,
		[Justification]                     [bit] NULL,
		[DrillFirstPage]                    [bit] NULL,
		[BeforeModifyEvent]                 [varchar](255) COLLATE Arabic_CI_AS NULL,
		[ApprovalApplied]                   [bit] NULL,
		[RequestApplied]                    [bit] NULL,
		[RejectionApplied]                  [bit] NULL,
		[PrerequisiteCancelEvent]           [varchar](255) COLLATE Arabic_CI_AS NULL,
		[Version]                           [varchar](20) COLLATE Arabic_CI_AS NULL,
		[Ownership]                         [varchar](60) COLLATE Arabic_CI_AS NULL,
		[Notes]                             [varchar](max) COLLATE Arabic_CI_AS NULL,
		[AfteRejection]                     [varchar](255) COLLATE Arabic_CI_AS NULL,
		[IgnoreIdentifier]                  [bit] NULL,
		[At Server Event]                   [varchar](255) COLLATE Arabic_CI_AS NULL,
		[Thread Event]                      [varchar](255) COLLATE Arabic_CI_AS NULL,
		[SendRequestEvent]                  [varchar](255) COLLATE Arabic_CI_AS NULL,
		[DrillView Prerequisite]            [varchar](255) COLLATE Arabic_CI_AS NULL,
		[Apply LegalEntityID]               [bit] NULL,
		[ImportData]                        [varchar](max) COLLATE Arabic_CI_AS NULL,
		[Open Event]                        [varchar](255) COLLATE Arabic_CI_AS NULL,
		[Created Parameter]                 [varchar](255) COLLATE Arabic_CI_AS NULL,
		[Thread Parameter]                  [varchar](255) COLLATE Arabic_CI_AS NULL,
		[BeforeModify Parameter]            [varchar](255) COLLATE Arabic_CI_AS NULL,
		[Modified Parameter]                [varchar](255) COLLATE Arabic_CI_AS NULL,
		[BeforeDelete Parameter]            [varchar](255) COLLATE Arabic_CI_AS NULL,
		[Deleted Parameter]                 [varchar](255) COLLATE Arabic_CI_AS NULL,
		[Open Parameter]                    [varchar](255) COLLATE Arabic_CI_AS NULL,
		[SourceType]                        [varchar](5) COLLATE Arabic_CI_AS NULL,
		[UpdateCommand]                     [varchar](max) COLLATE Arabic_CI_AS NULL,
		[InsertCommand]                     [varchar](max) COLLATE Arabic_CI_AS NULL,
		[Status]                            [varchar](30) COLLATE Arabic_CI_AS NULL,
		[Misspelling]                       [bit] NULL,
		[SampleData]                        [bit] NULL,
		[BBTesting]                         [bit] NULL,
		[WBTesting]                         [bit] NULL,
		[RTLLanguage]                       [bit] NULL,
		[Performance]                       [bit] NULL,
		[Web]                               [bit] NULL,
		[WebMenu]                           [int] NULL,
		[locks]                             [bit] NULL,
		[SecurityGroup1]                    [bit] NULL,
		[SecurityGroup2]                    [bit] NULL,
		[SecurityGroup3]                    [bit] NULL,
		[SecurityGroup4]                    [bit] NULL,
		[SecurityGroup5]                    [bit] NULL,
		[DrilldownEditable]                 [bit] NULL,
		[ClientVersion]                     [varchar](20) COLLATE Arabic_CI_AS NULL,
		[PreviewField]                      [varchar](255) COLLATE Arabic_CI_AS NULL,
		[AfterApprovalWebService]           [varchar](max) COLLATE Arabic_CI_AS NULL,
		[AfteRejectionWebService]           [varchar](max) COLLATE Arabic_CI_AS NULL,
		[OpenEventWebService]               [varchar](max) COLLATE Arabic_CI_AS NULL,
		[SmartPhones]                       [bit] NULL,
		[WebServiceName]                    [varchar](255) COLLATE Arabic_CI_AS NULL,
		[WebServiceAddress]                 [varchar](max) COLLATE Arabic_CI_AS NULL,
		[WebServiceResult]                  [varchar](max) COLLATE Arabic_CI_AS NULL,
		[UseEmail]                          [bit] NULL,
		[UseSMS]                            [bit] NULL,
		[UseVoice]                          [bit] NULL,
		[DefaultGroupBy]                    [varchar](255) COLLATE Arabic_CI_AS NULL,
		[Overwrite]                         [varchar](255) COLLATE Arabic_CI_AS NULL,
		[HugeCalculation]                   [bit] NULL,
		[HistorianMethod]                   [smallint] NULL,
		[HistorianRecursiveLevel]           [smallint] NULL,
		[HistorianTimeField]                [varchar](255) COLLATE Arabic_CI_AS NULL,
		[HistorianCondtion]                 [varchar](max) COLLATE Arabic_CI_AS NULL,
		[AdvancedEditForm]                  [bit] NULL,
		[WebMenuParent]                     [bigint] NULL,
		[SyncEnable]                        [bit] NULL,
		[SyncUseDelete]                     [bit] NULL,
		[SyncPriority]                      [int] NULL,
		[SyncTwoWays]                       [bit] NULL,
		[SyncClientEvent]                   [varchar](255) COLLATE Arabic_CI_AS NULL,
		[SyncServerEvent]                   [varchar](255) COLLATE Arabic_CI_AS NULL,
		[SyncStatus]                        [bit] NULL,
		[Icon]                              [varchar](max) COLLATE Arabic_CI_AS NULL,
		[WebColSpan]                        [smallint] NULL,
		CONSTRAINT [PK_frwOBJECTS]
		PRIMARY KEY
		CLUSTERED
		([Object_Name])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwObjects]
	ADD
	CONSTRAINT [DF_frwObjects_WebColSpan]
	DEFAULT ('3') FOR [WebColSpan]
GO
ALTER TABLE [dbo].[frwObjects]
	ADD
	CONSTRAINT [DF_frwOBJECTS_SHOW]
	DEFAULT ((0)) FOR [Show]
GO
ALTER TABLE [dbo].[frwObjects]
	ADD
	CONSTRAINT [DF_frwOBJECTS_ADD]
	DEFAULT ((0)) FOR [Add]
GO
ALTER TABLE [dbo].[frwObjects]
	ADD
	CONSTRAINT [DF_frwOBJECTS_EDIT]
	DEFAULT ((0)) FOR [Edit]
GO
ALTER TABLE [dbo].[frwObjects]
	ADD
	CONSTRAINT [DF_frwOBJECTS_DELETE]
	DEFAULT ((0)) FOR [Delete]
GO
ALTER TABLE [dbo].[frwObjects]
	ADD
	CONSTRAINT [DF_frwOBJECTS_PRINT]
	DEFAULT ((0)) FOR [Print]
GO
ALTER TABLE [dbo].[frwObjects]
	ADD
	CONSTRAINT [DF_frw_OBJECTS__GUID__1D30ADD5]
	DEFAULT (newid()) FOR [GUID]
GO
ALTER TABLE [dbo].[frwObjects]
	ADD
	CONSTRAINT [DF_frwOBJECTS_Spelling Check]
	DEFAULT ((1)) FOR [Spelling Check]
GO
ALTER TABLE [dbo].[frwObjects]
	ADD
	CONSTRAINT [DF_frwObjects_UseEmail_1]
	DEFAULT ((1)) FOR [UseEmail]
GO
ALTER TABLE [dbo].[frwObjects]
	ADD
	CONSTRAINT [DF_frwObjects_UseSMS_1]
	DEFAULT ((0)) FOR [UseSMS]
GO
ALTER TABLE [dbo].[frwObjects]
	ADD
	CONSTRAINT [DF_frwObjects_HistorianMethod]
	DEFAULT ('1') FOR [HistorianMethod]
GO
ALTER TABLE [dbo].[frwObjects]
	WITH CHECK
	ADD CONSTRAINT [FK_frwOBJECTS_frwApproval_Type]
	FOREIGN KEY ([Approval_TypeID]) REFERENCES [dbo].[frwApproval_Type] ([Approval_TypeID])
ALTER TABLE [dbo].[frwObjects]
	CHECK CONSTRAINT [FK_frwOBJECTS_frwApproval_Type]

GO
ALTER TABLE [dbo].[frwObjects]
	WITH CHECK
	ADD CONSTRAINT [FK_frwOBJECTS_frwObjectCat]
	FOREIGN KEY ([OBJECTCAT_ID]) REFERENCES [dbo].[frwObjectCat] ([OBJECTCAT_ID])
	ON UPDATE CASCADE
ALTER TABLE [dbo].[frwObjects]
	CHECK CONSTRAINT [FK_frwOBJECTS_frwObjectCat]

GO
ALTER TABLE [dbo].[frwObjects]
	WITH CHECK
	ADD CONSTRAINT [FK_frwOBJECTS_frwWizard]
	FOREIGN KEY ([WizardID]) REFERENCES [dbo].[frwWizard] ([ID])
ALTER TABLE [dbo].[frwObjects]
	CHECK CONSTRAINT [FK_frwOBJECTS_frwWizard]

GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwObjects]
	ON [dbo].[frwObjects] ([GUID])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_frwObjects]
	ON [dbo].[frwObjects] ([OBJECT])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwObjects] SET (LOCK_ESCALATION = TABLE)
GO

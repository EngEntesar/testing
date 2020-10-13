SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[frwSetting] (
		[GUID]                       [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[Color_Mandatory]            [int] NULL,
		[Color_NotMandatory]         [int] NULL,
		[Color_New]                  [int] NULL,
		[Color_Open]                 [int] NULL,
		[Color_Show]                 [int] NULL,
		[Color_Expression]           [int] NULL,
		[FontColor]                  [int] NULL,
		[CaptionColor]               [int] NULL,
		[SchemaUser]                 [varchar](100) COLLATE Arabic_CI_AS NULL,
		[FieldFont]                  [varchar](255) COLLATE Arabic_CI_AS NULL,
		[CaptionFont]                [varchar](255) COLLATE Arabic_CI_AS NULL,
		[DoubleClick]                [int] NULL,
		[MsgAnswer]                  [int] NULL,
		[F1]                         [varchar](255) COLLATE Arabic_CI_AS NULL,
		[F2]                         [varchar](255) COLLATE Arabic_CI_AS NULL,
		[F3]                         [varchar](255) COLLATE Arabic_CI_AS NULL,
		[F4]                         [varchar](255) COLLATE Arabic_CI_AS NULL,
		[F5]                         [varchar](255) COLLATE Arabic_CI_AS NULL,
		[F6]                         [varchar](255) COLLATE Arabic_CI_AS NULL,
		[F7]                         [varchar](255) COLLATE Arabic_CI_AS NULL,
		[F8]                         [varchar](255) COLLATE Arabic_CI_AS NULL,
		[F9]                         [varchar](255) COLLATE Arabic_CI_AS NULL,
		[F10]                        [varchar](255) COLLATE Arabic_CI_AS NULL,
		[F11]                        [varchar](255) COLLATE Arabic_CI_AS NULL,
		[F12]                        [varchar](255) COLLATE Arabic_CI_AS NULL,
		[Character]                  [varchar](50) COLLATE Arabic_CI_AS NULL,
		[Show Tree]                  [bit] NULL,
		[Language]                   [varchar](50) COLLATE Arabic_CI_AS NULL,
		[MenuFont]                   [varchar](255) COLLATE Arabic_CI_AS NULL,
		[TextCapture]                [varchar](255) COLLATE Arabic_CI_AS NULL,
		[TextCaptureField]           [varchar](255) COLLATE Arabic_CI_AS NULL,
		[AutoLock]                   [bit] NULL,
		[AutoLockWait]               [float] NULL,
		[Caching]                    [bit] NULL,
		[RecentDocuments]            [smallint] NULL,
		[TextCaptureLicenseUser]     [varchar](100) COLLATE Arabic_CI_AS NULL,
		[TextCaptureLicenseKey]      [varchar](100) COLLATE Arabic_CI_AS NULL,
		[CachingServer]              [varchar](255) COLLATE Arabic_CI_AS NULL,
		[CachingDatabase]            [varchar](255) COLLATE Arabic_CI_AS NULL,
		[AskApproval]                [smallint] NULL,
		[AskPrint]                   [smallint] NULL,
		[RoleProfile]                [varchar](255) COLLATE Arabic_CI_AS NULL,
		[TabManager]                 [bit] NULL,
		[EditMode]                   [bit] NULL,
		[ShowApply]                  [bit] NULL,
		[Background]                 [varbinary](max) NULL,
		[StartUp]                    [varchar](255) COLLATE Arabic_CI_AS NULL,
		[WebColumns]                 [int] NULL,
		[ShowDialog]                 [bit] NULL,
		[GridEnterDirection]         [smallint] NULL,
		CONSTRAINT [PK_frwSetting]
		PRIMARY KEY
		CLUSTERED
		([GUID])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwSetting]
	ADD
	CONSTRAINT [DF_frwSetting_GUID]
	DEFAULT (newid()) FOR [GUID]
GO
ALTER TABLE [dbo].[frwSetting]
	ADD
	CONSTRAINT [DF_frwSetting_Color_Mandatory]
	DEFAULT ((-1967135)) FOR [Color_Mandatory]
GO
ALTER TABLE [dbo].[frwSetting]
	ADD
	CONSTRAINT [DF_frwSetting_Color_NotMandatory]
	DEFAULT ((-26)) FOR [Color_NotMandatory]
GO
ALTER TABLE [dbo].[frwSetting]
	ADD
	CONSTRAINT [DF_frwSetting_Color_New]
	DEFAULT ((-16744256)) FOR [Color_New]
GO
ALTER TABLE [dbo].[frwSetting]
	ADD
	CONSTRAINT [DF_frwSetting_Color_Open]
	DEFAULT ((-592138)) FOR [Color_Open]
GO
ALTER TABLE [dbo].[frwSetting]
	ADD
	CONSTRAINT [DF_frwSetting_Color_Show]
	DEFAULT ((-4144960)) FOR [Color_Show]
GO
ALTER TABLE [dbo].[frwSetting]
	ADD
	CONSTRAINT [DF_frwSetting_Color_Expression]
	DEFAULT ((-2097153)) FOR [Color_Expression]
GO
ALTER TABLE [dbo].[frwSetting]
	ADD
	CONSTRAINT [DF_frwSetting_FieldFont]
	DEFAULT ('Font: Name=Tahoma, Size=9, Units=3, GdiCharSet=178, GdiVerticalFont=False , Style=0') FOR [FieldFont]
GO
ALTER TABLE [dbo].[frwSetting]
	ADD
	CONSTRAINT [DF_frwSetting_CaptionFont]
	DEFAULT ('Font: Name=Tahoma, Size=9, Units=3, GdiCharSet=178, GdiVerticalFont=False , Style=0') FOR [CaptionFont]
GO
ALTER TABLE [dbo].[frwSetting]
	ADD
	CONSTRAINT [DF_frwSetting_Character]
	DEFAULT ('genie') FOR [Character]
GO
ALTER TABLE [dbo].[frwSetting]
	ADD
	CONSTRAINT [DF_frwSetting_Show Tree]
	DEFAULT ((1)) FOR [Show Tree]
GO
ALTER TABLE [dbo].[frwSetting]
	ADD
	CONSTRAINT [DF_frwSetting_MenuFont]
	DEFAULT ('[Font: Name=Segoe UI, Size=9, Units=3, GdiCharSet=178, GdiVerticalFont=False , Style=0]') FOR [MenuFont]
GO
ALTER TABLE [dbo].[frwSetting]
	ADD
	CONSTRAINT [DF_frwSetting_AutoLock]
	DEFAULT ((1)) FOR [AutoLock]
GO
ALTER TABLE [dbo].[frwSetting]
	ADD
	CONSTRAINT [DF_frwSetting_AutoLockWait]
	DEFAULT ((5)) FOR [AutoLockWait]
GO
ALTER TABLE [dbo].[frwSetting]
	ADD
	CONSTRAINT [DF_frwSetting_Caching]
	DEFAULT ((0)) FOR [Caching]
GO
ALTER TABLE [dbo].[frwSetting]
	ADD
	CONSTRAINT [DF_frwSetting_RecentDocuments]
	DEFAULT ((17)) FOR [RecentDocuments]
GO
ALTER TABLE [dbo].[frwSetting]
	ADD
	CONSTRAINT [DF_frwSetting_AskApproval]
	DEFAULT ((0)) FOR [AskApproval]
GO
ALTER TABLE [dbo].[frwSetting]
	ADD
	CONSTRAINT [DF_frwSetting_AskPrint]
	DEFAULT ((0)) FOR [AskPrint]
GO
ALTER TABLE [dbo].[frwSetting]
	ADD
	CONSTRAINT [DF_frwSetting_TabManager]
	DEFAULT ((1)) FOR [TabManager]
GO
ALTER TABLE [dbo].[frwSetting]
	ADD
	CONSTRAINT [DF_frwSetting_EditMode]
	DEFAULT ((1)) FOR [EditMode]
GO
ALTER TABLE [dbo].[frwSetting]
	ADD
	CONSTRAINT [DF_frwSetting_ShowApply]
	DEFAULT ((1)) FOR [ShowApply]
GO
ALTER TABLE [dbo].[frwSetting]
	ADD
	CONSTRAINT [DF_frwSetting_ShowDialog]
	DEFAULT ('0') FOR [ShowDialog]
GO
ALTER TABLE [dbo].[frwSetting]
	ADD
	CONSTRAINT [DF_frwSetting_WebColumns]
	DEFAULT ((0)) FOR [WebColumns]
GO
ALTER TABLE [dbo].[frwSetting]
	ADD
	CONSTRAINT [DF_frwSetting_GridEnterDirection]
	DEFAULT ((0)) FOR [GridEnterDirection]
GO
ALTER TABLE [dbo].[frwSetting]
	WITH CHECK
	ADD CONSTRAINT [FK_frwSetting_frwUSERS]
	FOREIGN KEY ([SchemaUser]) REFERENCES [dbo].[frwUsers] ([USER_NAME])
	ON DELETE CASCADE
	ON UPDATE CASCADE
ALTER TABLE [dbo].[frwSetting]
	CHECK CONSTRAINT [FK_frwSetting_frwUSERS]

GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwSetting]
	ON [dbo].[frwSetting] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwSetting] SET (LOCK_ESCALATION = TABLE)
GO

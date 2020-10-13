SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[frwConfig] (
		[GUID]                         [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[OutgoingMail]                 [text] COLLATE Arabic_CI_AS NULL,
		[OutgoingPort]                 [int] NULL,
		[SMTPAuthentication]           [bit] NULL,
		[SMTPUser]                     [text] COLLATE Arabic_CI_AS NULL,
		[SMTPPassword]                 [text] COLLATE Arabic_CI_AS NULL,
		[Sender]                       [text] COLLATE Arabic_CI_AS NULL,
		[SendReceiveEvery]             [float] NULL,
		[IncomingPort]                 [int] NULL,
		[ApplicationName]              [varchar](150) COLLATE Arabic_CI_AS NULL,
		[CompanyName]                  [varchar](150) COLLATE Arabic_CI_AS NULL,
		[Address]                      [varchar](200) COLLATE Arabic_CI_AS NULL,
		[Dictionary]                   [varchar](255) COLLATE Arabic_CI_AS NULL,
		[Library Path]                 [varchar](255) COLLATE Arabic_CI_AS NULL,
		[License]                      [varchar](max) COLLATE Arabic_CI_AS NULL,
		[WorkFlowType]                 [bit] NULL,
		[AutoCreateFields]             [bit] NULL,
		[ReadField]                    [bit] NULL,
		[IncomingMail]                 [text] COLLATE Arabic_CI_AS NULL,
		[POP3User]                     [text] COLLATE Arabic_CI_AS NULL,
		[POP3Password]                 [text] COLLATE Arabic_CI_AS NULL,
		[Logo]                         [varbinary](max) NULL,
		[POP3SSL]                      [bit] NULL,
		[SMTPSSL]                      [bit] NULL,
		[EmbeddedAttachments]          [bit] NULL,
		[EmbeddedAttachmentsSize]      [float] NULL,
		[Signatures]                   [varchar](max) COLLATE Arabic_CI_AS NULL,
		[LoginMust]                    [bit] NULL,
		[LoginLink]                    [varchar](max) COLLATE Arabic_CI_AS NULL,
		[CommandTimeout]               [int] NULL,
		[SelectTimeout]                [int] NULL,
		[CalendarForm]                 [varchar](255) COLLATE Arabic_CI_AS NULL,
		[DenyLowerVersion]             [bit] NULL,
		[Language]                     [varchar](50) COLLATE Arabic_CI_AS NULL,
		[DecisionSupportDashboard]     [varchar](255) COLLATE Arabic_CI_AS NULL,
		[SystemUnderMaintenance]       [bit] NULL,
		[MaintenanceMSG_AR]            [varchar](500) COLLATE Arabic_CI_AS NULL,
		[MaintenanceMSG_EN]            [varchar](500) COLLATE Arabic_CI_AS NULL,
		[Calendar]                     [int] NULL,
		[In-MemoryOptimization]        [bit] NULL,
		[In-MemoryUpdate]              [bit] NULL,
		[SMSGatewayAddress]            [varchar](max) COLLATE Arabic_CI_AS NULL,
		[SMSGatewayUserName]           [varchar](255) COLLATE Arabic_CI_AS NULL,
		[SMSGatewayPassword]           [varchar](255) COLLATE Arabic_CI_AS NULL,
		[SMSGatewaySender]             [varchar](11) COLLATE Arabic_CI_AS NULL,
		[SMSBalance]                   [varchar](255) COLLATE Arabic_CI_AS NULL,
		[SMSTestTo]                    [varchar](255) COLLATE Arabic_CI_AS NULL,
		[SMSTestMsg]                   [varchar](150) COLLATE Arabic_CI_AS NULL,
		[SMSResultTest]                [varchar](255) COLLATE Arabic_CI_AS NULL,
		[VoiceGatewayAddress]          [varchar](max) COLLATE Arabic_CI_AS NULL,
		[VoiceGatewayUserName]         [varchar](255) COLLATE Arabic_CI_AS NULL,
		[VoiceGatewayPassword]         [varchar](255) COLLATE Arabic_CI_AS NULL,
		[VoiceGatewaySender]           [varchar](20) COLLATE Arabic_CI_AS NULL,
		[VoiceBalance]                 [varchar](255) COLLATE Arabic_CI_AS NULL,
		[VoiceTestTo]                  [varchar](255) COLLATE Arabic_CI_AS NULL,
		[VoiceTestMsg]                 [varchar](150) COLLATE Arabic_CI_AS NULL,
		[VoiceResultTest]              [varchar](255) COLLATE Arabic_CI_AS NULL,
		[VoiceSID]                     [varchar](255) COLLATE Arabic_CI_AS NULL,
		[SMSSID]                       [varchar](255) COLLATE Arabic_CI_AS NULL,
		[SnapReports]                  [varchar](max) COLLATE Arabic_CI_AS NULL,
		[Spreadsheets]                 [varchar](max) COLLATE Arabic_CI_AS NULL,
		[Dashboards]                   [varchar](max) COLLATE Arabic_CI_AS NULL,
		[ReplacePath]                  [varchar](max) COLLATE Arabic_CI_AS NULL,
		[CRReports]                    [varchar](max) COLLATE Arabic_CI_AS NULL,
		[Backup]                       [varchar](max) COLLATE Arabic_CI_AS NULL,
		[GridPerformance]              [bigint] NULL,
		[SMS_PostUser]                 [varchar](50) COLLATE Arabic_CI_AS NULL,
		[SMS_PostPassword]             [varchar](50) COLLATE Arabic_CI_AS NULL,
		[SMS_PostSender]               [varchar](50) COLLATE Arabic_CI_AS NULL,
		[SMS_PostNumbers]              [varchar](50) COLLATE Arabic_CI_AS NULL,
		[SMS_PostMessage]              [varchar](50) COLLATE Arabic_CI_AS NULL,
		[SMS_PostExtra]                [varchar](50) COLLATE Arabic_CI_AS NULL,
		[SMS_PostEncryption]           [bit] NULL,
		[SyncServer]                   [varchar](255) COLLATE Arabic_CI_AS NULL,
		[SyncDatabase]                 [varchar](255) COLLATE Arabic_CI_AS NULL,
		[SyncUserName]                 [varchar](255) COLLATE Arabic_CI_AS NULL,
		[SyncPassword]                 [varchar](255) COLLATE Arabic_CI_AS NULL,
		[SyncEnable]                   [bit] NULL,
		[SyncID]                       [varchar](4) COLLATE Arabic_CI_AS NULL,
		[SyncTime]                     [int] NULL,
		[SyncMaxRecords]               [int] NULL,
		[AttachmentsStore]             [varchar](255) COLLATE Arabic_CI_AS NULL,
		[SMSGateBalanceAddress]        [varchar](200) COLLATE Arabic_CI_AS NULL,
		[SMS_ContentType]              [varchar](255) COLLATE Arabic_CI_AS NULL,
		CONSTRAINT [frwConfig_ID]
		PRIMARY KEY
		CLUSTERED
		([GUID])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwConfig]
	ADD
	CONSTRAINT [frwConfig_GUID]
	DEFAULT (newid()) FOR [GUID]
GO
ALTER TABLE [dbo].[frwConfig]
	ADD
	CONSTRAINT [DF_frwConfig_OutgoingPort]
	DEFAULT ((25)) FOR [OutgoingPort]
GO
ALTER TABLE [dbo].[frwConfig]
	ADD
	CONSTRAINT [DF_frwConfig_SendReceiveEvery]
	DEFAULT ((7)) FOR [SendReceiveEvery]
GO
ALTER TABLE [dbo].[frwConfig]
	ADD
	CONSTRAINT [DF_frwConfig_IncomingPort]
	DEFAULT ((110)) FOR [IncomingPort]
GO
ALTER TABLE [dbo].[frwConfig]
	ADD
	CONSTRAINT [DF_frwConfig_AutoCreateFields_1]
	DEFAULT ((1)) FOR [AutoCreateFields]
GO
ALTER TABLE [dbo].[frwConfig]
	ADD
	CONSTRAINT [DF_frwConfig_ReadField]
	DEFAULT ((1)) FOR [ReadField]
GO
ALTER TABLE [dbo].[frwConfig]
	ADD
	CONSTRAINT [DF_frwConfig_DenyLowerVersion]
	DEFAULT ((1)) FOR [DenyLowerVersion]
GO
ALTER TABLE [dbo].[frwConfig]
	ADD
	CONSTRAINT [DF_frwConfig_Calendar]
	DEFAULT ((2)) FOR [Calendar]
GO
ALTER TABLE [dbo].[frwConfig]
	ADD
	CONSTRAINT [DF_frwConfig_GridPerformance]
	DEFAULT ('10000') FOR [GridPerformance]
GO
ALTER TABLE [dbo].[frwConfig]
	ADD
	CONSTRAINT [DF_frwConfig_SMS_PostUser]
	DEFAULT ('user') FOR [SMS_PostUser]
GO
ALTER TABLE [dbo].[frwConfig]
	ADD
	CONSTRAINT [DF_frwConfig_SMS_PostPassword]
	DEFAULT ('password') FOR [SMS_PostPassword]
GO
ALTER TABLE [dbo].[frwConfig]
	ADD
	CONSTRAINT [DF_frwConfig_SMS_PostSender]
	DEFAULT ('sender') FOR [SMS_PostSender]
GO
ALTER TABLE [dbo].[frwConfig]
	ADD
	CONSTRAINT [DF_frwConfig_SMS_PostNumbers]
	DEFAULT ('numbers') FOR [SMS_PostNumbers]
GO
ALTER TABLE [dbo].[frwConfig]
	ADD
	CONSTRAINT [DF_frwConfig_SMS_PostMessage]
	DEFAULT ('message') FOR [SMS_PostMessage]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwConfig]
	ON [dbo].[frwConfig] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwConfig] SET (LOCK_ESCALATION = TABLE)
GO

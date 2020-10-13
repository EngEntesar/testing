SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[frwSMS] (
		[GUID]            [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[SMSFrom]         [text] COLLATE Arabic_CI_AS NULL,
		[SMSTo]           [text] COLLATE Arabic_CI_AS NULL,
		[SMSSubject]      [text] COLLATE Arabic_CI_AS NULL,
		[SMSBody]         [text] COLLATE Arabic_CI_AS NULL,
		[SMSStatus]       [int] NULL,
		[SMSSentTime]     [datetime] NULL,
		[SMSErrorMsg]     [varchar](max) COLLATE Arabic_CI_AS NULL,
		[SMSTitle]        [text] COLLATE Arabic_CI_AS NULL,
		CONSTRAINT [PK_frwSMS]
		PRIMARY KEY
		CLUSTERED
		([GUID])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwSMS]
	ADD
	CONSTRAINT [DF_frwSMS_GUID]
	DEFAULT (newid()) FOR [GUID]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwSMS]
	ON [dbo].[frwSMS] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwSMS] SET (LOCK_ESCALATION = TABLE)
GO

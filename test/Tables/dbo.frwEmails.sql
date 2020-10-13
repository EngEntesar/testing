SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[frwEmails] (
		[GUID]              [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[emailFrom]         [text] COLLATE Arabic_CI_AS NULL,
		[emailTo]           [text] COLLATE Arabic_CI_AS NULL,
		[emailSubject]      [text] COLLATE Arabic_CI_AS NULL,
		[emailBody]         [text] COLLATE Arabic_CI_AS NULL,
		[emailStatus]       [int] NULL,
		[emailSentTime]     [datetime] NULL,
		[emailReportID]     [text] COLLATE Arabic_CI_AS NULL,
		[emailErrorMsg]     [varchar](max) COLLATE Arabic_CI_AS NULL,
		[emailTitle]        [text] COLLATE Arabic_CI_AS NULL,
		CONSTRAINT [PK_frwEmails]
		PRIMARY KEY
		CLUSTERED
		([GUID])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwEmails]
	ADD
	CONSTRAINT [DF_frwEmails_GUID]
	DEFAULT (newid()) FOR [GUID]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwEmails]
	ON [dbo].[frwEmails] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwEmails] SET (LOCK_ESCALATION = TABLE)
GO

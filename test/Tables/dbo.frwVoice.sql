SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[frwVoice] (
		[GUID]              [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[VoiceFrom]         [text] COLLATE Arabic_CI_AS NULL,
		[VoiceTo]           [text] COLLATE Arabic_CI_AS NULL,
		[VoiceSubject]      [text] COLLATE Arabic_CI_AS NULL,
		[VoiceBody]         [text] COLLATE Arabic_CI_AS NULL,
		[VoiceStatus]       [int] NULL,
		[VoiceSentTime]     [datetime] NULL,
		[VoiceErrorMsg]     [varchar](max) COLLATE Arabic_CI_AS NULL,
		[VoiceTitle]        [text] COLLATE Arabic_CI_AS NULL,
		CONSTRAINT [PK_frwVoice]
		PRIMARY KEY
		CLUSTERED
		([GUID])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwVoice]
	ADD
	CONSTRAINT [DF_frwVoice_GUID]
	DEFAULT (newid()) FOR [GUID]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwVoice]
	ON [dbo].[frwVoice] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwVoice] SET (LOCK_ESCALATION = TABLE)
GO

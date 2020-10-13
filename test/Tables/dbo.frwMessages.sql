SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[frwMessages] (
		[MsgID]             [varchar](20) COLLATE Arabic_CI_AS NOT NULL,
		[DescriptionEn]     [varchar](max) COLLATE Arabic_CI_AS NULL,
		[DescriptionAr]     [varchar](max) COLLATE Arabic_CI_AS NULL,
		[GUID]              [uniqueidentifier] NULL ROWGUIDCOL,
		CONSTRAINT [PK_frwMessages]
		PRIMARY KEY
		CLUSTERED
		([MsgID])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwMessages]
	ADD
	CONSTRAINT [DF_frwMessages_GUID]
	DEFAULT (newid()) FOR [GUID]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwMessages]
	ON [dbo].[frwMessages] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwMessages] SET (LOCK_ESCALATION = TABLE)
GO

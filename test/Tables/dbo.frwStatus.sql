SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[frwStatus] (
		[GUID]            [uniqueidentifier] NULL ROWGUIDCOL,
		[Status]          [varchar](30) COLLATE Arabic_CI_AS NOT NULL,
		[Description]     [varchar](200) COLLATE Arabic_CI_AS NOT NULL,
		CONSTRAINT [frwStatus_Status]
		PRIMARY KEY
		CLUSTERED
		([Status])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwStatus]
	ADD
	CONSTRAINT [frwStatus_GUID]
	DEFAULT (newid()) FOR [GUID]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwStatus]
	ON [dbo].[frwStatus] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwStatus] SET (LOCK_ESCALATION = TABLE)
GO

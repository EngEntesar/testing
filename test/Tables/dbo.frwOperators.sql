SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[frwOperators] (
		[operator]     [varchar](50) COLLATE Arabic_CI_AS NOT NULL,
		[GUID]         [uniqueidentifier] NOT NULL ROWGUIDCOL,
		CONSTRAINT [PK_frwOperators]
		PRIMARY KEY
		CLUSTERED
		([operator])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwOperators]
	ADD
	CONSTRAINT [DF__frwOperato__GUID__7D5A71CE]
	DEFAULT (newid()) FOR [GUID]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwOperators]
	ON [dbo].[frwOperators] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwOperators] SET (LOCK_ESCALATION = TABLE)
GO

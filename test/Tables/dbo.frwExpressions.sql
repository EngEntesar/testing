SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[frwExpressions] (
		[GUID]           [uniqueidentifier] NULL ROWGUIDCOL,
		[ID]             [varchar](50) COLLATE Arabic_CI_AS NOT NULL,
		[Expression]     [varchar](255) COLLATE Arabic_CI_AS NOT NULL,
		CONSTRAINT [frwExpressions_ID]
		PRIMARY KEY
		CLUSTERED
		([ID])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwExpressions]
	ADD
	CONSTRAINT [frwExpressions_GUID]
	DEFAULT (newid()) FOR [GUID]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwExpressions]
	ON [dbo].[frwExpressions] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwExpressions] SET (LOCK_ESCALATION = TABLE)
GO

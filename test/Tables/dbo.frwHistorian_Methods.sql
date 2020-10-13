SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[frwHistorian_Methods] (
		[GUID]       [uniqueidentifier] NULL ROWGUIDCOL,
		[ID]         [smallint] NOT NULL,
		[Method]     [varchar](200) COLLATE Arabic_CI_AS NOT NULL,
		CONSTRAINT [frwHistorianMethods_ID]
		PRIMARY KEY
		CLUSTERED
		([ID])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwHistorian_Methods]
	ADD
	CONSTRAINT [frwHistorianMethods_GUID]
	DEFAULT (newid()) FOR [GUID]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwHistorian_Methods]
	ON [dbo].[frwHistorian_Methods] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwHistorian_Methods] SET (LOCK_ESCALATION = TABLE)
GO

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[frwDomains] (
		[Domain]     [varchar](50) COLLATE Arabic_CI_AS NOT NULL,
		[GUID]       [uniqueidentifier] NOT NULL ROWGUIDCOL,
		CONSTRAINT [PK_frwDomains]
		PRIMARY KEY
		CLUSTERED
		([Domain])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwDomains]
	ADD
	CONSTRAINT [DF_frwDomains_GUID]
	DEFAULT (newid()) FOR [GUID]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwDomains]
	ON [dbo].[frwDomains] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwDomains] SET (LOCK_ESCALATION = TABLE)
GO

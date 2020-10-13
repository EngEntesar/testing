SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[frwPeriouds] (
		[ID]       [int] NOT NULL,
		[Type]     [varchar](10) COLLATE Arabic_CI_AS NOT NULL,
		[GUID]     [uniqueidentifier] NOT NULL ROWGUIDCOL,
		CONSTRAINT [PK_frwPeriouds]
		PRIMARY KEY
		CLUSTERED
		([ID])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwPeriouds]
	ADD
	CONSTRAINT [DF__frwPerioud__GUID__2739D489]
	DEFAULT (newid()) FOR [GUID]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwPeriouds]
	ON [dbo].[frwPeriouds] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwPeriouds] SET (LOCK_ESCALATION = TABLE)
GO

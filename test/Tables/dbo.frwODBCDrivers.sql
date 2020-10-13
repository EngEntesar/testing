SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[frwODBCDrivers] (
		[Driver]     [varchar](255) COLLATE Arabic_CI_AS NOT NULL,
		[GUID]       [uniqueidentifier] NOT NULL ROWGUIDCOL,
		CONSTRAINT [PK_frwODBCDrivers]
		PRIMARY KEY
		CLUSTERED
		([Driver])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwODBCDrivers]
	ADD
	CONSTRAINT [DF__frwODBCDri__GUID__39836D4D]
	DEFAULT (newid()) FOR [GUID]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwODBCDrivers]
	ON [dbo].[frwODBCDrivers] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwODBCDrivers] SET (LOCK_ESCALATION = TABLE)
GO
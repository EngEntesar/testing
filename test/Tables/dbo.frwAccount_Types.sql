SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[frwAccount_Types] (
		[ID]       [int] NOT NULL,
		[Type]     [varchar](60) COLLATE Arabic_CI_AS NOT NULL,
		[GUID]     [uniqueidentifier] NOT NULL ROWGUIDCOL,
		CONSTRAINT [PK_frwAccountTypes]
		PRIMARY KEY
		CLUSTERED
		([ID])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwAccount_Types]
	ADD
	CONSTRAINT [DF_frwAccountTypes_GUID]
	DEFAULT (newid()) FOR [GUID]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwAccount_Types]
	ON [dbo].[frwAccount_Types] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwAccount_Types] SET (LOCK_ESCALATION = TABLE)
GO

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[frwVersion] (
		[Version]                      [varchar](50) COLLATE Arabic_CI_AS NOT NULL,
		[GUID]                         [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[Release Date]                 [date] NULL,
		[Application Version]          [varchar](50) COLLATE Arabic_CI_AS NULL,
		[Application Release Date]     [date] NULL,
		[LastSync]                     [datetime] NULL,
		CONSTRAINT [PK_frwVersion]
		PRIMARY KEY
		CLUSTERED
		([GUID])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwVersion]
	ADD
	CONSTRAINT [DF_frwVersion_GUID]
	DEFAULT (newid()) FOR [GUID]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwVersion]
	ON [dbo].[frwVersion] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwVersion] SET (LOCK_ESCALATION = TABLE)
GO

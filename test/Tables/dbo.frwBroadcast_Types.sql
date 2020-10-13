SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[frwBroadcast_Types] (
		[GUID]               [uniqueidentifier] NULL ROWGUIDCOL,
		[ID]                 [int] NOT NULL,
		[DescriptioneEn]     [varchar](255) COLLATE Arabic_CI_AS NOT NULL,
		[DescriptionAr]      [varchar](255) COLLATE Arabic_CI_AS NULL,
		[Notes]              [varchar](255) COLLATE Arabic_CI_AS NULL,
		CONSTRAINT [frwBroadcast_Types_ID]
		PRIMARY KEY
		CLUSTERED
		([ID])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwBroadcast_Types]
	ADD
	CONSTRAINT [frwBroadcast_Types_GUID]
	DEFAULT (newid()) FOR [GUID]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwBroadcast_Types]
	ON [dbo].[frwBroadcast_Types] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwBroadcast_Types] SET (LOCK_ESCALATION = TABLE)
GO

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[frwCSVMapping] (
		[ID]           [varchar](255) COLLATE Arabic_CI_AS NOT NULL,
		[Object]       [varchar](255) COLLATE Arabic_CI_AS NOT NULL,
		[GUID]         [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[Column01]     [varchar](255) COLLATE Arabic_CI_AS NULL,
		[Column02]     [varchar](255) COLLATE Arabic_CI_AS NULL,
		[Column03]     [varchar](255) COLLATE Arabic_CI_AS NULL,
		[Column04]     [varchar](255) COLLATE Arabic_CI_AS NULL,
		[Column05]     [varchar](255) COLLATE Arabic_CI_AS NULL,
		[Column06]     [varchar](255) COLLATE Arabic_CI_AS NULL,
		[Column07]     [varchar](255) COLLATE Arabic_CI_AS NULL,
		[Column08]     [varchar](255) COLLATE Arabic_CI_AS NULL,
		[Column09]     [varchar](255) COLLATE Arabic_CI_AS NULL,
		CONSTRAINT [PK_frwCSVMapping]
		PRIMARY KEY
		CLUSTERED
		([ID])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwCSVMapping]
	ADD
	CONSTRAINT [DF_frwCSVMapping_GUID]
	DEFAULT (newid()) FOR [GUID]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwCSVMapping]
	ON [dbo].[frwCSVMapping] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwCSVMapping] SET (LOCK_ESCALATION = TABLE)
GO

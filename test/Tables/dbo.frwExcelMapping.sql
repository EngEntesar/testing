SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[frwExcelMapping] (
		[ID]           [varchar](255) COLLATE Arabic_CI_AS NOT NULL,
		[Object]       [varchar](255) COLLATE Arabic_CI_AS NOT NULL,
		[GUID]         [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[Sheet]        [varchar](255) COLLATE Arabic_CI_AS NOT NULL,
		[HDR]          [bit] NULL,
		[Column01]     [varchar](255) COLLATE Arabic_CI_AS NULL,
		[Column02]     [varchar](255) COLLATE Arabic_CI_AS NULL,
		[Column03]     [varchar](255) COLLATE Arabic_CI_AS NULL,
		[Column04]     [varchar](255) COLLATE Arabic_CI_AS NULL,
		[Column05]     [varchar](255) COLLATE Arabic_CI_AS NULL,
		[Column06]     [varchar](255) COLLATE Arabic_CI_AS NULL,
		[Column07]     [varchar](255) COLLATE Arabic_CI_AS NULL,
		[Column08]     [varchar](255) COLLATE Arabic_CI_AS NULL,
		[Column09]     [varchar](255) COLLATE Arabic_CI_AS NULL,
		CONSTRAINT [PK_frwExcelMapping]
		PRIMARY KEY
		CLUSTERED
		([ID])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwExcelMapping]
	ADD
	CONSTRAINT [DF_frwExcelMapping_GUID]
	DEFAULT (newid()) FOR [GUID]
GO
ALTER TABLE [dbo].[frwExcelMapping]
	ADD
	CONSTRAINT [DF_frwExcelMapping_HDR]
	DEFAULT ((1)) FOR [HDR]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwExcelMapping]
	ON [dbo].[frwExcelMapping] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwExcelMapping] SET (LOCK_ESCALATION = TABLE)
GO

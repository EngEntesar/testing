SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[frwWebMenu] (
		[GUID]       [uniqueidentifier] NULL ROWGUIDCOL,
		[ID]         [int] NOT NULL,
		[Menu]       [varchar](200) COLLATE Arabic_CI_AS NOT NULL,
		[Sort]       [float] NULL,
		[Icon]       [varchar](max) COLLATE Arabic_CI_AS NULL,
		[MenuAR]     [varchar](255) COLLATE Arabic_CI_AS NULL,
		CONSTRAINT [PK_frwWebMenu]
		PRIMARY KEY
		CLUSTERED
		([ID])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwWebMenu]
	ADD
	CONSTRAINT [frwWebMenu_GUID]
	DEFAULT (newid()) FOR [GUID]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwWebMenu]
	ON [dbo].[frwWebMenu] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwWebMenu] SET (LOCK_ESCALATION = TABLE)
GO

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[frwArithmetic] (
		[Operator]     [varchar](50) COLLATE Arabic_CI_AS NOT NULL,
		[GUID]         [uniqueidentifier] NOT NULL ROWGUIDCOL,
		CONSTRAINT [PK_frwArithmetic]
		PRIMARY KEY
		CLUSTERED
		([Operator])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwArithmetic]
	ADD
	CONSTRAINT [DF__frwArithme__GUID__7A3D10E0]
	DEFAULT (newid()) FOR [GUID]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwArithmetic]
	ON [dbo].[frwArithmetic] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwArithmetic] SET (LOCK_ESCALATION = TABLE)
GO

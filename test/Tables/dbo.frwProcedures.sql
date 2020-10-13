SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[frwProcedures] (
		[GUID]            [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[Procedure]       [varchar](250) COLLATE Arabic_CI_AS NOT NULL,
		[Description]     [varchar](max) COLLATE Arabic_CI_AS NULL,
		CONSTRAINT [frwProcedures_Procedure]
		PRIMARY KEY
		CLUSTERED
		([GUID])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwProcedures]
	ADD
	CONSTRAINT [frwProcedures_GUID]
	DEFAULT (newid()) FOR [GUID]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwProcedures]
	ON [dbo].[frwProcedures] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwProcedures] SET (LOCK_ESCALATION = TABLE)
GO

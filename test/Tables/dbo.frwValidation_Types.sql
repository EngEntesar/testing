SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[frwValidation_Types] (
		[GUID]     [uniqueidentifier] NULL ROWGUIDCOL,
		[ID]       [int] NOT NULL,
		[Type]     [varchar](200) COLLATE Arabic_CI_AS NOT NULL,
		CONSTRAINT [frwValidation_Types_ID]
		PRIMARY KEY
		CLUSTERED
		([ID])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwValidation_Types]
	ADD
	CONSTRAINT [frwValidation_Types_GUID]
	DEFAULT (newid()) FOR [GUID]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwValidation_Types]
	ON [dbo].[frwValidation_Types] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwValidation_Types] SET (LOCK_ESCALATION = TABLE)
GO

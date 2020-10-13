SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[frwYesNoNotApplicable] (
		[Code]          [smallint] NOT NULL,
		[Name]          [varchar](20) COLLATE Arabic_CI_AS NOT NULL,
		[YesNoOnly]     [bit] NULL,
		[GUID]          [uniqueidentifier] NOT NULL ROWGUIDCOL,
		CONSTRAINT [PK_frwYesNoNotApplicable]
		PRIMARY KEY
		CLUSTERED
		([Code])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwYesNoNotApplicable]
	ADD
	CONSTRAINT [DF__frwYesNoNo__GUID__093F5D4E]
	DEFAULT (newid()) FOR [GUID]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwYesNoNotApplicable]
	ON [dbo].[frwYesNoNotApplicable] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwYesNoNotApplicable] SET (LOCK_ESCALATION = TABLE)
GO

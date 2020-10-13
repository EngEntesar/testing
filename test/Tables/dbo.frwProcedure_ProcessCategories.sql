SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[frwProcedure_ProcessCategories] (
		[GUID]              [uniqueidentifier] NULL ROWGUIDCOL,
		[ID]                [int] NOT NULL,
		[DescriptionEn]     [varchar](200) COLLATE Arabic_CI_AS NOT NULL,
		[DescriptionAr]     [varchar](200) COLLATE Arabic_CI_AS NULL,
		CONSTRAINT [frwProcedure_ProcessCategories_ID]
		PRIMARY KEY
		CLUSTERED
		([ID])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwProcedure_ProcessCategories]
	ADD
	CONSTRAINT [frwProcedure_ProcessCategories_GUID]
	DEFAULT (newid()) FOR [GUID]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwProcedure_ProcessCategories]
	ON [dbo].[frwProcedure_ProcessCategories] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwProcedure_ProcessCategories] SET (LOCK_ESCALATION = TABLE)
GO

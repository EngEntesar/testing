SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[frwTutorial_Types] (
		[ID]                [int] NOT NULL,
		[DescriptionAr]     [varchar](50) COLLATE Arabic_CI_AS NOT NULL,
		[DescriptionEn]     [varchar](50) COLLATE Arabic_CI_AS NOT NULL,
		[GUID]              [uniqueidentifier] NOT NULL ROWGUIDCOL,
		CONSTRAINT [PK_frwTutorial_Types]
		PRIMARY KEY
		CLUSTERED
		([ID])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwTutorial_Types]
	ADD
	CONSTRAINT [DF__frwTutoria__GUID__5C02A283]
	DEFAULT (newid()) FOR [GUID]
GO
ALTER TABLE [dbo].[frwTutorial_Types] SET (LOCK_ESCALATION = TABLE)
GO

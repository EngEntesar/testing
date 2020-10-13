SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[frwIntelligence] (
		[key]             [varchar](100) COLLATE Arabic_CI_AS NOT NULL,
		[Control]         [varchar](100) COLLATE Arabic_CI_AS NOT NULL,
		[GUID]            [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[Config_GUID]     [uniqueidentifier] NULL,
		CONSTRAINT [PK_frwIntelligence]
		PRIMARY KEY
		CLUSTERED
		([key])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwIntelligence]
	ADD
	CONSTRAINT [DF_frwIntelligence_GUID]
	DEFAULT (newid()) FOR [GUID]
GO
ALTER TABLE [dbo].[frwIntelligence]
	WITH CHECK
	ADD CONSTRAINT [FK_frwIntelligence_frwConfig]
	FOREIGN KEY ([Config_GUID]) REFERENCES [dbo].[frwConfig] ([GUID])
ALTER TABLE [dbo].[frwIntelligence]
	CHECK CONSTRAINT [FK_frwIntelligence_frwConfig]

GO
ALTER TABLE [dbo].[frwIntelligence]
	WITH CHECK
	ADD CONSTRAINT [FK_frwIntelligence_frwControl_Types]
	FOREIGN KEY ([Control]) REFERENCES [dbo].[frwControl_Types] ([Control_Type])
ALTER TABLE [dbo].[frwIntelligence]
	CHECK CONSTRAINT [FK_frwIntelligence_frwControl_Types]

GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwIntelligence]
	ON [dbo].[frwIntelligence] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwIntelligence] SET (LOCK_ESCALATION = TABLE)
GO

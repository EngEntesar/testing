SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[frwAtServerEvents] (
		[ObjectName]        [varchar](50) COLLATE Arabic_CI_AS NOT NULL,
		[AtServerEvent]     [varchar](255) COLLATE Arabic_CI_AS NOT NULL,
		[Status]            [varchar](50) COLLATE Arabic_CI_AS NULL,
		[GUID]              [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[LastSentTime]      [datetime] NULL,
		[Period]            [float] NULL,
		[PeriodType]        [int] NULL,
		CONSTRAINT [PK_frwAtServerEvents]
		PRIMARY KEY
		CLUSTERED
		([ObjectName], [GUID])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwAtServerEvents]
	ADD
	CONSTRAINT [DF_frwAtServerEvents_Status]
	DEFAULT ('Waiting') FOR [Status]
GO
ALTER TABLE [dbo].[frwAtServerEvents]
	ADD
	CONSTRAINT [DF_frwAtServerEvents_GUID]
	DEFAULT (newid()) FOR [GUID]
GO
ALTER TABLE [dbo].[frwAtServerEvents]
	WITH CHECK
	ADD CONSTRAINT [FK_frwAtServerEvents_frwOBJECTS]
	FOREIGN KEY ([ObjectName]) REFERENCES [dbo].[frwObjects] ([Object_Name])
	ON DELETE CASCADE
	ON UPDATE CASCADE
ALTER TABLE [dbo].[frwAtServerEvents]
	CHECK CONSTRAINT [FK_frwAtServerEvents_frwOBJECTS]

GO
ALTER TABLE [dbo].[frwAtServerEvents]
	WITH CHECK
	ADD CONSTRAINT [FK_frwAtServerEvents_frwPeriouds]
	FOREIGN KEY ([PeriodType]) REFERENCES [dbo].[frwPeriouds] ([ID])
ALTER TABLE [dbo].[frwAtServerEvents]
	CHECK CONSTRAINT [FK_frwAtServerEvents_frwPeriouds]

GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwAtServerEvents]
	ON [dbo].[frwAtServerEvents] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwAtServerEvents] SET (LOCK_ESCALATION = TABLE)
GO

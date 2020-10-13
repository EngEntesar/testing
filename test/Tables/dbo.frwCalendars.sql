SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[frwCalendars] (
		[GUID]                   [uniqueidentifier] NULL ROWGUIDCOL,
		[Code]                   [int] NOT NULL,
		[DescriptionAr]          [varchar](200) COLLATE Arabic_CI_AS NOT NULL,
		[DescriptionEn]          [varchar](200) COLLATE Arabic_CI_AS NOT NULL,
		[frwCalendar_Types]      [int] NOT NULL,
		[Saturday]               [bit] NULL,
		[Sunday]                 [bit] NULL,
		[Monday]                 [bit] NULL,
		[Tuesday]                [bit] NULL,
		[Wednesday]              [bit] NULL,
		[Thursday]               [bit] NULL,
		[Friday]                 [bit] NULL,
		[TotalHours]             [float] NULL,
		[SYS_WizardHeaderID]     [int] NULL,
		CONSTRAINT [frwCalendars_Code]
		PRIMARY KEY
		CLUSTERED
		([Code])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwCalendars]
	ADD
	CONSTRAINT [frwCalendars_GUID]
	DEFAULT (newid()) FOR [GUID]
GO
ALTER TABLE [dbo].[frwCalendars]
	ADD
	CONSTRAINT [DF_frwCalendars_SYS_WizardHeaderID]
	DEFAULT ((1)) FOR [SYS_WizardHeaderID]
GO
ALTER TABLE [dbo].[frwCalendars]
	WITH CHECK
	ADD CONSTRAINT [FK_frwCalendars_frwCalendar_Types]
	FOREIGN KEY ([frwCalendar_Types]) REFERENCES [dbo].[frwCalendar_Types] ([Code])
	ON DELETE CASCADE
	ON UPDATE CASCADE
ALTER TABLE [dbo].[frwCalendars]
	CHECK CONSTRAINT [FK_frwCalendars_frwCalendar_Types]

GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwCalendars]
	ON [dbo].[frwCalendars] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwCalendars] SET (LOCK_ESCALATION = TABLE)
GO

SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[frwHolidaysAndEvents] (
		[GUID]                  [uniqueidentifier] NULL ROWGUIDCOL,
		[Code]                  [int] NOT NULL,
		[DescriptionAr]         [varchar](500) COLLATE Arabic_CI_AS NOT NULL,
		[DescriptionEn]         [varchar](500) COLLATE Arabic_CI_AS NOT NULL,
		[Month]                 [smallint] NOT NULL,
		[Holiday]               [bit] NULL,
		[Guaranteed]            [bit] NULL,
		[Day]                   [smallint] NOT NULL,
		[Calendar_Code]         [int] NOT NULL,
		[frwCalendar_Types]     [int] NULL,
		CONSTRAINT [frwHolidaysAndEvents_Code]
		PRIMARY KEY
		CLUSTERED
		([Code], [Calendar_Code])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwHolidaysAndEvents]
	ADD
	CONSTRAINT [frwHolidaysAndEvents_GUID]
	DEFAULT (newid()) FOR [GUID]
GO
ALTER TABLE [dbo].[frwHolidaysAndEvents]
	WITH CHECK
	ADD CONSTRAINT [FK_frwHolidaysAndEvents_frwCalendars]
	FOREIGN KEY ([Calendar_Code]) REFERENCES [dbo].[frwCalendars] ([Code])
	ON DELETE CASCADE
	ON UPDATE CASCADE
ALTER TABLE [dbo].[frwHolidaysAndEvents]
	CHECK CONSTRAINT [FK_frwHolidaysAndEvents_frwCalendars]

GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwHolidaysAndEvents]
	ON [dbo].[frwHolidaysAndEvents] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwHolidaysAndEvents] SET (LOCK_ESCALATION = TABLE)
GO

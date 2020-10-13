SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[frwWorkingHours] (
		[GUID]              [uniqueidentifier] NULL ROWGUIDCOL,
		[Code]              [int] NOT NULL,
		[Shift]             [varchar](200) COLLATE Arabic_CI_AS NOT NULL,
		[Calendar_Code]     [int] NOT NULL,
		[Shift_From]        [smalldatetime] NOT NULL,
		[Shift_To]          [smalldatetime] NOT NULL,
		CONSTRAINT [frwWorkingHours_Code]
		PRIMARY KEY
		CLUSTERED
		([Code], [Calendar_Code])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwWorkingHours]
	ADD
	CONSTRAINT [frwWorkingHours_GUID]
	DEFAULT (newid()) FOR [GUID]
GO
ALTER TABLE [dbo].[frwWorkingHours]
	WITH CHECK
	ADD CONSTRAINT [FK_frwWorkingHours_frwCalendars]
	FOREIGN KEY ([Calendar_Code]) REFERENCES [dbo].[frwCalendars] ([Code])
	ON DELETE CASCADE
	ON UPDATE CASCADE
ALTER TABLE [dbo].[frwWorkingHours]
	CHECK CONSTRAINT [FK_frwWorkingHours_frwCalendars]

GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwWorkingHours]
	ON [dbo].[frwWorkingHours] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwWorkingHours] SET (LOCK_ESCALATION = TABLE)
GO

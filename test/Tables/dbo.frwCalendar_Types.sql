SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[frwCalendar_Types] (
		[GUID]              [uniqueidentifier] NULL ROWGUIDCOL,
		[Code]              [int] NOT NULL,
		[DescriptionAr]     [varchar](200) COLLATE Arabic_CI_AS NOT NULL,
		[DescriptionEn]     [varchar](200) COLLATE Arabic_CI_AS NOT NULL,
		[Support]           [varchar](500) COLLATE Arabic_CI_AS NULL,
		CONSTRAINT [frwCalendar_Types_Code]
		PRIMARY KEY
		CLUSTERED
		([Code])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwCalendar_Types]
	ADD
	CONSTRAINT [frwCalendar_Types_GUID]
	DEFAULT (newid()) FOR [GUID]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwCalendar_Types]
	ON [dbo].[frwCalendar_Types] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwCalendar_Types] SET (LOCK_ESCALATION = TABLE)
GO

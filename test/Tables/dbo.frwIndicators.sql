SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[frwIndicators] (
		[ID]            [int] NOT NULL,
		[Indicator]     [varchar](100) COLLATE Arabic_CI_AS NOT NULL,
		[Icon]          [varbinary](max) NOT NULL,
		[GUID]          [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[Trend]         [int] NULL,
		[Status]        [int] NULL,
		CONSTRAINT [PK_frwIndicators]
		PRIMARY KEY
		CLUSTERED
		([ID])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwIndicators]
	ADD
	CONSTRAINT [DF_frwIndicators_GUID]
	DEFAULT (newid()) FOR [GUID]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwIndicators]
	ON [dbo].[frwIndicators] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwIndicators] SET (LOCK_ESCALATION = TABLE)
GO

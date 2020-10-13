SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[frwReportCategories] (
		[ReportCateogry_ID]             [int] NOT NULL,
		[ReportCategory_Name]           [varchar](60) COLLATE Arabic_CI_AS NOT NULL,
		[ReportCategory_Path]           [text] COLLATE Arabic_CI_AS NOT NULL,
		[GUID]                          [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[ReportCategory_RighToLeft]     [varchar](60) COLLATE Arabic_CI_AS NULL,
		CONSTRAINT [PK_frwReportCategories]
		PRIMARY KEY
		CLUSTERED
		([ReportCateogry_ID])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwReportCategories]
	ADD
	CONSTRAINT [DF__frwReportC__GUID__09DE7BCC]
	DEFAULT (newid()) FOR [GUID]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwReportCategories]
	ON [dbo].[frwReportCategories] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwReportCategories] SET (LOCK_ESCALATION = TABLE)
GO

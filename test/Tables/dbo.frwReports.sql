SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[frwReports] (
		[Report_FileName]          [varchar](max) COLLATE Arabic_CI_AS NULL,
		[Report_Description]       [varchar](100) COLLATE Arabic_CI_AS NULL,
		[Report_ObjectName]        [varchar](50) COLLATE Arabic_CI_AS NULL,
		[Report_CategoryID]        [int] NULL,
		[Report_UserID]            [varchar](20) COLLATE Arabic_CI_AS NULL,
		[Report_Notes]             [text] COLLATE Arabic_CI_AS NULL,
		[GUID]                     [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[Report_Prerequisite]      [varchar](255) COLLATE Arabic_CI_AS NULL,
		[Report_Driver]            [varchar](255) COLLATE Arabic_CI_AS NULL,
		[Report_DNS]               [varchar](255) COLLATE Arabic_CI_AS NULL,
		[Report_RighToLeft]        [varchar](100) COLLATE Arabic_CI_AS NULL,
		[Report_ShowSelection]     [bit] NULL,
		[Report_Web]               [bit] NULL,
		CONSTRAINT [PK_frwReports]
		PRIMARY KEY
		CLUSTERED
		([GUID])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwReports]
	ADD
	CONSTRAINT [DF_frwReports_Report_CategoryID]
	DEFAULT ((0)) FOR [Report_CategoryID]
GO
ALTER TABLE [dbo].[frwReports]
	ADD
	CONSTRAINT [DF_frwReports_GUID]
	DEFAULT (newid()) FOR [GUID]
GO
ALTER TABLE [dbo].[frwReports]
	WITH CHECK
	ADD CONSTRAINT [FK_frwReports_frwOBJECTS]
	FOREIGN KEY ([Report_ObjectName]) REFERENCES [dbo].[frwObjects] ([Object_Name])
	ON DELETE CASCADE
	ON UPDATE CASCADE
ALTER TABLE [dbo].[frwReports]
	CHECK CONSTRAINT [FK_frwReports_frwOBJECTS]

GO
ALTER TABLE [dbo].[frwReports]
	WITH CHECK
	ADD CONSTRAINT [FK_frwReports_frwODBCDrivers]
	FOREIGN KEY ([Report_Driver]) REFERENCES [dbo].[frwODBCDrivers] ([Driver])
	ON DELETE CASCADE
	ON UPDATE CASCADE
ALTER TABLE [dbo].[frwReports]
	CHECK CONSTRAINT [FK_frwReports_frwODBCDrivers]

GO
ALTER TABLE [dbo].[frwReports]
	WITH CHECK
	ADD CONSTRAINT [FK_frwReports_frwReportCategories]
	FOREIGN KEY ([Report_CategoryID]) REFERENCES [dbo].[frwReportCategories] ([ReportCateogry_ID])
	ON DELETE CASCADE
	ON UPDATE CASCADE
ALTER TABLE [dbo].[frwReports]
	CHECK CONSTRAINT [FK_frwReports_frwReportCategories]

GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwReports]
	ON [dbo].[frwReports] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwReports] SET (LOCK_ESCALATION = TABLE)
GO

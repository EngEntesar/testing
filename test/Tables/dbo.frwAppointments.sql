SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[frwAppointments] (
		[UniqueID]           [int] IDENTITY(1, 1) NOT NULL,
		[Type]               [int] NULL,
		[StartDate]          [smalldatetime] NULL,
		[EndDate]            [smalldatetime] NULL,
		[AllDay]             [bit] NULL,
		[Subject]            [nvarchar](100) COLLATE Arabic_CI_AS NULL,
		[Location]           [nvarchar](50) COLLATE Arabic_CI_AS NULL,
		[Description]        [ntext] COLLATE Arabic_CI_AS NULL,
		[Status]             [int] NULL,
		[Label]              [int] NULL,
		[ResourceID]         [int] NULL,
		[ReminderInfo]       [ntext] COLLATE Arabic_CI_AS NULL,
		[RecurrenceInfo]     [ntext] COLLATE Arabic_CI_AS NULL,
		[CustomField1]       [ntext] COLLATE Arabic_CI_AS NULL,
		[UserID]             [varchar](100) COLLATE Arabic_CI_AS NULL,
		[GUID]               [uniqueidentifier] NULL ROWGUIDCOL,
		CONSTRAINT [PK_frwAppointments]
		PRIMARY KEY
		CLUSTERED
		([UniqueID])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwAppointments]
	ADD
	CONSTRAINT [DF_frwAppointments_GUID]
	DEFAULT (newid()) FOR [GUID]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwAppointments]
	ON [dbo].[frwAppointments] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwAppointments] SET (LOCK_ESCALATION = TABLE)
GO

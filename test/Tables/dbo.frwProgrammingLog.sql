SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[frwProgrammingLog] (
		[GUID]                 [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[ProgrammerID]         [varchar](50) COLLATE Arabic_CI_AS NOT NULL,
		[CheckIn]              [datetime] NOT NULL,
		[CheckInAgree]         [bit] NULL,
		[CheckInNotes]         [varchar](max) COLLATE Arabic_CI_AS NULL,
		[EffectedModule1]      [bit] NULL,
		[EffectedModule2]      [bit] NULL,
		[EffectedModule3]      [bit] NULL,
		[EffectedModule4]      [bit] NULL,
		[EffectedModule5]      [bit] NULL,
		[EffectedModule6]      [bit] NULL,
		[EffectedModule7]      [bit] NULL,
		[EffectedModule8]      [bit] NULL,
		[EffectedModule9]      [bit] NULL,
		[EffectedModule10]     [bit] NULL,
		[EffectedModule11]     [bit] NULL,
		[EffectedModule12]     [bit] NULL,
		[EffectedModule13]     [bit] NULL,
		[EffectedModule14]     [bit] NULL,
		[EffectedModule15]     [bit] NULL,
		[EffectedModule16]     [bit] NULL,
		[EffectedModule17]     [bit] NULL,
		[CheckOut]             [datetime] NULL,
		[CheckOutAgree]        [bit] NULL,
		[CheckOutNotes]        [varchar](max) COLLATE Arabic_CI_AS NULL,
		CONSTRAINT [frwProgrammingLog_ProgrammerID]
		PRIMARY KEY
		CLUSTERED
		([GUID])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwProgrammingLog]
	ADD
	CONSTRAINT [frwProgrammingLog_GUID]
	DEFAULT (newid()) FOR [GUID]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwProgrammingLog]
	ON [dbo].[frwProgrammingLog] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwProgrammingLog] SET (LOCK_ESCALATION = TABLE)
GO

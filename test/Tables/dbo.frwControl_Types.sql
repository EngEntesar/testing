SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[frwControl_Types] (
		[Control_Type]     [varchar](100) COLLATE Arabic_CI_AS NOT NULL,
		[GUID]             [uniqueidentifier] NOT NULL ROWGUIDCOL,
		CONSTRAINT [PK_frwControls]
		PRIMARY KEY
		CLUSTERED
		([Control_Type])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwControl_Types]
	ADD
	CONSTRAINT [DF_frwControl_Types_GUID]
	DEFAULT (newid()) FOR [GUID]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwControl_Types]
	ON [dbo].[frwControl_Types] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwControl_Types] SET (LOCK_ESCALATION = TABLE)
GO

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[frwCompare] (
		[ID]          [bigint] NOT NULL,
		[Options]     [varchar](50) COLLATE Arabic_CI_AS NOT NULL,
		[GUID]        [uniqueidentifier] NOT NULL ROWGUIDCOL,
		CONSTRAINT [PK_frwCompare]
		PRIMARY KEY
		CLUSTERED
		([ID])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwCompare]
	ADD
	CONSTRAINT [DF__frwCompare__GUID__42F8C60F]
	DEFAULT (newid()) FOR [GUID]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwCompare]
	ON [dbo].[frwCompare] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwCompare] SET (LOCK_ESCALATION = TABLE)
GO

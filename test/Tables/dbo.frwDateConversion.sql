SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[frwDateConversion] (
		[GUID]                    [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[TableName]               [varchar](255) COLLATE Arabic_CI_AS NULL,
		[FieldName]               [varchar](255) COLLATE Arabic_CI_AS NULL,
		[AR2EN]                   [smallint] NULL,
		[EN2AR]                   [smallint] NULL,
		[NewField]                [bit] NULL,
		[NewFieldName]            [varchar](255) COLLATE Arabic_CI_AS NULL,
		[HijriFormatYYYYDDMM]     [bit] NULL,
		[Separator]               [varchar](1) COLLATE Arabic_CI_AS NULL,
		[ErrorsList]              [varchar](max) COLLATE Arabic_CI_AS NULL,
		CONSTRAINT [frwDateConversion_TableName]
		PRIMARY KEY
		CLUSTERED
		([GUID])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwDateConversion]
	ADD
	CONSTRAINT [frwDateConversion_GUID]
	DEFAULT (newid()) FOR [GUID]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwDateConversion]
	ON [dbo].[frwDateConversion] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwDateConversion] SET (LOCK_ESCALATION = TABLE)
GO

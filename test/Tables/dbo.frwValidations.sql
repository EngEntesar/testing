SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[frwValidations] (
		[GUID]                 [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[ObjectID]             [varchar](50) COLLATE Arabic_CI_AS NOT NULL,
		[Serial]               [int] NOT NULL,
		[Title]                [varchar](100) COLLATE Arabic_CI_AS NOT NULL,
		[Field]                [varchar](100) COLLATE Arabic_CI_AS NULL,
		[Operator]             [varchar](50) COLLATE Arabic_CI_AS NOT NULL,
		[Expression]           [varchar](max) COLLATE Arabic_CI_AS NULL,
		[Formula]              [varchar](max) COLLATE Arabic_CI_AS NULL,
		[Compare]              [bigint] NULL,
		[ArabicTitle]          [varchar](100) COLLATE Arabic_CI_AS NULL,
		[Active]               [bit] NULL,
		[BeforeSaving]         [bit] NULL,
		[EnabledFormula]       [bit] NULL,
		[ValidationTypeID]     [int] NOT NULL,
		[Object]               [varchar](255) COLLATE Arabic_CI_AS NULL,
		[MsgID]                [varchar](20) COLLATE Arabic_CI_AS NULL,
		CONSTRAINT [PK_frwValidations]
		PRIMARY KEY
		CLUSTERED
		([GUID], [ObjectID])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwValidations]
	ADD
	CONSTRAINT [DF_frwValidations_GUID]
	DEFAULT (newid()) FOR [GUID]
GO
ALTER TABLE [dbo].[frwValidations]
	ADD
	CONSTRAINT [DF_frwValidations_Active]
	DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[frwValidations]
	WITH CHECK
	ADD CONSTRAINT [FK_frwValidations_frwCompare]
	FOREIGN KEY ([Compare]) REFERENCES [dbo].[frwCompare] ([ID])
	ON DELETE CASCADE
	ON UPDATE CASCADE
ALTER TABLE [dbo].[frwValidations]
	CHECK CONSTRAINT [FK_frwValidations_frwCompare]

GO
ALTER TABLE [dbo].[frwValidations]
	WITH CHECK
	ADD CONSTRAINT [FK_frwValidations_frwOBJECTS]
	FOREIGN KEY ([ObjectID]) REFERENCES [dbo].[frwObjects] ([Object_Name])
	ON DELETE CASCADE
	ON UPDATE CASCADE
ALTER TABLE [dbo].[frwValidations]
	CHECK CONSTRAINT [FK_frwValidations_frwOBJECTS]

GO
ALTER TABLE [dbo].[frwValidations]
	WITH CHECK
	ADD CONSTRAINT [FK_frwValidations_frwValidation_Types]
	FOREIGN KEY ([ValidationTypeID]) REFERENCES [dbo].[frwValidation_Types] ([ID])
	ON UPDATE CASCADE
ALTER TABLE [dbo].[frwValidations]
	CHECK CONSTRAINT [FK_frwValidations_frwValidation_Types]

GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwValidations]
	ON [dbo].[frwValidations] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwValidations] SET (LOCK_ESCALATION = TABLE)
GO

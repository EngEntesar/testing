SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[frwProcedure_Objects] (
		[GUID]               [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[Procedure_GUID]     [uniqueidentifier] NOT NULL,
		[Object_Name]        [varchar](50) COLLATE Arabic_CI_AS NOT NULL,
		[Description]        [varchar](max) COLLATE Arabic_CI_AS NULL,
		[Sequence]           [bigint] NOT NULL,
		[TrackingField]      [varchar](255) COLLATE Arabic_CI_AS NULL,
		CONSTRAINT [PK_frwProcedure_Objects]
		PRIMARY KEY
		CLUSTERED
		([GUID], [Procedure_GUID])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwProcedure_Objects]
	ADD
	CONSTRAINT [DF_frwProcedure_Objects_GUID]
	DEFAULT (newid()) FOR [GUID]
GO
ALTER TABLE [dbo].[frwProcedure_Objects]
	WITH CHECK
	ADD CONSTRAINT [FK_frwProcedure_Objects_frwOBJECTS]
	FOREIGN KEY ([Object_Name]) REFERENCES [dbo].[frwObjects] ([Object_Name])
	ON DELETE CASCADE
	ON UPDATE CASCADE
ALTER TABLE [dbo].[frwProcedure_Objects]
	CHECK CONSTRAINT [FK_frwProcedure_Objects_frwOBJECTS]

GO
ALTER TABLE [dbo].[frwProcedure_Objects]
	WITH CHECK
	ADD CONSTRAINT [FK_frwProcedure_Objects_frwProcedures1]
	FOREIGN KEY ([Procedure_GUID]) REFERENCES [dbo].[frwProcedures] ([GUID])
ALTER TABLE [dbo].[frwProcedure_Objects]
	CHECK CONSTRAINT [FK_frwProcedure_Objects_frwProcedures1]

GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwProcedure_Objects]
	ON [dbo].[frwProcedure_Objects] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwProcedure_Objects] SET (LOCK_ESCALATION = TABLE)
GO

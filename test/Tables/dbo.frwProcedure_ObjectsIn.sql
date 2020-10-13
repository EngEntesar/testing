SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[frwProcedure_ObjectsIn] (
		[GUID]               [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[Procedure_GUID]     [uniqueidentifier] NOT NULL,
		[Object_Name]        [varchar](50) COLLATE Arabic_CI_AS NOT NULL,
		[Description]        [varchar](max) COLLATE Arabic_CI_AS NULL,
		[Sequence]           [bigint] NOT NULL,
		[TrackingField]      [varchar](255) COLLATE Arabic_CI_AS NULL,
		[CategoryID]         [int] NULL,
		CONSTRAINT [PK_frwProcedure_ObjectsIn]
		PRIMARY KEY
		CLUSTERED
		([GUID], [Procedure_GUID])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwProcedure_ObjectsIn]
	ADD
	CONSTRAINT [DF_frwProcedure_ObjectsIn_GUID]
	DEFAULT (newid()) FOR [GUID]
GO
ALTER TABLE [dbo].[frwProcedure_ObjectsIn]
	WITH CHECK
	ADD CONSTRAINT [FK_frwProcedure_ObjectsIn_frwOBJECTS]
	FOREIGN KEY ([Object_Name]) REFERENCES [dbo].[frwObjects] ([Object_Name])
	ON DELETE CASCADE
	ON UPDATE CASCADE
ALTER TABLE [dbo].[frwProcedure_ObjectsIn]
	CHECK CONSTRAINT [FK_frwProcedure_ObjectsIn_frwOBJECTS]

GO
ALTER TABLE [dbo].[frwProcedure_ObjectsIn]
	WITH CHECK
	ADD CONSTRAINT [FK_frwProcedure_ObjectsIn_frwProcedures1]
	FOREIGN KEY ([Procedure_GUID]) REFERENCES [dbo].[frwProcedures] ([GUID])
ALTER TABLE [dbo].[frwProcedure_ObjectsIn]
	CHECK CONSTRAINT [FK_frwProcedure_ObjectsIn_frwProcedures1]

GO
CREATE UNIQUE NONCLUSTERED INDEX [IXGUID_frwProcedure_ObjectsIn]
	ON [dbo].[frwProcedure_ObjectsIn] ([GUID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[frwProcedure_ObjectsIn] SET (LOCK_ESCALATION = TABLE)
GO

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GitDemo] (
		[myid]     [int] NULL,
		[name]     [varchar](50) COLLATE Arabic_CI_AS NULL
)
GO
ALTER TABLE [dbo].[GitDemo] SET (LOCK_ESCALATION = TABLE)
GO

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[frwResources] (
		[UniqueID]         [int] IDENTITY(1, 1) NOT NULL,
		[ResourceID]       [int] NOT NULL,
		[ResourceName]     [nvarchar](50) COLLATE Arabic_CI_AS NULL,
		[Color]            [int] NULL,
		[Image]            [image] NULL,
		[CustomField1]     [ntext] COLLATE Arabic_CI_AS NULL,
		CONSTRAINT [PK_frwResources]
		PRIMARY KEY
		CLUSTERED
		([UniqueID])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frwResources] SET (LOCK_ESCALATION = TABLE)
GO

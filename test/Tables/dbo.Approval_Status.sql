SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Approval_Status] (
		[GUID]              [uniqueidentifier] NULL,
		[StatusID]          [varchar](50) COLLATE Arabic_CI_AS NOT NULL,
		[DescriptionEn]     [varchar](50) COLLATE Arabic_CI_AS NOT NULL,
		[DescriptionAr]     [varchar](50) COLLATE Arabic_CI_AS NOT NULL
)
GO
ALTER TABLE [dbo].[Approval_Status] SET (LOCK_ESCALATION = TABLE)
GO

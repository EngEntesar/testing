SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[frweInvoiceStatus] (
		[eInvoiceStatusID]     [varchar](20) COLLATE Arabic_CI_AS NOT NULL,
		[Description]          [varchar](255) COLLATE Arabic_CI_AS NULL,
		[GUID]                 [uniqueidentifier] NOT NULL,
		[Note]                 [text] COLLATE Arabic_CI_AS NULL,
		[DescriptionAr]        [varchar](255) COLLATE Arabic_CI_AS NULL,
		CONSTRAINT [PK_frweInvoiceStatus]
		PRIMARY KEY
		CLUSTERED
		([eInvoiceStatusID])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frweInvoiceStatus]
	ADD
	CONSTRAINT [DF_frweInvoiceStatus_GUID]
	DEFAULT (newid()) FOR [GUID]
GO
ALTER TABLE [dbo].[frweInvoiceStatus] SET (LOCK_ESCALATION = TABLE)
GO

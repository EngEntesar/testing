SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[frweInvoice] (
		[eSalesInvoiceID]                   [varchar](20) COLLATE Arabic_CI_AS NOT NULL,
		[SalesInvoiceDate]                  [datetime] NULL,
		[CustID]                            [varchar](20) COLLATE Arabic_CI_AS NULL,
		[CustContactID]                     [int] NULL,
		[CustPostingProfileID]              [varchar](20) COLLATE Arabic_CI_AS NULL,
		[SalesOrderID]                      [varchar](20) COLLATE Arabic_CI_AS NULL,
		[Description]                       [varchar](255) COLLATE Arabic_CI_AS NULL,
		[DescriptionAr]                     [varchar](255) COLLATE Arabic_CI_AS NULL,
		[CurrencyID]                        [varchar](20) COLLATE Arabic_CI_AS NULL,
		[NetTotalBeforeDisc]                [float] NULL,
		[DiscountTotal]                     [float] NULL,
		[NetTotalAfterDisc]                 [float] NULL,
		[DocumentReference]                 [varchar](20) COLLATE Arabic_CI_AS NULL,
		[DocumentDate]                      [date] NULL,
		[CustPaymentMethodID]               [varchar](20) COLLATE Arabic_CI_AS NULL,
		[SalesInvoiceDueDate]               [date] NULL,
		[SalesInvoiceStatusID]              [varchar](20) COLLATE Arabic_CI_AS NULL,
		[SiteID]                            [varchar](20) COLLATE Arabic_CI_AS NULL,
		[StoreID]                           [varchar](20) COLLATE Arabic_CI_AS NULL,
		[Note]                              [text] COLLATE Arabic_CI_AS NULL,
		[CreatedDate]                       [date] NULL,
		[CreatedUSer]                       [varchar](20) COLLATE Arabic_CI_AS NULL,
		[PostedDate]                        [date] NULL,
		[PostedUSer]                        [varchar](20) COLLATE Arabic_CI_AS NULL,
		[Dim1ID]                            [varchar](20) COLLATE Arabic_CI_AS NULL,
		[Dim2ID]                            [varchar](20) COLLATE Arabic_CI_AS NULL,
		[Dim3ID]                            [varchar](20) COLLATE Arabic_CI_AS NULL,
		[Dim4ID]                            [varchar](20) COLLATE Arabic_CI_AS NULL,
		[Dim5ID]                            [varchar](20) COLLATE Arabic_CI_AS NULL,
		[CostCenterID]                      [varchar](20) COLLATE Arabic_CI_AS NULL,
		[LedgerJournalID]                   [varchar](20) COLLATE Arabic_CI_AS NULL,
		[LedgerVoucherID]                   [varchar](20) COLLATE Arabic_CI_AS NULL,
		[DirectSalesInvoice]                [bit] NULL,
		[SalesManID]                        [varchar](20) COLLATE Arabic_CI_AS NULL,
		[Settled]                           [float] NULL,
		[Remaining]                         [float] NULL,
		[GUID]                              [uniqueidentifier] NOT NULL,
		[ServiceID]                         [varchar](20) COLLATE Arabic_CI_AS NULL,
		[ReSellerID]                        [int] NULL,
		[Company]                           [varchar](20) COLLATE Arabic_CI_AS NULL,
		[EstimationID]                      [varchar](20) COLLATE Arabic_CI_AS NULL,
		[JournalIDTarget]                   [uniqueidentifier] NULL,
		[ContractID]                        [varchar](20) COLLATE Arabic_CI_AS NULL,
		[Advanced]                          [float] NULL,
		[retention]                         [float] NULL,
		[BillingType]                       [varchar](20) COLLATE Arabic_CI_AS NULL,
		[CustAdvancedPostingProfileID]      [varchar](20) COLLATE Arabic_CI_AS NULL,
		[CustretentionPostingProfileID]     [varchar](20) COLLATE Arabic_CI_AS NULL,
		[RetentionAmount]                   [float] NULL,
		[AdvancedAmount]                    [float] NULL,
		[ContractAmount]                    [float] NULL,
		[ContractType]                      [varchar](20) COLLATE Arabic_CI_AS NULL,
		[OriginTypeID]                      [int] NULL,
		[SerialNumberInConsideration]       [bit] NULL,
		[VoucherSeq]                        [int] NULL,
		[AdvanceJV]                         [varchar](20) COLLATE Arabic_CI_AS NULL,
		[SectionID]                         [varchar](50) COLLATE Arabic_CI_AS NULL,
		[ShipmentNo]                        [varchar](50) COLLATE Arabic_CI_AS NULL,
		[NetTotalExclTax]                   [float] NULL,
		[Email]                             [varchar](150) COLLATE Arabic_CI_AS NULL,
		[Tel]                               [varchar](50) COLLATE Arabic_CI_AS NULL,
		[DataBaseName]                      [varchar](150) COLLATE Arabic_CI_AS NULL,
		[CompanyName]                       [varchar](150) COLLATE Arabic_CI_AS NULL,
		[CompanyID]                         [varchar](20) COLLATE Arabic_CI_AS NULL,
		[ItemsCount]                        [int] NULL,
		[FromDate]                          [datetime] NULL,
		[ToDate]                            [datetime] NULL,
		[PaidPeriod]                        [float] NULL,
		CONSTRAINT [PK_frweInvoice]
		PRIMARY KEY
		CLUSTERED
		([eSalesInvoiceID])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frweInvoice]
	ADD
	CONSTRAINT [DF_frweInvoice_GUID]
	DEFAULT (newid()) FOR [GUID]
GO
ALTER TABLE [dbo].[frweInvoice]
	WITH CHECK
	ADD CONSTRAINT [FK_frweInvoice_frweInvoiceStatus]
	FOREIGN KEY ([SalesInvoiceStatusID]) REFERENCES [dbo].[frweInvoiceStatus] ([eInvoiceStatusID])
ALTER TABLE [dbo].[frweInvoice]
	CHECK CONSTRAINT [FK_frweInvoice_frweInvoiceStatus]

GO
ALTER TABLE [dbo].[frweInvoice] SET (LOCK_ESCALATION = TABLE)
GO

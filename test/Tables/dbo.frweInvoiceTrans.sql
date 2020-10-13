SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[frweInvoiceTrans] (
		[eSalesInvoiceID]             [varchar](20) COLLATE Arabic_CI_AS NOT NULL,
		[VoucherSeq]                  [int] NOT NULL,
		[SalesOrderID]                [varchar](20) COLLATE Arabic_CI_AS NULL,
		[ProductID]                   [varchar](30) COLLATE Arabic_CI_AS NULL,
		[Description]                 [varchar](255) COLLATE Arabic_CI_AS NULL,
		[DescriptionAr]               [varchar](255) COLLATE Arabic_CI_AS NULL,
		[Qty]                         [float] NULL,
		[AvailableQTY]                [float] NULL,
		[ReturnQty]                   [float] NULL,
		[UOMID]                       [varchar](20) COLLATE Arabic_CI_AS NULL,
		[Amount]                      [float] NULL,
		[NetTotalBeforeDisc]          [float] NULL,
		[DiscountTypeID]              [varchar](20) COLLATE Arabic_CI_AS NULL,
		[DiscountValue]               [float] NULL,
		[Discount]                    [float] NULL,
		[DiscountPerUnit]             [float] NULL,
		[NetTotalAfterDisc]           [float] NULL,
		[MainUOM]                     [varchar](20) COLLATE Arabic_CI_AS NULL,
		[MainUOMConversion]           [float] NULL,
		[MainUOMQty]                  [float] NULL,
		[MainUOMAmount]               [float] NULL,
		[CurrencyID]                  [varchar](20) COLLATE Arabic_CI_AS NULL,
		[ExchangeRate]                [float] NULL,
		[MainCurrencyID]              [varchar](20) COLLATE Arabic_CI_AS NULL,
		[MainCurrencyCostTotal]       [float] NULL,
		[MainCurrencyCostPerUnit]     [float] NULL,
		[DelivaryAddress]             [varchar](255) COLLATE Arabic_CI_AS NULL,
		[SiteID]                      [varchar](20) COLLATE Arabic_CI_AS NULL,
		[StoreID]                     [varchar](20) COLLATE Arabic_CI_AS NULL,
		[LocationID]                  [varchar](20) COLLATE Arabic_CI_AS NULL,
		[RackID]                      [varchar](20) COLLATE Arabic_CI_AS NULL,
		[ShelfID]                     [varchar](20) COLLATE Arabic_CI_AS NULL,
		[BinID]                       [varchar](20) COLLATE Arabic_CI_AS NULL,
		[BatchID]                     [varchar](20) COLLATE Arabic_CI_AS NULL,
		[Dim1ID]                      [varchar](20) COLLATE Arabic_CI_AS NULL,
		[Dim2ID]                      [varchar](20) COLLATE Arabic_CI_AS NULL,
		[Dim3ID]                      [varchar](20) COLLATE Arabic_CI_AS NULL,
		[Dim4ID]                      [varchar](20) COLLATE Arabic_CI_AS NULL,
		[Dim5ID]                      [varchar](20) COLLATE Arabic_CI_AS NULL,
		[CostCenterID]                [varchar](20) COLLATE Arabic_CI_AS NULL,
		[Note]                        [text] COLLATE Arabic_CI_AS NULL,
		[CountingTypeID]              [varchar](20) COLLATE Arabic_CI_AS NULL,
		[CreatedJournal]              [bit] NULL,
		[GUID]                        [uniqueidentifier] NOT NULL,
		[Company]                     [varchar](20) COLLATE Arabic_CI_AS NULL,
		[Retention]                   [float] NULL,
		[Advanced]                    [float] NULL,
		[AdvancedAmount]              [float] NULL,
		[RetentionAmount]             [float] NULL,
		[SalesDeliveryID]             [varchar](20) COLLATE Arabic_CI_AS NULL,
		[VendorRate]                  [float] NULL,
		[ShipmentNo]                  [varchar](50) COLLATE Arabic_CI_AS NULL,
		[TaxCode]                     [varchar](20) COLLATE Arabic_CI_AS NULL,
		[AmountIncludingTax]          [float] NULL,
		[TaxPercent]                  [float] NULL,
		[NetTotalExclTax]             [float] NULL,
		[Calculatethisuser  ]         [varchar](20) COLLATE Arabic_CI_AS NULL,
		CONSTRAINT [PK_frweInvoiceTrans]
		PRIMARY KEY
		CLUSTERED
		([eSalesInvoiceID], [VoucherSeq])
	ON [PRIMARY]
)
GO
ALTER TABLE [dbo].[frweInvoiceTrans]
	ADD
	CONSTRAINT [DF_frweInvoiceTrans_GUID]
	DEFAULT (newid()) FOR [GUID]
GO
ALTER TABLE [dbo].[frweInvoiceTrans]
	WITH CHECK
	ADD CONSTRAINT [FK_frweInvoiceTrans_frweInvoice]
	FOREIGN KEY ([eSalesInvoiceID]) REFERENCES [dbo].[frweInvoice] ([eSalesInvoiceID])
	ON UPDATE CASCADE
ALTER TABLE [dbo].[frweInvoiceTrans]
	CHECK CONSTRAINT [FK_frweInvoiceTrans_frweInvoice]

GO
ALTER TABLE [dbo].[frweInvoiceTrans] SET (LOCK_ESCALATION = TABLE)
GO

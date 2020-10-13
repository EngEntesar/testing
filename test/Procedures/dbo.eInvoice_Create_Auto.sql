SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[eInvoice_Create_Auto] 
	 @GUID AS UNIQUEIDENTIFIER
AS
BEGIN

DECLARE @InvoiceCount        INT
DECLARE @InvoiceCreated      INT
DECLARE @SalesInvoiceDate	 datetime	
DECLARE	@ErrorMessage		 VARCHAR(255)
DECLARE	@eSalesInvoiceID	 VARCHAR(20)	 

 
SELECT  @InvoiceCount=count(*) FROM FrweInvoice 
SELECT  @SalesInvoiceDate=MAX(SalesInvoiceDate) FROM FrweInvoice 
SELECT  @InvoiceCreated=COUNT(*) FROM FrweInvoice WHERE SalesInvoiceStatusID='Created'
    
IF @InvoiceCount=0 
	 BEGIN
		RAISERROR('Please Contact us to for activation invoice',18,1)
	END
 IF @InvoiceCreated>0
   BEGIN
              SET @ErrorMessage ='More than one invoice created '+CAST(@InvoiceCreated AS varchar(20))

	   			RAISERROR(@ErrorMessage,18,1)
                
				PRINT  @InvoiceCreated
		  
   END
 ELSE  
    BEGIN
	select @eSalesInvoiceID=CompanyID+'|'+Cast(Counter+1  as varchar(20)) from FrweInvoiceCounter
--#####################  Fetch the last invoive header start

INSERT INTO FrweInvoice
(eSalesInvoiceID, SalesInvoiceDate, CustID, CustContactID, CustPostingProfileID, SalesOrderID, CurrencyID, DocumentReference, DocumentDate, CustPaymentMethodID, SalesInvoiceDueDate, 
SalesInvoiceStatusID, SiteID, StoreID, Note, CreatedDate, CreatedUSer, Dim1ID, Dim2ID, Dim3ID, Dim4ID, Dim5ID, CostCenterID, SalesManID, GUID, ServiceID, ReSellerID, Company, JournalIDTarget, ContractID, 
Advanced, retention, BillingType, CustAdvancedPostingProfileID, CustretentionPostingProfileID, RetentionAmount, AdvancedAmount, ContractAmount, ContractType, NetTotalExclTax, Email, Tel, DataBaseName, 
CompanyName, CompanyID, Description, DescriptionAr, NetTotalBeforeDisc, 
                         DiscountTotal, NetTotalAfterDisc,PaidPeriod,FromDate,ToDate)
 

SELECT        @eSalesInvoiceID AS Expr1, GETDATE() AS Expr2, CustID, CustContactID, CustPostingProfileID, SalesOrderID, CurrencyID, DocumentReference, DocumentDate, CustPaymentMethodID, SalesInvoiceDueDate, 
                         'Created' AS Expr6, SiteID, StoreID, Note, GETDATE() AS Expr3, SYSTEM_USER AS Expr4, Dim1ID, Dim2ID, Dim3ID, Dim4ID, Dim5ID, CostCenterID, SalesManID, NEWID() AS Expr5, ServiceID, ReSellerID, 
                         Company, JournalIDTarget, ContractID, Advanced, retention, BillingType, CustAdvancedPostingProfileID, CustretentionPostingProfileID, RetentionAmount, AdvancedAmount, ContractAmount, ContractType, 
                         NetTotalExclTax, Email, Tel, DataBaseName, CompanyName, CompanyID, 'E-invoice number  ' + @eSalesInvoiceID AS Expr7, 'فاتورة الكترونية رقم    ' + @eSalesInvoiceID AS Expr8, NetTotalBeforeDisc, 
                         DiscountTotal, NetTotalAfterDisc,PaidPeriod,dateadd(DAY,1,ToDate),dateadd(DAY,DATEDIFF(DAY,FromDate,ToDate),ToDate)
FROM            FrweInvoice WHERE SalesInvoiceDate=@SalesInvoiceDate

--#####################  Fetch the last invoive header end
--#####################  Fetch the last invoive trans start
INSERT INTO FrweInvoiceTrans
                         (eSalesInvoiceID, VoucherSeq, SalesOrderID, ProductID, Description, DescriptionAr, Qty, AvailableQTY, ReturnQty, UOMID, Amount, NetTotalBeforeDisc, DiscountTypeID, DiscountValue, Discount, 
                         DiscountPerUnit, NetTotalAfterDisc, MainUOM, MainUOMConversion, MainUOMQty, MainUOMAmount, CurrencyID, ExchangeRate, MainCurrencyID, MainCurrencyCostTotal, MainCurrencyCostPerUnit, 
                         DelivaryAddress, SiteID, StoreID, LocationID, RackID, ShelfID, BinID, BatchID, Dim1ID, Dim2ID, Dim3ID, Dim4ID, Dim5ID, CostCenterID, Note, CountingTypeID, CreatedJournal, GUID, Company, Retention, 
                         Advanced, AdvancedAmount, RetentionAmount, SalesDeliveryID, VendorRate, ShipmentNo, TaxCode, AmountIncludingTax, TaxPercent, NetTotalExclTax, [Calculatethisuser  ])
 


SELECT        @eSalesInvoiceID AS Expr1, FrweInvoiceTrans.VoucherSeq AS Expr26, FrweInvoiceTrans.SalesOrderID AS Expr27, FrweInvoiceTrans.ProductID, FrweInvoiceTrans.Description AS Expr28, 
                         FrweInvoiceTrans.DescriptionAr AS Expr29, FrweInvoiceTrans.Qty, FrweInvoiceTrans.AvailableQTY, FrweInvoiceTrans.ReturnQty, FrweInvoiceTrans.UOMID, FrweInvoiceTrans.Amount, 
                         FrweInvoiceTrans.NetTotalBeforeDisc AS Expr30, FrweInvoiceTrans.DiscountTypeID, FrweInvoiceTrans.DiscountValue, FrweInvoiceTrans.Discount, FrweInvoiceTrans.DiscountPerUnit, 
                         FrweInvoiceTrans.NetTotalAfterDisc AS Expr31, FrweInvoiceTrans.MainUOM, FrweInvoiceTrans.MainUOMConversion, FrweInvoiceTrans.MainUOMQty, FrweInvoiceTrans.MainUOMAmount, 
                         FrweInvoiceTrans.CurrencyID AS Expr32, FrweInvoiceTrans.ExchangeRate, FrweInvoiceTrans.MainCurrencyID, FrweInvoiceTrans.MainCurrencyCostTotal, FrweInvoiceTrans.MainCurrencyCostPerUnit, 
                         FrweInvoiceTrans.DelivaryAddress, FrweInvoiceTrans.SiteID AS Expr33, FrweInvoiceTrans.StoreID AS Expr34, FrweInvoiceTrans.LocationID, FrweInvoiceTrans.RackID, FrweInvoiceTrans.ShelfID, 
                         FrweInvoiceTrans.BinID, FrweInvoiceTrans.BatchID, FrweInvoiceTrans.Dim1ID AS Expr35, FrweInvoiceTrans.Dim2ID AS Expr36, FrweInvoiceTrans.Dim3ID AS Expr37, FrweInvoiceTrans.Dim4ID AS Expr38, 
                         FrweInvoiceTrans.Dim5ID AS Expr39, FrweInvoiceTrans.CostCenterID AS Expr40, FrweInvoiceTrans.Note AS Expr41, FrweInvoiceTrans.CountingTypeID, FrweInvoiceTrans.CreatedJournal, NEWID() AS Expr2, 
                         FrweInvoiceTrans.Company AS Expr42, FrweInvoiceTrans.Retention AS Expr43, FrweInvoiceTrans.Advanced AS Expr44, FrweInvoiceTrans.AdvancedAmount AS Expr45, 
                         FrweInvoiceTrans.RetentionAmount AS Expr46, FrweInvoiceTrans.SalesDeliveryID, FrweInvoiceTrans.VendorRate, FrweInvoiceTrans.ShipmentNo AS Expr47, FrweInvoiceTrans.TaxCode, 
                         FrweInvoiceTrans.AmountIncludingTax, FrweInvoiceTrans.TaxPercent, FrweInvoiceTrans.NetTotalExclTax AS Expr48, FrweInvoiceTrans.[Calculatethisuser  ]
FROM            FrweInvoiceTrans INNER JOIN
                         FrweInvoice ON FrweInvoiceTrans.eSalesInvoiceID = FrweInvoice.eSalesInvoiceID
WHERE        (FrweInvoice.SalesInvoiceDate = @SalesInvoiceDate)

 declare @countitem as integer
       ,@amountbefor   as float
	   ,@amountafter as float

   select @countitem = count(*),@amountbefor=sum(NetTotalBeforeDisc),@amountafter =sum(NetTotalAfterDisc) from FrweInvoiceTrans where eSalesInvoiceID = @eSalesInvoiceID

   update FrweInvoice 
     set ItemsCount = @countitem
		 ,NetTotalAfterDisc = @amountafter
		 ,NetTotalBeforeDisc = @amountbefor 
		 , Description ='eInvoice #'+eSalesInvoiceID
                 , DescriptionAr =eSalesInvoiceID+'فاتورة الكترونية رقم '
	  	 where eSalesInvoiceID = @eSalesInvoiceID 

--#####################  Fetch the last invoive header end


   END
  
 END   


GO

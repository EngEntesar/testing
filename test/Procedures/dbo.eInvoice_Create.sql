SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[eInvoice_Create] 
	@GUID AS UNIQUEIDENTIFIER
AS
BEGIN

DECLARE @InvoiceCount        INT
DECLARE @InvoiceCreated      INT
DECLARE @SalesInvoiceDate	 datetime	
DECLARE	@ErrorMessage		 VARCHAR(255)
DECLARE	@eSalesInvoiceID	 VARCHAR(20)	
DECLARE	@FROMDate	         datetime	 
DECLARE	@ToDate	             datetime	  
DECLARE @countitem          INT
DECLARE @amountbefor         FLOAT
DECLARE @amountafter         FLOAT
DECLARE @PaidPeriod	         FLOAT	 

--#############################################################################

 SELECT @eSalesInvoiceID = eSalesInvoiceID 
 ,@FROMDate	   = FROMDate      	 
 ,@ToDate      = ToDate 
 FROM frweInvoice
  WHERE GUID = @GUID 
--############################## Validation 
  IF @FROMDate IS NULL 
   Raiserror('Please enter FROM Date ',18,1) 
     IF @ToDate IS NULL 
   Raiserror('Please enter To Date',18,1) 

     IF @ToDate< @FROMDate  
	 BEGIN
         Raiserror('From date more than To Date',18,1) 

    	END
--############################## Validation 

 IF (LEFT(@eSalesInvoiceID,3) = '***' OR  LEFT(@eSalesInvoiceID,3) = '___')
		BEGIN
			 SELECT @eSalesInvoiceID=CompanyID+'|'+Cast(Counter+1  as VARCHAR(20)) FROM frweInvoiceCounter
			 UPDATE frweInvoice 
			   SET eSalesInvoiceID=@eSalesInvoiceID 
			   WHERE GUID=@GUID 
		END
 

	SELECT @eSalesInvoiceID = eSalesInvoiceID  
	FROM frweInvoice 
	WHERE GUID = @GUID 




 
    UPDATE frweInvoiceTrans 
	   SET NetTotalBeforeDisc= ISNULL(Qty,0)*ISNULL(Amount,0),
		   NetTotalAfterDisc = ISNULL(Qty,0)*ISNULL(Amount,0)
		   WHERE eSalesInvoiceID like @eSalesInvoiceID 


   SELECT @countitem = COUNT(*),@amountbefor=SUM(NetTotalBeforeDisc),@amountafter =SUM(NetTotalAfterDisc) 
   
   FROM frweInvoiceTrans WHERE eSalesInvoiceID = @eSalesInvoiceID



   UPDATE frweInvoice 
     SET   ItemsCount = @countitem
		 , NetTotalAfterDisc = @amountafter--*ISNULL(ROUND(DATEDIFF(d,@FROMDate,@ToDate)/CONVERT(decimal(4,2), 30),1),0)
		 --SUM(Child(FrweInvoiceTrans).[NetTotalAfterDisc])
		 , NetTotalBeforeDisc = @amountbefor 

		 , Description ='eInvoice #'+eSalesInvoiceID
         , DescriptionAr =eSalesInvoiceID+'فاتورة الكترونية رقم '
		 , PaidPeriod    = ROUND(DATEDIFF(d,@FROMDate,@ToDate)/CONVERT(decimal(4,2), 30),1)
	 
	 WHERE GUID = @GUID



SELECT @PaidPeriod=PaidPeriod FROM frweInvoice	WHERE GUID = @GUID


--DECLARE @X VARCHAR(20)
--SET @X=CAST(@PaidPeriod AS VARCHAR(20))
--RAISERROR(@X,18,1)



 UPDATE frweInvoice 
     SET   
		   NetTotalAfterDisc = @amountafter*@PaidPeriod
		 
	 
	 WHERE GUID = @GUID


--#####################   


    
  
 END   



 




GO

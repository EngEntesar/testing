SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[eInvoice_Pay] 
 @GUID AS UNIQUEIDENTIFIER
AS
BEGIN


	Declare 
	 @Object_Date	 as datetime,
	 @User_Name		 as varchar(150),
	 @Comments		 as varchar(250),
	 @Approval_Status as varchar(250),
	 @Sequence		 as  int,
	 @Request_Time	 as datetime,
	 @Sent			 as bit,
	 @Approval_TypeID as int ,
	 @Requester		  as varchar(150),
	 @mobile		  as varchar(20),
	 @email			  as varchar(250),
	 @subject		  as varchar(250),
	 @message		  as varchar(1000),
	 @newuser		  as varchar(150),
	 @login		  as varchar(150),
	 @password		  as varchar(150),
	 @dbName		  as varchar(200),
	 @GroupName		  as varchar(200),
	 @GroupID		  as integer	 ,
	 @Tel			  as varchar(40)	,
	 @comapny		 as varchar(160)	,
	 @messageEmail		  as varchar(1000),	
	 @messageMobile		  as varchar(1000),
	 @erpname			as varchar(100)   ,
	 @ErrorMassage     as varchar(250)	  ,
	 @language			as varchar(20)  ,
	 @InvoiceID			as varchar(20) ,
	 @Report			as varchar(250)


  select  @comapny = CompanyName,@InvoiceID=eSalesInvoiceID from FrweInvoice
   where GUID = @GUID 

   UPDATE FrweInvoice SET SalesInvoiceStatusID='Paid' where GUID = @GUID 
    

	set @subject = 'VisualERP Cloud Paid'
	 
	 
	 
	  set @messageEmail = 'Dear : Account Manager <br> <br>
	  The Customer : '+@comapny+' is paid Invoice Number : '+@InvoiceID+' by Visa Card
	  ' 
	    
     set @email = 'khatib.a@visualsoft.com'
	 set @Tel = '0504963570'
	 
	 set  @Report = 'eInvoice Status;'+cast(@GUID as  varchar(max))
	  
	 

	 EXECUTE VisualERP_Web.DBO.frwSendEmail  @email,@subject,@messageEmail,@Report
	 EXECUTE VisualERP_Web.dbo.frwSendSMS @Tel,@subject,@messageEmail -- @messageMobile
	  

 END   

GO

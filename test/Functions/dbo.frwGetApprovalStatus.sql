SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO







CREATE FUNCTION [dbo].[frwGetApprovalStatus] (@GUID uniqueidentifier)
RETURNS varchar(20)
AS
BEGIN
	-- Declare the return variable here
	Declare @Result1 varchar(20);
	Declare @Result2 varchar(20);
	Declare @Result3 varchar(20);
	Declare @Status varchar(20);

--	set @Status = 'Not Configured'
       
		 SELECT @Result1 = Approval_Status  FROM [frwApprovals] where  [AdHoc]=0 And [Object_GUID] like @GUID
         If @Result1 is null set @Status =  'Not Required'
         Else
		  begin
                
				SELECT @Result2 = Approval_Status  FROM [frwApproval_Approved] where [Object_GUID] like @GUID
                If @Result2 is null
				  begin
                    SELECT @Result3 = Approval_Status  FROM [frwApprovals] where [Object_GUID] like @GUID and Approval_Status like 'Rejected' and AdHoc=0
                    If @Result3 is null   set @Status =  'Waiting'  Else  set @Status =  'Rejected'
                  end
                
				Else set @Status =  'Approved'
		   end
	
	Return @Status
END







GO

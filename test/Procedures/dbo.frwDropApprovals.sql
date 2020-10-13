SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[frwDropApprovals]
	-- Add the parameters for the stored procedure here
	@strGUID uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
DECLARE @TableName varchar(255)
DECLARE @FieldName varchar(255)
DECLARE @constraintID varchar(255)
select @constraintID=newid()

select @TableName=TableName from frwNewTables where [GUID]=@strGUID
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
drop Table [@TableName]

CREATE TABLE [@TableName](
	[GUID] [uniqueidentifier] ROWGUIDCOL  NULL CONSTRAINT newid  DEFAULT (newid()),
	[@FieldName] [varchar](50) NOT NULL,
 CONSTRAINT [@constraintID] PRIMARY KEY CLUSTERED 
(
	[@FieldName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

END



GO

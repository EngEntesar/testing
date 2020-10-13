SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[frwInsertTabs]
@TableName varchar(255)
AS
BEGIN

Delete from frwtabs where [object] like ''+ @TableName +''

insert into frwTabs (TabName,Object,HasDataFetch,HasMandatory)
select distinct TabName,Object,1,0 from frwDefinitions where (left([Formula],1) = '?' or isnull([Default],'') <>'' or Control ='AutoNumber')  and  ([OBJECT] like ''+ @TableName +'')

insert into frwTabs (TabName,Object,HasDataFetch,HasMandatory)
select distinct TabName,Object,0,0 from frwDefinitions where TabName+Object not in (select distinct TabName+Object from frwTabs)   and    ([OBJECT] like ''+ @TableName +'')

update frwTabs set HasMandatory =0 where  ([OBJECT] like ''+ @TableName +'');

update frwTabs set HasMandatory =1 where  TabName+[Object] in (select distinct TabName+[Object] from frwDefinitions where   [Control] <>'CheckBox' and   IsNull(Enabled,1)=1 and  IsNull(Invisible,0)=0 and IsNull(Mandatory,0)=1  and [OBJECT] like ''+ @TableName +''); 


END
GO

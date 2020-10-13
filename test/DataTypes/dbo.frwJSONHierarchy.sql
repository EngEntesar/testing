CREATE TYPE [dbo].[frwJSONHierarchy]
AS TABLE (
		[element_id]      [int] NOT NULL,
		[sequenceNo]      [int] NULL,
		[parent_ID]       [int] NULL,
		[Object_ID]       [int] NULL,
		[NAME]            [nvarchar](2000) COLLATE Arabic_CI_AS NULL,
		[StringValue]     [nvarchar](max) COLLATE Arabic_CI_AS NOT NULL,
		[ValueType]       [varchar](10) COLLATE Arabic_CI_AS NOT NULL,
	PRIMARY KEY CLUSTERED 
(
	[element_id]
)
WITH (IGNORE_DUP_KEY = OFF)
)
GO

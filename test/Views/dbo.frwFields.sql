SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[frwFields]
AS
SELECT TOP (100) PERCENT CAST((sys.objects.name + '.' + sys.columns.name) COLLATE Arabic_CI_AS AS varchar(MAX)) AS Field, CAST(sys.objects.name COLLATE Arabic_CI_AS AS varchar(MAX)) AS name, sys.columns.column_id, sys.columns.is_nullable, 
             sys.columns.is_identity, sys.types.name AS DataType, sys.columns.max_length, sys.objects.type AS ObjectType, CAST(sys.columns.name COLLATE Arabic_CI_AS AS varchar(MAX)) AS FieldName, sys.objects.type_desc
FROM   sys.columns with (nolock) INNER JOIN
             sys.objects with (nolock) ON sys.columns.object_id = sys.objects.object_id INNER JOIN
             sys.types with (nolock) ON sys.columns.user_type_id = sys.types.user_type_id
ORDER BY sys.columns.column_id

GO

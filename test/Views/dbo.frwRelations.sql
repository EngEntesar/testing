SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[frwRelations]
AS
SELECT     PObjects.name AS PTable, PColumns.name AS PField, RObjects.name AS RTable, RColumns.name AS RField
FROM         sys.columns AS PColumns INNER JOIN
                      sys.objects AS PObjects ON PColumns.object_id = PObjects.object_id INNER JOIN
                      sys.foreign_key_columns ON PColumns.object_id = sys.foreign_key_columns.parent_object_id AND 
                      PColumns.column_id = sys.foreign_key_columns.parent_column_id INNER JOIN
                      sys.columns AS RColumns ON sys.foreign_key_columns.referenced_object_id = RColumns.object_id AND 
                      sys.foreign_key_columns.referenced_column_id = RColumns.column_id INNER JOIN
                      sys.objects AS RObjects ON RColumns.object_id = RObjects.object_id



GO

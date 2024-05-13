USE [FarmaciaSarRodriguez]
GO

ALTER TABLE [dbo].[Detalles_Venta] DROP CONSTRAINT [FK_Detalles_Venta_Ventas]
GO

ALTER TABLE [dbo].[Detalles_Venta]  WITH CHECK ADD  CONSTRAINT [FK_Detalles_Venta_Ventas] FOREIGN KEY([ID_Venta])
REFERENCES [dbo].[Ventas] ([ID_Venta])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Detalles_Venta] CHECK CONSTRAINT [FK_Detalles_Venta_Ventas]
GO

SELECT 
   OBJECT_NAME(f.parent_object_id) AS 'Table name',
   COL_NAME(fc.parent_object_id,fc.parent_column_id) AS 'Field name',
   delete_referential_action_desc AS 'On Delete'
FROM sys.foreign_keys AS f,
     sys.foreign_key_columns AS fc,
     sys.tables t 
WHERE f.OBJECT_ID = fc.constraint_object_id
AND t.OBJECT_ID = fc.referenced_object_id
ORDER BY 1

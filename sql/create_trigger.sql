USE EmpresaDB;
GO

CREATE TRIGGER trg_AuditarVenta
ON Ventas
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
    
    DECLARE @VentaID INT;

    DECLARE cur_ventas CURSOR LOCAL FAST_FORWARD FOR
        SELECT VentaID FROM inserted;

    OPEN cur_ventas;
    FETCH NEXT FROM cur_ventas INTO @VentaID;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        EXEC sp_RegistrarAuditoria @VentaID;
        FETCH NEXT FROM cur_ventas INTO @VentaID;
    END;

    CLOSE cur_ventas;
    DEALLOCATE cur_ventas;
END;
GO

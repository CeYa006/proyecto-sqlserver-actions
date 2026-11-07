USE EmpresaDB;
GO

CREATE PROCEDURE sp_RegistrarAuditoria
    @VentaID INT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO AuditoriaVentas (VentaID, Mensaje)
    VALUES (@VentaID, 'Venta registrada e inventario actualizado automáticamente');

    UPDATE inv
    SET inv.Existencias = inv.Existencias - v.Cantidad
    FROM Inventario inv
    INNER JOIN Ventas v ON inv.Producto = v.Producto
    WHERE v.VentaID = @VentaID;
END;
GO

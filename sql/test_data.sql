USE EmpresaDB;
GO

INSERT INTO Ventas (Producto, Cantidad) VALUES ('Laptop', 3);
INSERT INTO Ventas (Producto, Cantidad) VALUES ('Monitor', 5);

INSERT INTO Ventas (Producto, Cantidad) VALUES 
('Laptop', 2),
('Teclado', 10),
('Monitor', 1);
GO

SELECT * FROM Ventas;
SELECT * FROM AuditoriaVentas;
SELECT * FROM Inventario;
GO

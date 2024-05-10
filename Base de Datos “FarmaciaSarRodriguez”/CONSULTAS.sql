-- 1) Nombre y direcci�n de todos los clientes.
SELECT Nombre, Apellido, Direccion FROM clientes;

-- 2) Nombre y cargo de todos los empleados.
SELECT Nombre, Apellido, Cargo FROM Empleados;

-- 3) Nombre y precio de todos los productos.
SELECT Nombre, Precio FROM Productos;

-- 4) Nombres y direcciones de todos los proveedores.
select Nombre as Proveedor, Dirección
from Proveedores

-- 5) Fecha y total de todas las ventas.
select CONCAT ('Venta Nº', ID_Venta, ' -  ', Fecha) as 'Fechas por ventas', Total as Totales
from Ventas

-- 6) Total de ventas por empleado.
select COUNT(V.ID_Venta) as 'Total Ventas', CONCAT (E.Nombre, ' ' , E.Apellido) as Empleado
from Ventas V
right join Empleados E on V.ID_Empleado = E.ID_Empleado
group by CONCAT (E.Nombre, ' ' , E.Apellido)
order by COUNT (V.ID_venta) desc

--7) Número de ventas por cliente.
SELECT c.Nombre AS NombreCliente,
COUNT(v.ID_Venta) AS NumeroVentas
FROM Ventas v
INNER JOIN Clientes c ON v.ID_Cliente = c.ID_Cliente
GROUP BY c.Nombre

--8) Productos con el mayor y menor precio.
SELECT Nombre, Precio FROM Productos
WHERE Precio = (SELECT MAX(Precio) FROM Productos)
OR Precio = (SELECT MIN(Precio) FROM Productos);

--9) Total de compras por proveedor.
SELECT p.Nombre AS NombreProveedor,
SUM(c.Total) AS TotalCompras
FROM Compras c
INNER JOIN Proveedores p ON c.ID_Proveedor = p.ID_Proveedor
GROUP BY p.Nombre;

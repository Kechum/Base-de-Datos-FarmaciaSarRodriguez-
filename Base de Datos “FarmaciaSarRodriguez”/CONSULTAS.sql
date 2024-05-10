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

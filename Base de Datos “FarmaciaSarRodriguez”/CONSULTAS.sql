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
SELECT CONCAT(c.Nombre, ' ', c.Apellido) AS NombreCliente,
COUNT(v.ID_Venta) AS NumeroVentas
FROM Ventas v
LEFT JOIN Clientes c ON v.ID_Cliente = c.ID_Cliente
GROUP BY CONCAT(c.Nombre, ' ', c.Apellido), c.Nombre, c.Apellido;


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

SELECT p.Nombre AS NombreProveedor,
COUNT(c.ID_Compra) AS CantidadCompras
FROM Compras c
INNER JOIN Proveedores p ON c.ID_Proveedor = p.ID_Proveedor
GROUP BY p.Nombre;

--10) Cantidad de productos por categoría.
select CP.Nombre as Categoria, count(P.ID_Productos) as 'Cantidad de Productos'from Productos P
right join Productos_Categoria PC on PC.ID_Producto = P.ID_Productos
right join Categoria_Productos CP on CP.ID_Categoria = PC.ID_Categorias
group by CP.Nombre
order by count(P.ID_Productos) desc;

--11) Nombre del cliente que ha gastado más en una sola compra.
select Top 1 CONCAT (C.Nombre, ' ' , C.Apellido) As 'Cliente Que Mas gastos en una sola compra realizo'
from Ventas V
right join clientes C on V.ID_Cliente = C.ID_Cliente
group by CONCAT (C.Nombre, ' ' , C.Apellido)
order by Sum(V.Total) desc;

--12) Cantidad de productos comprados por cliente en una fecha específica.
Select CONCAT (C.Nombre, ' ' , C.Apellido) As Cliente,
		count(dv.Id_Producto) as 'Productos Comprados',
		sum(dv.Cantidad) as 'Total de Productos comprados' 
from Ventas V
right Join clientes C on V.ID_Cliente = C.ID_Cliente
right Join Detalles_Venta DV on V.ID_Venta = Dv.ID_Venta
where V.Fecha = '2024-04-25'
group by CONCAT (C.Nombre, ' ' , C.Apellido) 

--13) Productos que han sido comprados más de una vez.
select P.Nombre,
		count (dv.Id_Producto) as 'Nº de Veces',
		sum(dv.Cantidad) as 'Total de comprado' 
from Productos P
left join Detalles_Venta DV on P.ID_Productos = DV.Id_Producto
group by p.Nombre
having count(dv.Id_Producto) > 1

--14) Cantidad de ventas realizadas por mes.
SELECT MONTH(Fecha) AS Mes,
       COUNT(ID_Venta) AS TotalVentas
FROM Ventas
GROUP BY MONTH(Fecha);
--15) Nombre de cliente, empleado y total de venta ordenado por fecha de ventas
SELECT v.Fecha AS FechaVenta,
       CONCAT(c.Nombre, ' ', c.Apellido) AS NombreCliente,
       CONCAT(e.Nombre, ' ', e.Apellido) AS NombreEmpleado,
       v.Total AS TotalVenta
FROM Ventas v
JOIN Clientes c ON v.ID_Cliente = c.ID_Cliente
JOIN Empleados e ON v.ID_Empleado = e.ID_Empleado
ORDER BY v.Fecha;

--16) Supongamos que queremos actualizar los salarios de todos los empleados en la tabla "Empleados" aumentando su salario en un 10% si están en un departamento específico, digamos 'Vendedor'.
(Intentar posibilidad de usar Subconsulta IN para obtener Vendedores)
UPDATE Empleados
SET Salario = Salario * 1.10
WHERE ID_Empleado IN (
    SELECT ID_Empleado
    FROM Empleados
    WHERE Cargo = 'Vendedor'
);

SELECT e.Nombre AS NombreEmpleado, e.Salario
FROM Empleados e
WHERE e.Cargo = 'Vendedor';

--17) Eliminar ventas antiguas y sus detalles asociados (Es decir, eliminar registros de 2 tablas en simultáneo)..
--Se deben borrar aquellas ventas ocurridas antes del 1ro de Mayo.
Delete from Ventas where Fecha < '2024-05-01'

--18) Incrementar el stock de un producto X.
SELECT ID_Productos, Nombre, Stock
FROM Productos;


UPDATE Productos
SET Stock = Stock + 10 
WHERE ID_Productos = 1; 

--19) UPDATE para actualizar la categoría de un producto X.
insert into Categoria_Productos (ID_Categoria, Nombre) Values (21, 'Antipiretico')

Update Productos_Categoria
set ID_Categorias = (
		select ID_Categoria
		from Categoria_Productos
		where Nombre like 'antipire%'
)
where ID_Producto = 1



--20) Realizar esta serie de Consultas relacionadas:
   --   a) Insertar una venta para el Cliente 3, realizada por el Empleado 2, 
	  --en la fecha actual (usar función específica) y por un total de 125.00

insert into Ventas (ID_Venta,ID_Cliente,ID_Empleado,Fecha,Total)
values (21,3,2, GETDATE(),125.00)

 --b) Supongamos que la venta fue de 10u. de Paracetamol y 10u. de Ibuprofeno.
 --         IMPORTANTE: para obtener el ID_Venta, Precio_Unitario y Subtotal, 
	--	  intentar realizar las consultas dentro del mismo INSERT..

--Paracetamol
insert into Detalles_Venta (ID_Detalle,ID_Venta,Id_Producto,Cantidad,Precio_Unitario,Subtotal)
values (21,21, (select ID_Productos from Productos where Nombre like 'Paracetamol'),10,
(select Precio from Productos P where Nombre like 'Paracetamol'), 
10 * (select Precio From Productos where Nombre like 'Paracetamol'));

--Ibuprofeno
insert into Detalles_Venta (ID_Detalle,ID_Venta,Id_Producto,Cantidad,Precio_Unitario,Subtotal)
values (22,21, (select ID_Productos from Productos where Nombre like 'Ibuprofeno'),10,
(select Precio from Productos P where Nombre like 'Ibuprofeno'), 
10 * (select Precio From Productos where Nombre like 'Ibuprofeno'));

select * from Ventas
select * from Detalles_Venta

-- c) Actualizar el Stock de los Productos anteriormente vendidos.
  -- IMPORTANTE: Realizar un solo UPDATE para los 2 Productos.

  UPDATE Productos
  SET Stock = Stock - 10
  WHERE ID_Productos IN (
     SELECT ID_Productos
     FROM Productos
	 WHERE Nombre IN ('Paracetamol', 'Ibuprofeno')
);

SELECT Nombre, Stock FROM Productos
WHERE Nombre IN ('Paracetamol', 'Ibuprofeno');



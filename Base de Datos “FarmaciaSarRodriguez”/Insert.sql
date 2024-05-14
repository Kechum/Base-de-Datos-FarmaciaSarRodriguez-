--Insert into clientes (ID_Cliente,Nombre,Apellido,Direccion,Telefono)
--Values 
--(1, 'Juan', 'Pérez', 'Calle Falsa 123, Buenos Aires', '+54 9 11 2345-6789'),
--(2, 'María', 'López', 'Avenida Siempreviva 456, Córdoba', '+54 9 351 9876-5432'),
--(3, 'Carlos', 'García', 'Ruta del Sol 789, Rosario', '+54 9 341 3456-7890'),
--(4, 'Laura', 'Martínez', 'Paseo de la Luna 101, Mendoza', '+54 9 261 4567-8901'),
--(5, 'Alejandro', 'Rodríguez', 'Camino de las Estrellas 202, Tucumán', '+54 9 381 5678-9012'),
--(6, 'Ana', 'Sánchez', 'Vía Láctea 303, Mar del Plata', '+54 9 223 6789-0123'),
--(7, 'Luis', 'Hernández', 'Sendero del Amanecer 404, Salta', '+54 9 387 7890-1234'),
--(8, 'Sofía', 'Díaz', 'Boulevard del Crepúsculo 505, Bariloche', '+54 9 294 8901-2345'),
--(9, 'Pablo', 'Torres', 'Avenida del Río 606, Santa Fe', '+54 9 342 9012-3456'),
--(10, 'Marta', 'González', 'Calle de la Montaña 707, La Plata', '+54 9 221 0123-4567'),
--(11, 'David', 'Romero', 'Parque del Oeste 808, Neuquén', '+54 9 299 1234-5678'),
--(12, 'Elena', 'García', 'Jardines del Este 909, Corrientes', '+54 9 378 2345-6789'),
--(13, 'Javier', 'Ruiz', 'Alameda del Sur 110, Posadas', '+54 9 376 3456-7890'),
--(14, 'Laura', 'López', 'Plaza Central 111, Paraná', '+54 9 343 4567-8901'),
--(15, 'María', 'Martin', 'Avenida de los Pioneros 112, Resistencia', '+54 9 362 5678-9012'),
--(16, 'Carlos', 'Sánchez', 'Camino Antiguo 113, San Juan', '+54 9 264 6789-0123'),
--(17, 'Andrea', 'Pérez', 'Rincón del Bosque 114, San Luis', '+54 9 265 7890-1234'),
--(18, 'Juan', 'Díaz', 'Bulevar de los Sueños 115, Santiago del Estero', '+54 9 385 8901-2345'),
--(19, 'Elena', 'Torres', 'Avenida de la Paz 116, Santa Cruz', '+54 9 2966 9012-3456'),
--(20, 'Luisa', 'González', 'Calle del Lago 117, San Miguel de Tucumán', '+54 9 381 0123-4567');

--Insert into Empleados (ID_Empleado,Nombre,Apellido,Cargo,Salario)
--Values 
--(1, 'Lionel', 'Scaloni', 'Gerente', 3000.00),
--(2, 'Walter', 'Samuel', 'Vendedor', 2000.00),
--(3, 'Pablo', 'Aimar', 'Cajero', 1800.00),
--(4, 'Lionel', 'Messi', 'Farmacéutico', 2500.00),
--(5, 'Emiliano', 'Martinez', 'Almacenero', 1700.00),
--(6, 'Nicolás', 'Tagliafico', 'Vendedor', 1900.00),
--(7, 'Nicolás', 'Otamendi', 'Cajero', 1850.00),
--(8, 'Nahuel', 'Molina', 'Almacenero', 1750.00),
--(9, 'Gonzalo', 'Montiel', 'Vendedor', 1950.00),
--(10, 'Cuti', 'Romero', 'Cajero', 1825.00),
--(11, 'Leandro', 'Paredes', 'Gerente', 3100.00),
--(12, 'Kevin', 'MacCalister', 'Vendedor', 1975.00),
--(13, 'Rodrigo', 'De Paul', 'Cajero', 1860.00),
--(14, 'Ángel', 'Dí María', 'Farmacéutico', 2550.00),
--(15, 'Julián', 'Álvarez', 'Almacenero', 1725.00),
--(16, 'Lautaro', 'Martínez', 'Vendedor', 1925.00),
--(17, 'Juan', 'Foyth', 'Cajero', 1875.00),
--(18, 'Diego', 'Maradona', 'Almacenero', 1765.00),
--(19, 'Juan Román', 'Riquelme', 'Vendedor', 1935.00),
--(20, 'Martín', 'Palermo', 'Cajero', 1885.00);

----Select * from clientes

----Select * from Empleados

--INSERT INTO Productos (ID_Productos, Nombre, Descripcion, Precio,Stock)
--VALUES 
--(1, 'Paracetamol', 'Analgésico', 5.00, 100),
--(2, 'Ibuprofeno', 'Antiinflamatorio', 7.50, 80),
--(3, 'Amoxicilina', 'Antibiótico', 10.00, 50),
--(4, 'Omeprazol', 'Inhibidor de la bomba de protón', 15.00, 60),
--(5, 'Loratadina', 'Antihistamínico', 8.00, 70),
--(6, 'Dipirona', 'Analgésico', 6.00, 90),
--(7, 'Cetirizina', 'Antihistamínico', 9.00, 65),
--(8, 'Eritromicina', 'Antibiótico', 12.00, 40),
--(9, 'Pantoprazol', 'Inhibidor de la bomba de protón', 17.00, 55),
--(10, 'Diclofenaco', 'Antiinflamatorio', 6.50, 75),
--(11, 'Metformina', 'Hipoglucemiante', 11.00, 85),
--(12, 'Atorvastatina', 'Hipolipemiante', 14.50, 65),
--(13, 'Sertralina', 'Antidepresivo', 9.50, 70),
--(14, 'Amlodipino', 'Antihipertensivo', 13.00, 60),
--(15, 'Levotiroxina', 'Hormona tiroidea', 8.50, 50),
--(16, 'Prednisona', 'Corticosteroide', 11.50, 45),
--(17, 'Lorazepam', 'Ansiolítico', 10.50, 40),
--(18, 'Paroxetina', 'Antidepresivo', 12.50, 55),
--(19, 'Simvastatina', 'Hipolipemiante', 15.50, 60),
--(20, 'Ciprofloxacino', 'Antibiótico', 13.50, 70);


--INSERT INTO Proveedores (ID_Proveedor, Nombre, Dirección, Teléfono)
--VALUES
--(1, 'PharmaCorp', 'Avenida de la Salud 123', '2281 000-0001'),
--(2, 'MedFarma', 'Boulevard del Bienestar 456', '2281 000-0002'),
--(3, 'SaluVida', 'Calle de la Esperanza 789', '2281 000-0003'),
--(4, 'FarmaGen', 'Paseo de los Remedios 147', '2281 000-0004'),
--(5, 'Saludable', 'Ronda de la Vida 258', '2281 000-0005'),
--(6, 'Farmatodo', 'Camino del Descanso 369', '2281 000-0006'),
--(7, 'BioFarm', 'Ruta de la Naturaleza 321', '2281 000-0007'),
--(8, 'VitaSalud', 'Vía de la Vitalidad 654', '2281 000-0008'),
--(9, 'PharmaNet', 'Sendero de la Innovación 987', '2281 000-0009'),
--(10, 'Farmacias A&Z', 'Avenida del Progreso 159', '2281 000-0010'),
--(11, 'Salud Total', 'Calle del Futuro 753', '2281 000-0011'),
--(12, 'CuidaFarma', 'Boulevard de la Prevención 852', '2281 000-0012'),
--(13, 'NaturaFarm', 'Paseo de la Tierra 951', '2281 000-0013'),
--(14, 'Salud Viva', 'Ronda del Amanecer 357', '2281 000-0014'),
--(15, 'BioVital', 'Camino de la Energía 456', '2281 000-0015'),
--(16, 'FarmaBella', 'Ruta de la Belleza 258', '2281 000-0016'),
--(17, 'Bienestar SA', 'Vía del Confort 159', '2281 000-0017'),
--(18, 'VidaSana', 'Sendero de la Armonía 753', '2281 000-0018'),
--(19, 'PharmaWell', 'Avenida de la Paz 852', '2281 000-0019'),
--(20, 'Farmax', 'Calle de la Innovación 951', '2281 000-0020');

--INSERT INTO Ventas (ID_Venta, ID_Cliente, ID_Empleado, Fecha, Total)
--VALUES
--(1, 2, 2, '2024-04-25', 45.00),
--(2, 3, 1, '2024-04-25', 32.50),
--(3, 1, 4, '2024-04-26', 27.00),
--(4, 5, 3, '2024-04-26', 15.00),
--(5, 4, 2, '2024-04-27', 50.00),
--(6, 6, 5, '2024-04-27', 35.00),
--(7, 7, 3, '2024-04-28', 42.50),
--(8, 8, 1, '2024-04-28', 55.00),
--(9, 9, 4, '2024-04-29', 38.00),
--(10, 10, 2, '2024-04-29', 20.00),
--(11, 11, 5, '2024-04-30', 47.50),
--(12, 12, 3, '2024-04-30', 60.00),
--(13, 13, 1, '2024-05-01', 72.00),
--(14, 14, 4, '2024-05-01', 29.00),
--(15, 15, 2, '2024-05-02', 35.50),
--(16, 16, 5, '2024-05-02', 45.00),
--(17, 17, 3, '2024-05-03', 51.00),
--(18, 18, 1, '2024-05-03', 63.50),
--(19, 19, 4, '2024-05-04', 40.00),
--(20, 20, 2, '2024-05-04', 22.50);

--INSERT INTO Detalles_Venta (ID_Detalle, ID_Venta, Id_Producto, Cantidad, Precio_Unitario, Subtotal)
--VALUES
--(1, 1, 1, 2, 5.00, 10.00),
--(2, 1, 3, 1, 10.00, 10.00),
--(3, 2, 2, 3, 7.50, 22.50),
--(4, 3, 4, 2, 15.00, 30.00),
--(5, 4, 5, 1, 8.00, 8.00),
--(6, 5, 1, 5, 5.00, 25.00),
--(7, 6, 3, 4, 10.00, 40.00),
--(8, 7, 2, 2, 7.50, 15.00),
--(9, 8, 4, 3, 15.00, 45.00),
--(10, 9, 5, 2, 8.00, 16.00),
--(11, 10, 1, 1, 5.00, 5.00),
--(12, 11, 2, 4, 7.50, 30.00),
--(13, 12, 3, 5, 10.00, 50.00),
--(14, 13, 4, 6, 15.00, 90.00),
--(15, 14, 5, 3, 8.00, 24.00),
--(16, 15, 1, 2, 5.00, 10.00),
--(17, 16, 2, 1, 7.50, 7.50),
--(18, 17, 3, 4, 10.00, 40.00),
--(19, 18, 4, 3, 15.00, 45.00),
--(20, 19, 5, 2, 8.00, 16.00);

--SELECT * FROM Detalles_Venta

--INSERT INTO Categoria_Productos
--VALUES
--(1, 'Analgésicos'),
--(2, 'Antibióticos'),
--(3, 'Antihistamínicos'),
--(4, 'Antiinflamatorios'),
--(5, 'Hormonales'),
--(6, 'Cardiovasculares'),
--(7, 'Psicotrópicos'),
--(8, 'Gastrointestinales'),
--(9, 'Dermatológicos'),
--(10, 'Antidepresivos'),
--(11, 'Anticonceptivos'),
--(12, 'Antineoplásicos'),
--(13, 'Antimicóticos'),
--(14, 'Antivirales'),
--(15, 'Antiepilépticos'),
--(16, 'Antiparasitarios'),
--(17, 'Antitrombóticos'),
--(18, 'Antidiabéticos'),
--(19, 'Antitússicos'),
--(20, 'Anestésicos');

Insert into Productos_Categoria (ID_Producto,ID_Categorias)
values 
(1, 1),
(2, 4),
(3, 2),
(4, 8),
(5, 3),
(6, 1),
(7, 3),
(8, 2),
(9, 8),
(10, 4),
(11, 5),
(12, 6),
(13, 10),
(14, 6),
(15, 5),
(16, 7),
(17, 7),
(18, 10),
(19, 8),
(20, 4);

insert into Compras (ID_Compra,ID_Proveedor,ID_empleado,Fecha,Total)
Values
(1, 1, 2, '2024-04-25', 150.00),
(2, 2, 3, '2024-04-25', 200.00),
(3, 3, 4, '2024-04-26', 80.00),
(4, 4, 1, '2024-04-26', 120.00),
(5, 5, 2, '2024-04-27', 90.00),
(6, 6, 5, '2024-04-27', 135.00),
(7, 7, 3, '2024-04-28', 95.00),
(8, 8, 1, '2024-04-28', 180.00),
(9, 9, 4, '2024-04-29', 105.00),
(10, 10, 2, '2024-04-29', 70.00),
(11, 11, 5, '2024-04-30', 130.00),
(12, 12, 3, '2024-04-30', 150.00),
(13, 13, 1, '2024-05-01', 75.00),
(14, 14, 4, '2024-05-01', 85.00),
(15, 15, 2, '2024-05-02', 110.00),
(16, 16, 5, '2024-05-02', 120.00),
(17, 17, 3, '2024-05-03', 95.00),
(18, 18, 1, '2024-05-03', 145.00),
(19, 19, 4, '2024-05-04', 100.00),
(20, 20, 2, '2024-05-04', 65.00);

insert into Detalles_Compra (ID_DetalleCompra,ID_Compra,ID_Producto,Cantidad,Precio_Unitario,Subtotal)
values
(1, 1, 1, 20, 4.00, 80.00),
(2, 1, 2, 15, 6.00, 90.00),
(3, 2, 3, 10, 8.00, 80.00),
(4, 3, 4, 5, 14.00, 70.00),
(5, 4, 5, 8, 7.00, 56.00),
(6, 5, 1, 25, 3.50, 87.50),
(7, 6, 3, 20, 8.00, 160.00),
(8, 7, 2, 10, 7.50, 75.00),
(9, 8, 4, 6, 15.00, 90.00),
(10, 9, 5, 10, 8.00, 80.00),
(11, 10, 1, 5, 5.00, 25.00),
(12, 11, 2, 15, 7.50, 112.50),
(13, 12, 3, 12, 10.00, 120.00),
(14, 13, 4, 5, 15.00, 75.00),
(15, 14, 5, 7, 8.00, 56.00),
(16, 15, 1, 8, 4.00, 32.00),
(17, 16, 2, 6, 7.50, 45.00),
(18, 17, 3, 10, 10.00, 100.00),
(19, 18, 4, 8, 15.00, 120.00),
(20, 19, 5, 6, 8.00, 48.00);

select* from Productos_Categoria
select *from Compras
select*from Detalles_Compra
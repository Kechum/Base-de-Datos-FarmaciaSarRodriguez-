--INSERT ESCUELAS 
INSERT INTO escuelas (nombre) VALUES
('Escuela 28'),
('Escuela 1'),
('Escuela 501'),
('Escuela 11'),
('Escuela 2'),
('Velloso y Crotto');

--INSERT COBERTURA 
INSERT INTO cobertura (nombre)
VALUES 
    ('OSDE'),
    ('Swiss Medical'),
    ('Galeno'),
    ('Medifé'),
    ('Sancor Salud'),
    ('IOMA'),
    ('OSECAC'),
    ('PAMI');


--INSERT TABLA DE NIÑOS 

INSERT INTO niños (nombre, apellido, domicilio, celular, DNI, sexo, fecha_nacimiento, idCobertura, idEscuela)
VALUES
('Ana', 'García', 'Av. Siempre Viva 742', '987654321', '87654321', 'F', '2014-08-15', 2, (SELECT idEscuela FROM escuelas WHERE nombre = 'Escuela 2')),
('Luis', 'Martínez', 'Calle Elm 198', '555555555', '55555555', 'M', '2013-12-01', 3, (SELECT idEscuela FROM escuelas WHERE nombre = 'Escuela 501')),
('María', 'López', 'Calle Luna 999', '444444444', '44444444', 'F', '2012-04-10', 4, (SELECT idEscuela FROM escuelas WHERE nombre = 'Escuela 11')),
('Pedro', 'González', 'Calle Sol 333', '333333333', '33333333', 'M', '2016-03-05', 5, (SELECT idEscuela FROM escuelas WHERE nombre = 'Velloso y Crotto')),
('Carla', 'Fernández', 'Av. Las Rosas 567', '234567890', '23456789', 'F', '2013-07-22', 6, (SELECT idEscuela FROM escuelas WHERE nombre = 'Escuela 28')),
('Diego', 'Ramírez', 'Calle Los Álamos 678', '345678901', '34567890', 'M', '2015-11-13', 7, (SELECT idEscuela FROM escuelas WHERE nombre = 'Escuela 1')),
('Lucía', 'Torres', 'Av. Los Pinos 789', '456789012', '45678901', 'F', '2014-03-05', 8, (SELECT idEscuela FROM escuelas WHERE nombre = 'Escuela 2')),
('Martín', 'González', 'Calle Falsa 123', '567890123', '56789012', 'M', '2015-09-25', 1, (SELECT idEscuela FROM escuelas WHERE nombre = 'Escuela 501')),
('Sofía', 'Gómez', 'Av. Siempre Viva 742', '678901234', '67890123', 'F', '2014-01-30', 2, (SELECT idEscuela FROM escuelas WHERE nombre = 'Escuela 11')),
('Nicolás', 'Pérez', 'Calle Elm 198', '789012345', '78901234', 'M', '2013-10-18', 3, (SELECT idEscuela FROM escuelas WHERE nombre = 'Velloso y Crotto')),
('Valeria', 'López', 'Calle Luna 999', '890123456', '89012345', 'F', '2012-05-09', 4, (SELECT idEscuela FROM escuelas WHERE nombre = 'Escuela 28')),
('Santiago', 'Martínez', 'Calle Sol 333', '901234567', '90123456', 'M', '2016-08-14', 5, (SELECT idEscuela FROM escuelas WHERE nombre = 'Escuela 1')),
('Paula', 'Fernández', 'Av. Las Rosas 567', '012345678', '01234567', 'F', '2013-02-23', 6, (SELECT idEscuela FROM escuelas WHERE nombre = 'Escuela 2')),
('Jorge', 'Ramírez', 'Calle Los Álamos 678', '123456789', '12345678', 'M', '2015-07-07', 7, (SELECT idEscuela FROM escuelas WHERE nombre = 'Escuela 501')),
('Laura', 'Torres', 'Av. Los Pinos 789', '234567890', '23456789', 'F', '2014-12-19', 8, (SELECT idEscuela FROM escuelas WHERE nombre = 'Escuela 11')),
('Ricardo', 'González', 'Calle Falsa 123', '345678901', '34567890', 'M', '2015-04-04', 1, (SELECT idEscuela FROM escuelas WHERE nombre = 'Velloso y Crotto')),
('Camila', 'Gómez', 'Av. Siempre Viva 742', '456789012', '45678901', 'F', '2014-06-16', 2, (SELECT idEscuela FROM escuelas WHERE nombre = 'Escuela 28')),
('Andrés', 'Pérez', 'Calle Elm 198', '567890123', '56789012', 'M', '2013-09-20', 3, (SELECT idEscuela FROM escuelas WHERE nombre = 'Escuela 1')),
('Verónica', 'López', 'Calle Luna 999', '678901234', '67890123', 'F', '2012-11-11', 4, (SELECT idEscuela FROM escuelas WHERE nombre = 'Escuela 2')),
('Carolina', 'Saenz', 'Calle mitre 359', '789012345', '78901234', 'F', '2014-1-19', 1, (SELECT idEscuela FROM escuelas WHERE nombre = 'Escuela 28'));



--INSERT TABLA VACUNACION
INSERT INTO vacunacion (estado, aplicacion, indicacion, idNiño_a)
VALUES
    ('completo', 1, 0, 1),
    ('incompleto', 0, 1, 2),
    ('completo', 1, 0, 3),
    ('incompleto', 0, 1, 4),
    ('completo', 1, 0, 5),
    ('incompleto', 0, 1, 6),
    ('completo', 1, 0, 7),
    ('incompleto', 0, 1, 8),
    ('completo', 1, 0, 9),
    ('incompleto', 0, 1, 10),
    ('completo', 1, 0, 11),
    ('incompleto', 0, 1, 12),
    ('completo', 1, 0, 13),
    ('incompleto', 0, 1, 14),
    ('completo', 1, 0, 15),
    ('incompleto', 0, 1, 16),
    ('completo', 1, 0, 17),
    ('incompleto', 0, 1, 18),
    ('completo', 1, 0, 19),
    ('incompleto', 0, 1, 20);


--INSERT TABLA EVALUACION ANTROPOMETRICA
INSERT INTO detalle_evaluacionAntropometrico (Peso, Talla, IMC, Percentilo)
VALUES
    (44, 1.37, 23.45, 100),
    (62, 1.69, 21.70, 99),
    (21.350, 1.11, 17.32, 88),
    (23.950, 1.25, 15.32, 28),
    (20, 1.12, 15.94, 66),
    (21.600, 1.16, 45.06, 68),
    (39.850, 1.30, 23.57, 100),
    (20.700, 1.13, 16.21, 72),
    (59.600, 1.41, 29.97, 100),
    (46.200, 1.59, 18.27, 94),
    (25.500, 1.15, 19.28, 97),
    (18.900, 1.12, 45.09, 40),
    (28.900, 1.13, 45.09, 100),
    (34.605, 1.32, 45.17, 98),
    (23, 1.18, 45.06, 78),
    (22.400, 1.21, 45.00, 47),
    (21.900, 1.17, 15.99, 67),
    (31, 1.24, 20.16, 99),
    (21.650, 1.20, 14.78, 39),
    (33.300, 1.22, 22.37, 100),
    (50.600, 1.59, 44.96, 98);
	

--INSERT TABLA PRESION ARTERIAL
INSERT INTO detalle_presionArterial (Pas, Pad, descripcion)
VALUES
    (90, 50, 'NORMAL 1'),
    (90, 50, 'NORMAL 1'),
    (90, 50, 'NORMAL 1'),
    (90, 50, 'NORMAL 1'),
    (90, 50, 'NORMAL 1'),
    (100, 50, 'NORMAL 1'),
    (90, 50, 'NORMAL 1'),
    (80, 50, 'NORMAL 1'),
    (110, 60, 'NORMAL 1'),
    (120, 70, 'NORMAL 2'),
    (100, 50, 'NORMAL 1'),
    (80, 50, 'NORMAL 1'),
    (100, 50, 'NORMAL 1'),
    (100, 60, 'NORMAL 1'),
    (90, 50, 'NORMAL 1'),
    (80, 40, 'NORMAL 1'),
    (90, 60, 'NORMAL 1'),
    (80, 50, 'NORMAL 1'),
    (90, 50, 'NORMAL 1'),
    (100, 50, 'NORMAL 1'),
    (80, 50, 'NORMAL 1');

--INSERT TABLA AGUDEZA VISUAL
INSERT INTO detalle_agudezaVisual (UsaLentes, OjoIzquierdo, OjoDerecho)
VALUES
    (1, 9, 9),
    (0, 7, 8),
    (1, 7, 10),
    (0, 9, 9),
    (1, 8, 7),
    (0, 9, 9),
    (1, 6, 7),
    (0, 7, 6),
    (1, 7, 7),
    (0, 8, 8), 
    (1, 10, 10),
    (0, 10, 7), 
    (1, 10, 9), 
    (0, 9, 8),
    (1, 10, 10), 
    (0, 9, 10), 
    (1, 9, 10),
    (0, 8, 9),
    (1, 10, 9), 
    (0, 9, 9),
    (1, 10, 10);

--INSERT DETALLE DE PIEL 
INSERT INTO detalle_piel (conHallazgos, descripcion)
VALUES
    (1, 'Nevos con criterio de derivación (Asimetría, bordes, color, diámetro, evolución)'),
    (0, NULL),
    (1, 'Escabiosis'),
    (1, 'Piodermitis'),
    (1, 'Pediculosis'),
    (0, NULL),
    (1, 'OTROS'),
    (0, NULL),
    (1, 'Nevos con criterio de derivación (Asimetría, bordes, color, diámetro, evolución)'),
    (1, 'Escabiosis'),
    (0, NULL),
    (1, 'Piodermitis'),
    (0, NULL),
    (1, 'Pediculosis'),
    (0, NULL),
    (1, 'OTROS'),
    (1, 'Nevos con criterio de derivación (Asimetría, bordes, color, diámetro, evolución)'),
    (0, NULL),
    (1, 'Escabiosis'),
    (0, NULL);

--INSERT TABLA DETALLES PARTES BLANDAS
INSERT INTO detalle_partesBlandas (conHallazgos, descripcion)
VALUES
    (1, 'Adenomegalia localizada'),
    (1, 'Ademomegalias generalizadas'),
    (1, 'Otros'),
    (0, NULL),
    (0, NULL),
    (0, NULL),
    (0, NULL),
    (0, NULL),
    (1, 'Adenomegalia localizada'),
    (1, 'Ademomegalias generalizadas'),
    (1, 'Otros'),
    (0, NULL),
    (0, NULL),
    (0, NULL),
    (0, NULL),
    (0, NULL),
    (1, 'Adenomegalia localizada'),
    (1, 'Ademomegalias generalizadas'),
    (1, 'Otros');

INSERT INTO detalle_partesBlandas (conHallazgos, descripcion)
VALUES
    (1, 'Adenomegalia localizada');

SELECT * FROM detalle_partesBlandas

--INSERT DETALLE RESPIRATORIO
INSERT INTO detalle_respiratorio (conHallazgos, descripcion)
VALUES
    (1, 'Hallazgos auscultatorios'),
    (1, 'Respiración bucal'),
    (1, 'Otros'),
    (0, NULL),
    (0, NULL),
    (0, NULL),
    (0, NULL),
    (0, NULL),
    (1, 'Hallazgos auscultatorios'),
    (1, 'Respiración bucal'),
    (1, 'Otros'),
    (0, NULL),
    (0, NULL),
    (0, NULL),
    (0, NULL),
    (0, NULL),
    (1, 'Hallazgos auscultatorios'),
    (1, 'Respiración bucal'),
    (1, 'Otros');

INSERT INTO detalle_respiratorio (conHallazgos, descripcion)
VALUES
    (1, 'Respiración bucal');

SELECT * FROM detalle_respiratorio;

--INSERT REGISTROS TABLA DETALLE ABDOMINAL 
INSERT INTO detalle_abdominal (conHallazgos, descripcion)
VALUES
    (1, 'Hepatomegalía'),
    (1, 'Masa palpable'),
    (1, 'Esplenomegalia'),
    (1, 'Hernias'),
    (0, 'Otros'),
    (1, 'Hepatomegalía'),
    (1, 'Masa palpable'),
    (1, 'Esplenomegalia'),
    (1, 'Hernias'),
    (0, 'Otros'),
    (1, 'Hepatomegalía'),
    (1, 'Masa palpable'),
    (1, 'Esplenomegalia'),
    (1, 'Hernias'),
    (0, 'Otros'),
    (1, 'Hepatomegalía'),
    (1, 'Masa palpable'),
    (1, 'Esplenomegalia'),
    (1, 'Hernias'),
    (0, 'Otros');

SELECT * FROM detalle_abdominal

--INSERT REGISTROS TABLA OSTEOARTICULAR
INSERT INTO detalle_osteoarticular (conHallazgos, descripcion)
VALUES
    (1, 'Maniobra de Adams positiva'),
    (1, 'Alteraciones de la marcha'),
    (0, NULL),
    (1, 'Maniobra de Adams positiva'),
    (1, 'Alteraciones de la marcha'),
    (0, NULL),
    (1, 'Maniobra de Adams positiva'),
    (1, 'Alteraciones de la marcha'),
    (0, NULL),
    (1, 'Maniobra de Adams positiva'),
    (1, 'Alteraciones de la marcha'),
    (0, NULL),
    (1, 'Maniobra de Adams positiva'),
    (1, 'Alteraciones de la marcha'),
    (0, NULL),
    (1, 'Maniobra de Adams positiva'),
    (1, 'Alteraciones de la marcha'),
    (0, NULL),
    (1, 'Maniobra de Adams positiva'),
    (0, NULL);

SELECT * FROM detalle_osteoarticular

--INSERT REGISTROS DETALLE NEUROLOGICO
INSERT INTO detalle_neurologico (conHallazgos, descripcion)
VALUES
    (1, 'Paresias o signos focales'),
    (1, 'Movimientos anormales'),
    (0, NULL), 
    (1, 'Paresias o signos focales'),
    (0, NULL),
    (1, 'Movimientos anormales'),
    (0, NULL),
    (1, 'Paresias o signos focales'),
    (1, 'Movimientos anormales'),
    (0, NULL),
    (1, 'Paresias o signos focales'),
    (1, 'Movimientos anormales'),
    (0, NULL), 
    (1, 'Paresias o signos focales'),
    (0, NULL),
    (1, 'Movimientos anormales'),
    (0, NULL), 
    (1, 'Paresias o signos focales'),
    (1, 'Movimientos anormales'),
    (0, NULL); 

SELECT * FROM detalle_neurologico

--INSERT REGISTROS DETALLE VISUAL
INSERT INTO detalle_visual (conHallazgos, descripcion)
VALUES
    (1, 'Disminución de la agudeza visual'),
    (1, 'Estrabismo'),
    (0, NULL), 
    (1, 'Posición anormal de la cabeza'),
    (1, 'Alteraciones del ojo externo'),
    (1, 'Disminución de la agudeza visual'),
    (0, NULL),
    (1, 'Estrabismo'),
    (0, NULL),
    (1, 'Posición anormal de la cabeza'),
    (1, 'Alteraciones del ojo externo'),
    (0, NULL), 
    (1, 'Disminución de la agudeza visual'),
    (1, 'Estrabismo'),
    (1, 'Posición anormal de la cabeza'),
    (0, NULL),
    (1, 'Alteraciones del ojo externo'),
    (1, 'Disminución de la agudeza visual'),
    (1, 'Estrabismo'),
    (1, 'Posición anormal de la cabeza');

SELECT * FROM detalle_visual

--INSERT REGISTRO MEDICOS
INSERT INTO medico (nombre, apellido, matricula)
VALUES
    ('Juan', 'González', '18935 MP'),
    ('María', 'Martínez', '452368 MP'),
    ('Pedro', 'Fernández', '25845 MP'),
    ('Ana', 'López', '123987 MN'),
    ('Diego', 'Rodríguez', '14789 MP'),
    ('Laura', 'Gómez', '245987 MN'),
    ('Carlos', 'Pérez', '157747 MP'),
    ('Sofía', 'Díaz', '25463 MN'),
    ('Javier', 'Hernández', '456654 MN'),
    ('Valeria', 'Sánchez', '110235 MP'),
    ('Pablo', 'Ramírez', '235800 MP'),
    ('Lucía', 'Torres', '23512 MN'),
    ('Martín', 'Flores', '130258 MP'),
    ('Cecilia', 'Acosta', '58614 MP'),
    ('Fernando', 'Rojas', '569995 MN'),
    ('Camila', 'Molina', '568888 MP'),
    ('Andrés', 'Suárez', '170222 MP'),
    ('Carolina', 'Gutiérrez', '85666 MN'),
    ('Gustavo', 'Jiménez', '256357 MP'),
    ('Romina', 'Vargas', '10025 MN');

SELECT * FROM medico

--INSERT REGISTROS TABLA CONTROLES 
INSERT INTO controles (idNiño_a, evaluacionAntropometricoId, idPresionArterial, agudezaVisualId, fechaControl, idMedicoResponsable)
VALUES
    (1, 1, 1, 1, '2024-01-15', 1),
    (2, 2, 2, 2, '2024-01-16', 2),
    (3, 3, 3, 3, '2024-01-17', 3),
    (4, 4, 4, 4, '2024-01-18', 4),
    (5, 5, 5, 5, '2024-01-19', 5),
    (6, 6, 6, 6, '2024-01-20', 6),
    (7, 7, 7, 7, '2024-01-21', 7),
    (8, 8, 8, 8, '2024-01-22', 8),
    (9, 9, 9, 9, '2024-01-23', 9),
    (10, 10, 10, 10, '2024-01-24', 10),
    (11, 11, 11, 11, '2024-01-25', 11),
    (12, 12, 12, 12, '2024-01-26', 12),
    (13, 13, 13, 13, '2024-01-27', 13),
    (14, 14, 14, 14, '2024-01-28', 14),
    (15, 15, 15, 15, '2024-01-29', 15),
    (16, 16, 16, 16, '2024-01-30', 16),
    (17, 17, 17, 17, '2024-01-31', 17),
    (18, 18, 18, 18, '2024-02-01', 18),
    (19, 19, 19, 19, '2024-02-02', 19),
    (20, 20, 20, 20, '2024-02-03', 20);

SELECT *FROM controles

--INSTER REGISTROS TABLA HALLAZGOS CLINICOS 
INSERT INTO hallazgos_clinicos (idNiño_a, pielId, partesBlandasId, respiratorioId, abdominalId, osteoarticularId, neurologicoId, visualId)
VALUES
    (1, 1, 1, 1, 1, 1, 1, 1),
    (2, 2, 2, 2, 2, 2, 2, 2),
    (3, 3, 3, 3, 3, 3, 3, 3),
    (4, 4, 4, 4, 4, 4, 4, 4),
    (5, 5, 5, 5, 5, 5, 5, 5),
    (6, 6, 6, 6, 6, 6, 6, 6),
    (7, 7, 7, 7, 7, 7, 7, 7),
    (8, 8, 8, 8, 8, 8, 8, 8),
    (9, 9, 9, 9, 9, 9, 9, 9),
    (10, 10, 10, 10, 10, 10, 10, 10),
    (11, 11, 11, 11, 11, 11, 11, 11),
    (12, 12, 12, 12, 12, 12, 12, 12),
    (13, 13, 13, 13, 13, 13, 13, 13),
    (14, 14, 14, 14, 14, 14, 14, 14),
    (15, 15, 15, 15, 15, 15, 15, 15),
    (16, 16, 16, 16, 16, 16, 16, 16),
    (17, 17, 17, 17, 17, 17, 17, 17),
    (18, 18, 18, 18, 18, 18, 18, 18),
    (19, 19, 19, 19, 19, 19, 19, 19),
    (20, 20, 20, 20, 20, 20, 20, 20);

	SELECT * FROM hallazgos_clinicos



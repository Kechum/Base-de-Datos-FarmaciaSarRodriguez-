--INSERT TABLA NIÑO CON SP
DECLARE @idNiño INT;

EXEC sp_InsertarNiñoConCobertura 
    @nombre = 'Lucas', 
    @apellido = 'Fernández', 
    @domicilio = 'Calle Falsa 123', 
    @celular = '123456789', 
    @numero_documento = '12345678', 
    @sexo = 'M', 
    @fecha_nacimiento = '2015-04-22', 
    @idCobertura = 3, -- Galeno
    @nombre_escuela = 'Escuela 501', 
    @idNiño_a = @idNiño OUTPUT;

PRINT 'Nuevo niño insertado correctamente con ID: ' + CAST(@idNiño AS NVARCHAR(50));

-- INSERT TABLA VACUNACION CON SP
EXEC sp_InsertarVacunacion 
    @idNiño_a = 21,
    @estado = 'completo',
    @aplicacion = 1,
    @indicacion = 0;

--INSERT SP INSERTAR HALLAZGO SI HUBO 
EXEC sp_InsertarHallazgoSiHubo
    @idNiño_a = 2,
    @fecha_hallazgo = '2024-06-22',
    @conHallazgosPiel = 1,
    @descripcionPiel = 'Erupción cutánea en el brazo derecho.',
    @conHallazgosPartesBlandas = 0,
    @descripcionPartesBlandas = NULL,
    @conHallazgosRespiratorio = 1,
    @descripcionRespiratorio = 'Sibilancias al respirar.',
    @conHallazgosAbdominal = 0,
    @descripcionAbdominal = NULL,
    @conHallazgosOsteoarticular = 1,
    @descripcionOsteoarticular = 'Dolor en la rodilla izquierda.',
    @conHallazgosNeurologico = 0,
    @descripcionNeurologico = NULL,
    @conHallazgosVisual = 1,
    @descripcionVisual = 'Dificultad para ver de cerca.'


--INSERT SP INSERTAR CONTROL 
EXEC sp_InsertarControl 
    @idNiño_a = 3, -- ID del niño
    @fecha_control = '2024-06-20', -- Fecha del control
    @evaluacionAntropometricoId = 4, -- ID de evaluación antropométrica
    @idPresionArterial = 2, -- ID de presión arterial
    @agudezaVisualId = 3, -- ID de agudeza visual
    @idMedicoResponsable = 10; -- ID del médico responsable

	SELECT * FROM controles

--CONSULTA SP CANTIDAD DE NIÑOS POR ESCUELA
EXEC sp_CantidadNiñosPorEdadPorEscuela

--CONSULTA SP VACUNACION COMPLETA NIÑOS POR ESCUELA 
EXEC sp_ListaNiñosVacunacionCompletaPorEscuela

--CONSULTA SP DETALLES CONTROL MEDICO POR ESCUELA
DECLARE @idEscuela INT = 2; -- ID DE ESCUELA A CONSULTAR
EXEC sp_DetallesControlMedicoNiñoPorEscuela @idEscuela;

--CONSULTA SP HALLAZGO CLINICO POR ESCUELA
DECLARE @idEscuela INT = 2; -- ID DE ESCUELA A CONSULTAR 
EXEC sp_HallazgosClinicosNiñoPorEscuela @idEscuela;

--SP ELIMINAR CONTROL POR FECHA 
DECLARE @idHallazgo INT = 61; -- ID del hallazgo clínico que deseas eliminar
EXEC sp_EliminarHallazgo @idHallazgo;

SELECT * FROM hallazgos_clinicos


--SP ACTUALIZAR COBERTURA
DECLARE @idNiño_a INT = 1;  -- Reemplaza con el ID del niño
DECLARE @nuevaCoberturaId INT = 6;  -- Reemplaza con el nuevo ID de cobertura

EXEC sp_ActualizarCobertura @idNiño_a, @nuevaCoberturaId;

SELECT * FROM NIÑOS

--SP ACTUALIZAR ESCUELA NIÑOS
DECLARE @idNiño_a INT = 1;  -- Reemplaza con el ID del niño
DECLARE @nuevoIdEscuela INT = 1;  -- Reemplaza con el nuevo ID de la escuela

EXEC sp_ActualizarEscuelaNiño @idNiño_a, @nuevoIdEscuela;

SELECT * FROM NIÑOS
--INSERT TABLA NI�O CON SP
DECLARE @idNi�o INT;

EXEC sp_InsertarNi�oConCobertura 
    @nombre = 'Lucas', 
    @apellido = 'Fern�ndez', 
    @domicilio = 'Calle Falsa 123', 
    @celular = '123456789', 
    @numero_documento = '12345678', 
    @sexo = 'M', 
    @fecha_nacimiento = '2015-04-22', 
    @idCobertura = 3, -- Galeno
    @nombre_escuela = 'Escuela 501', 
    @idNi�o_a = @idNi�o OUTPUT;

PRINT 'Nuevo ni�o insertado correctamente con ID: ' + CAST(@idNi�o AS NVARCHAR(50));

-- INSERT TABLA VACUNACION CON SP
EXEC sp_InsertarVacunacion 
    @idNi�o_a = 21,
    @estado = 'completo',
    @aplicacion = 1,
    @indicacion = 0;

--INSERT SP INSERTAR HALLAZGO SI HUBO 
EXEC sp_InsertarHallazgoSiHubo
    @idNi�o_a = 2,
    @fecha_hallazgo = '2024-06-22',
    @conHallazgosPiel = 1,
    @descripcionPiel = 'Erupci�n cut�nea en el brazo derecho.',
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
    @idNi�o_a = 3, -- ID del ni�o
    @fecha_control = '2024-06-20', -- Fecha del control
    @evaluacionAntropometricoId = 4, -- ID de evaluaci�n antropom�trica
    @idPresionArterial = 2, -- ID de presi�n arterial
    @agudezaVisualId = 3, -- ID de agudeza visual
    @idMedicoResponsable = 10; -- ID del m�dico responsable

	SELECT * FROM controles

--CONSULTA SP CANTIDAD DE NI�OS POR ESCUELA
EXEC sp_CantidadNi�osPorEdadPorEscuela

--CONSULTA SP VACUNACION COMPLETA NI�OS POR ESCUELA 
EXEC sp_ListaNi�osVacunacionCompletaPorEscuela

--CONSULTA SP DETALLES CONTROL MEDICO POR ESCUELA
DECLARE @idEscuela INT = 2; -- ID DE ESCUELA A CONSULTAR
EXEC sp_DetallesControlMedicoNi�oPorEscuela @idEscuela;

--CONSULTA SP HALLAZGO CLINICO POR ESCUELA
DECLARE @idEscuela INT = 2; -- ID DE ESCUELA A CONSULTAR 
EXEC sp_HallazgosClinicosNi�oPorEscuela @idEscuela;

--SP ELIMINAR CONTROL POR FECHA 
DECLARE @idHallazgo INT = 61; -- ID del hallazgo cl�nico que deseas eliminar
EXEC sp_EliminarHallazgo @idHallazgo;

SELECT * FROM hallazgos_clinicos


--SP ACTUALIZAR COBERTURA
DECLARE @idNi�o_a INT = 1;  -- Reemplaza con el ID del ni�o
DECLARE @nuevaCoberturaId INT = 6;  -- Reemplaza con el nuevo ID de cobertura

EXEC sp_ActualizarCobertura @idNi�o_a, @nuevaCoberturaId;

SELECT * FROM NI�OS

--SP ACTUALIZAR ESCUELA NI�OS
DECLARE @idNi�o_a INT = 1;  -- Reemplaza con el ID del ni�o
DECLARE @nuevoIdEscuela INT = 1;  -- Reemplaza con el nuevo ID de la escuela

EXEC sp_ActualizarEscuelaNi�o @idNi�o_a, @nuevoIdEscuela;

SELECT * FROM NI�OS
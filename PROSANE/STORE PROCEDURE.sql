-- PROCEDIMIENTOS ALMACENADOS

INSERT
CREATE PROCEDURE sp_InsertarNiñoConCobertura 
(
    @nombre VARCHAR(50),
    @apellido VARCHAR(70),
    @domicilio VARCHAR(255),
    @celular VARCHAR(20),
    @numero_documento VARCHAR(10),
    @sexo CHAR(1),
    @fecha_nacimiento DATE,
    @idCobertura INT,
    @nombre_escuela VARCHAR(100), 
    @idNiño_a INT OUTPUT
)
AS
BEGIN
    DECLARE @escuela_id INT;

    BEGIN TRY
       
        BEGIN TRANSACTION;

			SELECT @escuela_id = idEscuela
			FROM escuelas
			WHERE nombre = @nombre_escuela;

        
			IF @escuela_id IS NULL
			BEGIN
				INSERT INTO escuelas (nombre)
				VALUES (@nombre_escuela);

				SET @escuela_id = SCOPE_IDENTITY();
			END

        
			INSERT INTO NIÑOS (nombre, apellido, domicilio, celular, DNI, sexo, fecha_nacimiento, idCobertura, idEscuela)
			VALUES (@nombre, @apellido, @domicilio, @celular, @numero_documento, @sexo, @fecha_nacimiento, @idCobertura, @escuela_id);

			SET @idNiño_a = SCOPE_IDENTITY();

        
			IF NOT EXISTS (SELECT 1 FROM cobertura WHERE idCobertura = @idCobertura)
			BEGIN
				INSERT INTO cobertura (idCobertura, nombre)
				VALUES (@idCobertura, (SELECT nombre FROM cobertura WHERE idCobertura = @idCobertura));
			END

        
        COMMIT TRANSACTION;

        
        PRINT 'La transacción se completó exitosamente y se insertaron los datos correctamente.';
    END TRY
    BEGIN CATCH
        
        ROLLBACK TRANSACTION;

       
        PRINT 'Ocurrió un error y la transacción fue revertida: ' + ERROR_MESSAGE();

    END CATCH
END;


CREATE PROCEDURE sp_InsertarHallazgoSiHubo
    @idNiño_a INT,
    @fecha_hallazgo DATE,
    @conHallazgosPiel BIT,
    @descripcionPiel VARCHAR(250),
    @conHallazgosPartesBlandas BIT,
    @descripcionPartesBlandas VARCHAR(250),
    @conHallazgosRespiratorio BIT,
    @descripcionRespiratorio VARCHAR(250),
    @conHallazgosAbdominal BIT,
    @descripcionAbdominal VARCHAR(250),
    @conHallazgosOsteoarticular BIT,
    @descripcionOsteoarticular VARCHAR(250),
    @conHallazgosNeurologico BIT,
    @descripcionNeurologico VARCHAR(250),
    @conHallazgosVisual BIT,
    @descripcionVisual VARCHAR(250)
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        
        BEGIN TRANSACTION;

       
        IF @conHallazgosPiel = 1 AND @descripcionPiel IS NOT NULL
        BEGIN
            INSERT INTO detalle_piel  (conHallazgos, descripcion)
            VALUES (1, @descripcionPiel);
        END

       
        IF @conHallazgosPartesBlandas = 1 AND @descripcionPartesBlandas IS NOT NULL
        BEGIN
            INSERT INTO detalle_partesBlandas (conHallazgos, descripcion)
            VALUES (1, @descripcionPartesBlandas);
        END

        
        IF @conHallazgosRespiratorio = 1 AND @descripcionRespiratorio IS NOT NULL
        BEGIN
            INSERT INTO detalle_respiratorio (conHallazgos, descripcion)
            VALUES (1, @descripcionRespiratorio);
        END

        
        IF @conHallazgosAbdominal = 1 AND @descripcionAbdominal IS NOT NULL
        BEGIN
            INSERT INTO detalle_abdominal (conHallazgos, descripcion)
            VALUES (1, @descripcionAbdominal);
        END

        
        IF @conHallazgosOsteoarticular = 1 AND @descripcionOsteoarticular IS NOT NULL
        BEGIN
            INSERT INTO detalle_osteoarticular (conHallazgos, descripcion)
            VALUES (1, @descripcionOsteoarticular);
        END

        
        IF @conHallazgosNeurologico = 1 AND @descripcionNeurologico IS NOT NULL
        BEGIN
            INSERT INTO detalle_neurologico (conHallazgos, descripcion)
            VALUES (1, @descripcionNeurologico);
        END

        
        IF @conHallazgosVisual = 1 AND @descripcionVisual IS NOT NULL
        BEGIN
            INSERT INTO detalle_visual (conHallazgos, descripcion)
            VALUES (1, @descripcionVisual);
        END

        
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        
        ROLLBACK TRANSACTION;
       
    END CATCH;
END;


CREATE PROCEDURE sp_InsertarHallazgoSiHubo
    @idNiño_a INT,
    @fecha_hallazgo DATE,
    @conHallazgosPiel BIT,
    @descripcionPiel VARCHAR(250),
    @conHallazgosPartesBlandas BIT,
    @descripcionPartesBlandas VARCHAR(250),
    @conHallazgosRespiratorio BIT,
    @descripcionRespiratorio VARCHAR(250),
    @conHallazgosAbdominal BIT,
    @descripcionAbdominal VARCHAR(250),
    @conHallazgosOsteoarticular BIT,
    @descripcionOsteoarticular VARCHAR(250),
    @conHallazgosNeurologico BIT,
    @descripcionNeurologico VARCHAR(250),
    @conHallazgosVisual BIT,
    @descripcionVisual VARCHAR(250)
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        BEGIN TRANSACTION;

        -- Inserción en detalle_piel
        IF @conHallazgosPiel = 1 AND @descripcionPiel IS NOT NULL
        BEGIN
            INSERT INTO detalle_piel (conHallazgos, descripcion)
            VALUES (1, @descripcionPiel);
        END

        -- Inserción en detalle_partesBlandas
        IF @conHallazgosPartesBlandas = 1 AND @descripcionPartesBlandas IS NOT NULL
        BEGIN
            INSERT INTO detalle_partesBlandas (conHallazgos, descripcion)
            VALUES (1, @descripcionPartesBlandas);
        END

        -- Inserción en detalle_respiratorio
        IF @conHallazgosRespiratorio = 1 AND @descripcionRespiratorio IS NOT NULL
        BEGIN
            INSERT INTO detalle_respiratorio (conHallazgos, descripcion)
            VALUES (1, @descripcionRespiratorio);
        END

        -- Inserción en detalle_abdominal
        IF @conHallazgosAbdominal = 1 AND @descripcionAbdominal IS NOT NULL
        BEGIN
            INSERT INTO detalle_abdominal (conHallazgos, descripcion)
            VALUES (1, @descripcionAbdominal);
        END

        -- Inserción en detalle_osteoarticular
        IF @conHallazgosOsteoarticular = 1 AND @descripcionOsteoarticular IS NOT NULL
        BEGIN
            INSERT INTO detalle_osteoarticular (conHallazgos, descripcion)
            VALUES (1, @descripcionOsteoarticular);
        END

        -- Inserción en detalle_neurologico
        IF @conHallazgosNeurologico = 1 AND @descripcionNeurologico IS NOT NULL
        BEGIN
            INSERT INTO detalle_neurologico (conHallazgos, descripcion)
            VALUES (1, @descripcionNeurologico);
        END

        -- Inserción en detalle_visual
        IF @conHallazgosVisual = 1 AND @descripcionVisual IS NOT NULL
        BEGIN
            INSERT INTO detalle_visual (conHallazgos, descripcion)
            VALUES (1, @descripcionVisual);
        END

        -- Confirmar la transacción
        COMMIT TRANSACTION;
        PRINT 'Transacción realizada exitosamente.';
    END TRY
    BEGIN CATCH
        -- Si ocurre un error, deshacer la transacción
        ROLLBACK TRANSACTION;
        PRINT 'Error ocurrido. Transacción revertida.';
        
        -- Lanzar el error para que sea manejado externamente
        THROW;
    END CATCH;
END;

--PROCEDIMIENTO ALMACENADO INSERTAR CONTROL 

CREATE PROCEDURE sp_InsertarControl (
    @idNiño_a INT,
    @fecha_control DATE,
    @evaluacionAntropometricoId INT = NULL,
    @idPresionArterial INT = NULL,
    @agudezaVisualId INT = NULL,
    @idMedicoResponsable INT = NULL
)
AS
BEGIN

    BEGIN TRANSACTION;
    
    BEGIN TRY
     
        INSERT INTO controles (idNiño_a, evaluacionAntropometricoId ,  idPresionArterial, agudezaVisualId,fechaControl, idMedicoResponsable)
        VALUES (@idNiño_a, @evaluacionAntropometricoId,  @idPresionArterial, @agudezaVisualId, @fecha_control, @idMedicoResponsable);
        
       
        COMMIT TRANSACTION;
        PRINT 'Transacción realizada exitosamente.';
    END TRY
    BEGIN CATCH
       
        ROLLBACK TRANSACTION;
        PRINT 'Error ocurrido. Transacción revertida.';
        
    END CATCH;
END;



--PROCEDIMIENTO ALMACENADO INSERTAR VACANUCION 
CREATE PROCEDURE sp_InsertarVacunacion (
     @idNiño_a INT,
    @estado CHAR(9),
    @aplicacion BIT,
    @indicacion BIT
)
AS
BEGIN
    
    BEGIN TRANSACTION;
    
    BEGIN TRY
      
        INSERT INTO vacunacion (idNiño_a, estado, aplicacion, indicacion)
        VALUES (@idNiño_a, @estado, @aplicacion, @indicacion);
        
        
        COMMIT TRANSACTION;
        PRINT 'Transacción realizada exitosamente.';
    END TRY
    BEGIN CATCH
        
        ROLLBACK TRANSACTION;
        PRINT 'Error ocurrido. Transacción revertida.';
    END CATCH;
END;

--modificacion INSERTAR SP VACUNACION 
ALTER PROCEDURE sp_InsertarVacunacion (
    @idNiño_a INT,
    @estado CHAR(15),  -- Modificación del tipo de dato a CHAR(15)
    @aplicacion BIT,
    @indicacion BIT
)
AS
BEGIN
    BEGIN TRANSACTION;

    BEGIN TRY
        INSERT INTO vacunacion (idNiño_a, estado, aplicacion, indicacion)
        VALUES (@idNiño_a, @estado, @aplicacion, @indicacion);

        COMMIT TRANSACTION;
        PRINT 'Transacción realizada exitosamente.';
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        PRINT 'Error ocurrido. Transacción revertida.';
    END CATCH;
END;


CREATE PROCEDURE sp_CantidadNiñosPorCoberturaPorEscuela
AS
BEGIN
    
    BEGIN TRY
        BEGIN TRANSACTION;

        SELECT e.nombre AS Escuela, c.nombre AS Cobertura, COUNT(n.idNiño_a) AS CantidadNiños
        FROM NIÑOS n
        JOIN cobertura c ON n.idCobertura = c.idCobertura
        JOIN escuelas e ON n.idEscuela = e.idEscuela
        GROUP BY e.nombre, c.nombre;

        COMMIT TRANSACTION;

        PRINT 'Consulta ejecutada exitosamente.';
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        PRINT 'Error: Se produjo un error durante la ejecución de la consulta.';
    END CATCH;
END;


CREATE PROCEDURE sp_EliminarHallazgo (
    @idHallazgo INT = NULL,
    @fechaHallazgo DATE = NULL,
    @idEscuela INT = NULL
)
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        IF @idHallazgo IS NOT NULL
        BEGIN
            DELETE FROM hallazgos_clinicos
            WHERE idHallazgosClinicos = @idHallazgo;

            IF @@ROWCOUNT > 0
                PRINT 'Se eliminó el hallazgo clínico con ID ' + CAST(@idHallazgo AS VARCHAR);
            ELSE
                PRINT 'No se encontró ningún hallazgo clínico con ID ' + CAST(@idHallazgo AS VARCHAR);
        END
       
        ELSE IF @fechaHallazgo IS NOT NULL
        BEGIN
            DELETE FROM hallazgos_clinicos
            WHERE EXISTS (
                SELECT 1
                FROM controles c
                INNER JOIN NIÑOS n ON c.idNiño_a = n.idNiño_a
                WHERE c.fechaControl = @fechaHallazgo
                AND c.idNiño_a = hallazgos_clinicos.idNiño_a
            );

            IF @@ROWCOUNT > 0
                PRINT 'Se eliminaron hallazgos clínicos para la fecha ' + CONVERT(VARCHAR, @fechaHallazgo, 103);
            ELSE
                PRINT 'No se encontraron hallazgos clínicos para la fecha ' + CONVERT(VARCHAR, @fechaHallazgo, 103);
        END
       
        ELSE IF @idEscuela IS NOT NULL
        BEGIN
            DELETE FROM hallazgos_clinicos
            WHERE EXISTS (
                SELECT 1
                FROM controles c
                INNER JOIN NIÑOS n ON c.idNiño_a = n.idNiño_a
                WHERE n.idEscuela = @idEscuela
                AND c.idNiño_a = hallazgos_clinicos.idNiño_a
            );

            IF @@ROWCOUNT > 0
                PRINT 'Se eliminaron hallazgos clínicos para los niños de la escuela con ID ' + CAST(@idEscuela AS VARCHAR);
            ELSE
                PRINT 'No se encontraron hallazgos clínicos para los niños de la escuela con ID ' + CAST(@idEscuela AS VARCHAR);
        END
       
        ELSE
        BEGIN
            RETURN;
        END

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
    END CATCH;
END;

CREATE PROCEDURE sp_InsertarHallazgoSiHubo(
    @idNiño_a INT,
    @fecha_hallazgo DATE,
    @conHallazgosPiel BIT,
    @descripcionPiel VARCHAR(250),
    @conHallazgosPartesBlandas BIT,
    @descripcionPartesBlandas VARCHAR(250),
    @conHallazgosRespiratorio BIT,
    @descripcionRespiratorio VARCHAR(250),
    @conHallazgosAbdominal BIT,
    @descripcionAbdominal VARCHAR(250),
    @conHallazgosOsteoarticular BIT,
    @descripcionOsteoarticular VARCHAR(250),
    @conHallazgosNeurologico BIT,
    @descripcionNeurologico VARCHAR(250),
    @conHallazgosVisual BIT,
    @descripcionVisual VARCHAR(250)
)
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        IF @conHallazgosPiel = 1 AND @descripcionPiel IS NOT NULL
        BEGIN
            INSERT INTO detalle_piel (conHallazgos, descripcion)
            VALUES (1, @descripcionPiel);
        END

        IF @conHallazgosPartesBlandas = 1 AND @descripcionPartesBlandas IS NOT NULL
        BEGIN
            INSERT INTO detalle_partesBlandas (conHallazgos, descripcion)
            VALUES (1, @descripcionPartesBlandas);
        END

        IF @conHallazgosRespiratorio = 1 AND @descripcionRespiratorio IS NOT NULL
        BEGIN
            INSERT INTO detalle_respiratorio (conHallazgos, descripcion)
            VALUES (1, @descripcionRespiratorio);
        END

        IF @conHallazgosAbdominal = 1 AND @descripcionAbdominal IS NOT NULL
        BEGIN
            INSERT INTO detalle_abdominal (conHallazgos, descripcion)
            VALUES (1, @descripcionAbdominal);
        END

        IF @conHallazgosOsteoarticular = 1 AND @descripcionOsteoarticular IS NOT NULL
        BEGIN
            INSERT INTO detalle_osteoarticular (conHallazgos, descripcion)
            VALUES (1, @descripcionOsteoarticular);
        END

        IF @conHallazgosNeurologico = 1 AND @descripcionNeurologico IS NOT NULL
        BEGIN
            INSERT INTO detalle_neurologico (conHallazgos, descripcion)
            VALUES (1, @descripcionNeurologico);
        END

        IF @conHallazgosVisual = 1 AND @descripcionVisual IS NOT NULL
        BEGIN
            INSERT INTO detalle_visual (conHallazgos, descripcion)
            VALUES (1, @descripcionVisual);
        END

        COMMIT TRANSACTION;
        PRINT '¡Procedimiento ejecutado exitosamente!';

    END TRY
    BEGIN CATCH
            ROLLBACK TRANSACTION;
        PRINT '¡Error al ejecutar el procedimiento! Se ha realizado un rollback de la transacción.';
    END CATCH;
END;


CREATE PROCEDURE sp_ListaNiñosVacunacionCompletaPorEscuela
AS
BEGIN

    BEGIN TRY
        BEGIN TRANSACTION;

        SELECT e.nombre AS Escuela, n.idNiño_a, n.nombre, n.apellido, n.DNI
        FROM NIÑOS n
        INNER JOIN vacunacion v ON n.idNiño_a = v.idNiño_a
        INNER JOIN escuelas e ON n.idEscuela = e.idEscuela
        WHERE v.estado = 'completo';

        COMMIT TRANSACTION;

        PRINT 'Consulta ejecutada exitosamente.';
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        PRINT 'Error: Se produjo un error durante la ejecución de la consulta.';
    END CATCH;
END;


-- SP ACTUALIZAR COBERTURA 
CREATE PROCEDURE sp_ActualizarCobertura(
    @idNiño_a INT,
    @nuevaCoberturaId INT
)
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        -- Actualizar la cobertura del niño
        UPDATE NIÑOS
        SET idCobertura = @nuevaCoberturaId
        WHERE idNiño_a = @idNiño_a;

        IF @@ROWCOUNT > 0
            PRINT 'La cobertura del niño con ID ' + CAST(@idNiño_a AS VARCHAR) + ' se actualizó exitosamente.';
        ELSE
            PRINT 'No se encontró ningún niño con el ID ' + CAST(@idNiño_a AS VARCHAR);

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        PRINT 'Error al intentar actualizar la cobertura del niño con ID ' + CAST(@idNiño_a AS VARCHAR);
        THROW;
    END CATCH;
END;


--PROCEDIMMIENTO DETALLES CONTROL MEDICO NIÑO POR ESCUELA 
CREATE PROCEDURE sp_DetallesControlMedicoNiñoPorEscuela
    @idEscuela INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        SELECT e.nombre AS Escuela,  c.idControles,  c.fechaControl, ev.Peso, ev.Talla, ev.IMC, ev.Percentilo,  pa.Pas,  pa.Pad,   pa.descripcion AS PresionDescripcion, av.UsaLentes,  av.OjoIzquierdo,  av.OjoDerecho 
        FROM controles c
        LEFT JOIN detalle_evaluacionAntropometrico ev ON c.evaluacionAntropometricoId = ev.idEvaluacionAntropometrico
        LEFT JOIN detalle_presionArterial pa ON c.IdpresionArterial = pa.idPresionArterial
        LEFT JOIN detalle_agudezaVisual av ON c.agudezaVisualId = av.idAgudezaVisual
        INNER JOIN niño_a n ON c.idNiño_a = n.idNiño_a
        INNER JOIN escuela e ON n.escuela_id = e.idEscuela
        WHERE n.escuela_id = @idEscuela;

        COMMIT TRANSACTION;
        PRINT 'Transacción realizada con éxito.';
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        PRINT 'Transacción fallida.';
    END CATCH
END;

--PROCEDIMIENTO HALLAZGO CLINICO POR ESCUELA 
CREATE PROCEDURE sp_HallazgosClinicosNiñoPorEscuela
    @idEscuela INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        SELECT e.nombre AS Escuela,  hc.idHallazgosClinicos, dp.descripcion AS PielDescripcion,  dpl.descripcion AS PartesBlandasDescripcion, dr.descripcion AS RespiratorioDescripcion,   da.descripcion AS AbdominalDescripcion, doa.descripcion AS OsteoarticularDescripcion,  dn.descripcion AS NeurologicoDescripcion,  dv.descripcion AS VisualDescripcion
        FROM hallazgos_clinicos hc
        LEFT JOIN detalle_piel dp ON hc.pielId = dp.idPiel
        LEFT JOIN detalle_partesBlandas dpl ON hc.partesBlandasId = dpl.idPartesBlandas
        LEFT JOIN detalle_respiratorio dr ON hc.respiratorioId = dr.idRespiratorio
        LEFT JOIN detalle_abdominal da ON hc.abdominalId = da.idAbdominal
        LEFT JOIN detalle_osteoarticular doa ON hc.osteoarticularId = doa.idOsteoarticular
        LEFT JOIN detalle_neurologico dn ON hc.neurologicoId = dn.idNeurologico
        LEFT JOIN detalle_visual dv ON hc.visualId = dv.idVisual
        INNER JOIN niño_a n ON hc.idNiño_a = n.idNiño_a
        INNER JOIN escuela e ON n.escuela_id = e.idEscuela
        WHERE n.escuela_id = @idEscuela;

        COMMIT TRANSACTION;
        PRINT 'Transacción realizada con éxito.';
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        PRINT 'Transacción fallida.';
    END CATCH
END;


--PROCEDIMIENTO CANTIDAD DE NIÑOS POR ESCUELA 
CREATE PROCEDURE sp_CantidadNiñosPorEdadPorEscuela
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        SELECT e.nombre AS Escuela,  n.edad,  COUNT(n.idNiño_a) AS CantidadNiños
        FROM niño_a n
        JOIN escuela e ON n.escuela_id = e.idEscuela
        GROUP BY e.nombre, n.edad;

        COMMIT TRANSACTION;
        PRINT 'Transacción realizada con éxito.';
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        PRINT 'Transacción fallidA.';
    END CATCH
END;

--SP ACTUALIZAR ESCUELA 
CREATE PROCEDURE sp_ActualizarEscuelaNiño(
    @idNiño_a INT,
    @nuevoIdEscuela INT
)
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        -- Actualizar la escuela del niño
        UPDATE NIÑOS
        SET idEscuela = @nuevoIdEscuela
        WHERE idNiño_a = @idNiño_a;

        IF @@ROWCOUNT > 0
            PRINT 'La escuela del niño con ID ' + CAST(@idNiño_a AS VARCHAR) + ' se actualizó exitosamente a la nueva escuela con ID ' + CAST(@nuevoIdEscuela AS VARCHAR);
        ELSE
            PRINT 'No se encontró ningún niño con ID ' + CAST(@idNiño_a AS VARCHAR);

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        PRINT 'Error al intentar actualizar la escuela del niño con ID ' + CAST(@idNiño_a AS VARCHAR);
    END CATCH;
END;

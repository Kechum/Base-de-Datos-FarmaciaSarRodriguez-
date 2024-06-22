 PROCEDIMIENTOS ALMACENADOS

--INSERT
--CREATE PROCEDURE sp_InsertarNiñoConCobertura 
--(
--    @nombre VARCHAR(50),
--    @apellido VARCHAR(70),
--    @domicilio VARCHAR(255),
--    @celular VARCHAR(20),
--    @numero_documento VARCHAR(10),
--    @sexo CHAR(1),
--    @fecha_nacimiento DATE,
--    @idCobertura INT,
--    @nombre_escuela VARCHAR(100), 
--    @idNiño_a INT OUTPUT
--)
--AS
--BEGIN
--    DECLARE @escuela_id INT;

--    BEGIN TRY
       
--        BEGIN TRANSACTION;

--			SELECT @escuela_id = idEscuela
--			FROM escuelas
--			WHERE nombre = @nombre_escuela;

        
--			IF @escuela_id IS NULL
--			BEGIN
--				INSERT INTO escuelas (nombre)
--				VALUES (@nombre_escuela);

--				SET @escuela_id = SCOPE_IDENTITY();
--			END

        
--			INSERT INTO NIÑOS (nombre, apellido, domicilio, celular, DNI, sexo, fecha_nacimiento, idCobertura, idEscuela)
--			VALUES (@nombre, @apellido, @domicilio, @celular, @numero_documento, @sexo, @fecha_nacimiento, @idCobertura, @escuela_id);

--			SET @idNiño_a = SCOPE_IDENTITY();

        
--			IF NOT EXISTS (SELECT 1 FROM cobertura WHERE idCobertura = @idCobertura)
--			BEGIN
--				INSERT INTO cobertura (idCobertura, nombre)
--				VALUES (@idCobertura, (SELECT nombre FROM cobertura WHERE idCobertura = @idCobertura));
--			END

        
--        COMMIT TRANSACTION;

        
--        PRINT 'La transacción se completó exitosamente y se insertaron los datos correctamente.';
--    END TRY
--    BEGIN CATCH
        
--        ROLLBACK TRANSACTION;

       
--        PRINT 'Ocurrió un error y la transacción fue revertida: ' + ERROR_MESSAGE();

--    END CATCH
--END;


--CREATE PROCEDURE sp_InsertarHallazgoSiHubo
--    @idNiño_a INT,
--    @fecha_hallazgo DATE,
--    @conHallazgosPiel BIT,
--    @descripcionPiel VARCHAR(250),
--    @conHallazgosPartesBlandas BIT,
--    @descripcionPartesBlandas VARCHAR(250),
--    @conHallazgosRespiratorio BIT,
--    @descripcionRespiratorio VARCHAR(250),
--    @conHallazgosAbdominal BIT,
--    @descripcionAbdominal VARCHAR(250),
--    @conHallazgosOsteoarticular BIT,
--    @descripcionOsteoarticular VARCHAR(250),
--    @conHallazgosNeurologico BIT,
--    @descripcionNeurologico VARCHAR(250),
--    @conHallazgosVisual BIT,
--    @descripcionVisual VARCHAR(250)
--AS
--BEGIN
--    SET NOCOUNT ON;
--    BEGIN TRY
        
--        BEGIN TRANSACTION;

       
--        IF @conHallazgosPiel = 1 AND @descripcionPiel IS NOT NULL
--        BEGIN
--            INSERT INTO detalle_piel  (conHallazgos, descripcion)
--            VALUES (1, @descripcionPiel);
--        END

       
--        IF @conHallazgosPartesBlandas = 1 AND @descripcionPartesBlandas IS NOT NULL
--        BEGIN
--            INSERT INTO detalle_partesBlandas (conHallazgos, descripcion)
--            VALUES (1, @descripcionPartesBlandas);
--        END

        
--        IF @conHallazgosRespiratorio = 1 AND @descripcionRespiratorio IS NOT NULL
--        BEGIN
--            INSERT INTO detalle_respiratorio (conHallazgos, descripcion)
--            VALUES (1, @descripcionRespiratorio);
--        END

        
--        IF @conHallazgosAbdominal = 1 AND @descripcionAbdominal IS NOT NULL
--        BEGIN
--            INSERT INTO detalle_abdominal (conHallazgos, descripcion)
--            VALUES (1, @descripcionAbdominal);
--        END

        
--        IF @conHallazgosOsteoarticular = 1 AND @descripcionOsteoarticular IS NOT NULL
--        BEGIN
--            INSERT INTO detalle_osteoarticular (conHallazgos, descripcion)
--            VALUES (1, @descripcionOsteoarticular);
--        END

        
--        IF @conHallazgosNeurologico = 1 AND @descripcionNeurologico IS NOT NULL
--        BEGIN
--            INSERT INTO detalle_neurologico (conHallazgos, descripcion)
--            VALUES (1, @descripcionNeurologico);
--        END

        
--        IF @conHallazgosVisual = 1 AND @descripcionVisual IS NOT NULL
--        BEGIN
--            INSERT INTO detalle_visual (conHallazgos, descripcion)
--            VALUES (1, @descripcionVisual);
--        END

        
--        COMMIT TRANSACTION;
--    END TRY
--    BEGIN CATCH
        
----        ROLLBACK TRANSACTION;
       
----    END CATCH;
----END;


----PROCEDIMIENTO ALMACENADO INSERTAR CONTROL 

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
--CREATE PROCEDURE sp_InsertarVacunacion (
--     @idNiño_a INT,
--    @estado CHAR(9),
--    @aplicacion BIT,
--    @indicacion BIT
--)
--AS
--BEGIN
    
--    BEGIN TRANSACTION;
    
--    BEGIN TRY
      
--        INSERT INTO vacunacion (idNiño_a, estado, aplicacion, indicacion)
--        VALUES (@idNiño_a, @estado, @aplicacion, @indicacion);
        
        
--        COMMIT TRANSACTION;
--        PRINT 'Transacción realizada exitosamente.';
--    END TRY
--    BEGIN CATCH
        
--        ROLLBACK TRANSACTION;
--        PRINT 'Error ocurrido. Transacción revertida.';
--    END CATCH;
--END;


--CREATE PROCEDURE sp_CantidadNiñosPorCoberturaPorEscuela
--AS
--BEGIN
    
--    BEGIN TRY
--        BEGIN TRANSACTION;

--        SELECT e.nombre AS Escuela, c.nombre AS Cobertura, COUNT(n.idNiño_a) AS CantidadNiños
--        FROM NIÑOS n
--        JOIN cobertura c ON n.idCobertura = c.idCobertura
--        JOIN escuelas e ON n.idEscuela = e.idEscuela
--        GROUP BY e.nombre, c.nombre;

--        COMMIT TRANSACTION;

--        PRINT 'Consulta ejecutada exitosamente.';
--    END TRY
--    BEGIN CATCH
--        ROLLBACK TRANSACTION;
--        PRINT 'Error: Se produjo un error durante la ejecución de la consulta.';
--    END CATCH;
--END;

CREATE PROCEDURE EliminarControlPorFecha(
    @fechaControl DATE
)
AS
BEGIN
    SET NOCOUNT ON;
    
    BEGIN TRY
        BEGIN TRANSACTION;

        DELETE FROM controles
        WHERE fechaControl = @fechaControl;

        IF @@ROWCOUNT > 0
            PRINT 'Se eliminaron registros de controles para la fecha ' + CONVERT(VARCHAR, @fechaControl);
        ELSE
            PRINT 'No se encontraron registros de controles para la fecha ' + CONVERT(VARCHAR, @fechaControl);

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        PRINT 'Error al intentar eliminar registros de controles para la fecha ' + CONVERT(VARCHAR, @fechaControl);
        THROW;
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

--CREATE PROCEDURE sp_InsertarNiñoConCobertura
--(
--    @nombre VARCHAR(50),
--    @apellido VARCHAR(70),
--    @domicilio VARCHAR(255),
--    @celular VARCHAR(20),
--    @numero_documento VARCHAR(10),
--    @sexo CHAR(1),
--    @fecha_nacimiento DATE,
--    @idCobertura INT,
--    @nombre_escuela VARCHAR(100), 
--    @idNiño_a INT OUTPUT
--)
--AS
--BEGIN
--    DECLARE @escuela_id INT;

--    BEGIN TRY
       
--        BEGIN TRANSACTION;

--			SELECT @escuela_id = idEscuela
--			FROM escuelas
--			WHERE nombre = @nombre_escuela;

        
--			IF @escuela_id IS NULL
--			BEGIN
--				INSERT INTO escuelas (nombre)
--				VALUES (@nombre_escuela);

--				SET @escuela_id = SCOPE_IDENTITY();
--			END

        
--			INSERT INTO NIÑOS (nombre, apellido, domicilio, celular, DNI, sexo, fecha_nacimiento, idCobertura, idEscuela)
--			VALUES (@nombre, @apellido, @domicilio, @celular, @numero_documento, @sexo, @fecha_nacimiento, @idCobertura, @escuela_id);

--			SET @idNiño_a = SCOPE_IDENTITY();

        
--			IF NOT EXISTS (SELECT 1 FROM cobertura WHERE idCobertura = @idCobertura)
--			BEGIN
--				INSERT INTO cobertura (idCobertura, nombre)
--				VALUES (@idCobertura, (SELECT nombre FROM cobertura WHERE idCobertura = @idCobertura));
--			END

        
--        COMMIT TRANSACTION;

        
--        PRINT 'La transacción se completó exitosamente y se insertaron los datos correctamente.';
--    END TRY
--    BEGIN CATCH
        
--        ROLLBACK TRANSACTION;

       
--        PRINT 'Ocurrió un error y la transacción fue revertida: '

--    END CATCH
--END;

--CREATE PROCEDURE sp_ListaNiñosVacunacionCompletaPorEscuela
--AS
--BEGIN

--    BEGIN TRY
--        BEGIN TRANSACTION;

--        SELECT e.nombre AS Escuela, n.idNiño_a, n.nombre, n.apellido, n.DNI
--        FROM NIÑOS n
--        INNER JOIN vacunacion v ON n.idNiño_a = v.idNiño_a
--        INNER JOIN escuelas e ON n.idEscuela = e.idEscuela
--        WHERE v.estado = 'completo';

--        COMMIT TRANSACTION;

--        PRINT 'Consulta ejecutada exitosamente.';
--    END TRY
--    BEGIN CATCH
--        ROLLBACK TRANSACTION;
--        PRINT 'Error: Se produjo un error durante la ejecución de la consulta.';
--    END CATCH;
--END;
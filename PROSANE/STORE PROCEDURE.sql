 PROCEDIMIENTOS ALMACENADOS

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





--Triggers

CREATE TRIGGER trg_CalcularEdad
ON NIÑOS
AFTER INSERT, UPDATE
AS
BEGIN
    DECLARE @idNiño_a INT;
    DECLARE @fecha_nacimiento DATE;

    
    SELECT @idNiño_a = idNiño_a, @fecha_nacimiento = fecha_nacimiento
    FROM inserted;

    
    DECLARE @edad INT;
    SET @edad = DATEDIFF(YEAR, @fecha_nacimiento, GETDATE());

    
    UPDATE NIÑOS
    SET edad = @edad
    WHERE idNiño_a = @idNiño_a;
END;


CREATE TRIGGER trg_delete_control_hallazgo_detalles
ON controles
AFTER DELETE
AS
BEGIN
    
    -- Eliminar detalles de evaluación antropométrica asociados
    DELETE FROM detalle_evaluacionAntropometrico
    WHERE idEvaluacionAntropometrico IN (SELECT evaluacionAntropometricoId FROM deleted WHERE evaluacionAntropometricoId IS NOT NULL);

    -- Eliminar detalles de presión arterial asociados
    DELETE FROM detalle_presionArterial
    WHERE idPresionArterial IN (SELECT idPresionArterial FROM deleted WHERE idPresionArterial IS NOT NULL);

    -- Eliminar detalles de agudeza visual asociados
    DELETE FROM detalle_agudezaVisual
    WHERE idAgudezaVisual IN (SELECT agudezaVisualId FROM deleted WHERE agudezaVisualId IS NOT NULL);

    -- Eliminar detalles de piel asociados
    DELETE FROM detalle_piel
    WHERE idPiel IN (SELECT pielId FROM hallazgos_clinicos WHERE idHallazgosClinicos IN (SELECT idHallazgosClinicos FROM deleted));

    -- Eliminar detalles de partes blandas asociados
    DELETE FROM detalle_partesBlandas
    WHERE idPartesBlandas IN (SELECT partesBlandasId FROM hallazgos_clinicos WHERE idHallazgosClinicos IN (SELECT idHallazgosClinicos FROM deleted));

    -- Eliminar detalles respiratorios asociados
    DELETE FROM detalle_respiratorio
    WHERE idRespiratorio IN (SELECT respiratorioId FROM hallazgos_clinicos WHERE idHallazgosClinicos IN (SELECT idHallazgosClinicos FROM deleted));

    -- Eliminar detalles abdominales asociados
    DELETE FROM detalle_abdominal
    WHERE idAbdominal IN (SELECT abdominalId FROM hallazgos_clinicos WHERE idHallazgosClinicos IN (SELECT idHallazgosClinicos FROM deleted));

    -- Eliminar detalles osteoarticulares asociados
    DELETE FROM detalle_osteoarticular
    WHERE idOsteoarticular IN (SELECT osteoarticularId FROM hallazgos_clinicos WHERE idHallazgosClinicos IN (SELECT idHallazgosClinicos FROM deleted));

    -- Eliminar detalles neurológicos asociados
    DELETE FROM detalle_neurologico
    WHERE idNeurologico IN (SELECT neurologicoId FROM hallazgos_clinicos WHERE idHallazgosClinicos IN (SELECT idHallazgosClinicos FROM deleted));

    -- Eliminar detalles visuales asociados
    DELETE FROM detalle_visual
    WHERE idVisual IN (SELECT visualId FROM hallazgos_clinicos WHERE idHallazgosClinicos IN (SELECT idHallazgosClinicos FROM deleted));
END;

--TRIGGER ESTADO

CREATE TRIGGER trg_Asegurar_estado
ON vacunacion
AFTER INSERT, UPDATE
AS
BEGIN
    UPDATE v
    SET estado = CASE
                    WHEN i.aplicacion = 1 THEN 'incompleto'
                    WHEN i.aplicacion = 0 THEN 'completo'
                    ELSE v.estado -- Mantener el estado actual si no hay cambios en 'aplicacion'
                END
    FROM vacunacion v
    JOIN inserted i ON v.idVacunacion = i.idVacunacion;
END;


--TRIGGER ELIMINAR REGISTROS 

CREATE TRIGGER trg_eliminar_registros_relacionados_niño
ON NIÑOS
AFTER DELETE
AS
BEGIN
    DELETE FROM controles
    WHERE idNiño_a IN (SELECT idNiño_a FROM deleted);

    DELETE FROM hallazgos_clinicos
    WHERE idNiño_a IN (SELECT idNiño_a FROM deleted);

    DELETE FROM vacunacion
    WHERE idNiño_a IN (SELECT idNiño_a FROM deleted);
END;


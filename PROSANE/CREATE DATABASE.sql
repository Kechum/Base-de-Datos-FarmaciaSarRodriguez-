Create DataBase PROSANE

USE PROSANE
GO

CREATE TABLE cobertura ( 
idCobertura INT IDENTITY, 
nombre VARCHAR(150) NOT NULL 
CONSTRAINT PK_idCobertura PRIMARY KEY (idCobertura)
);

CREATE TABLE escuelas (
    idEscuela INT IDENTITY,
    nombre VARCHAR(100) NOT NULL
	CONSTRAINT PK_idEscuela PRIMARY KEY (idEscuela)
);

CREATE TABLE NIÑOS (
    idNiño_a INT PRIMARY KEY IDENTITY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(70) NOT NULL,
    domicilio VARCHAR(150),
    celular VARCHAR(20),
    DNI VARCHAR(8) NOT NULL,
    sexo CHAR(1) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    edad INT,
    idCobertura INT,
	idEscuela INT,
    CONSTRAINT FK_idEscuela FOREIGN KEY (idEscuela) REFERENCES escuelas (idEscuela),
    CONSTRAINT FK_IdCobertura FOREIGN KEY (idCobertura) REFERENCES cobertura (idCobertura)
);

CREATE TABLE vacunacion (
    idVacunacion INT IDENTITY,
    estado CHAR(9) NOT NULL, -- "completo" o "incompleto"
    aplicacion BIT NOT NULL, -- 1 si la vacuna fue aplicada, 0 si no
    indicacion BIT NOT NULL, -- 1 si hay indicación médica, 0 si no
    idNiño_a INT,
	CONSTRAINT PK_idVacunacion PRIMARY KEY (idVacunacion),
    CONSTRAINT FK_idNiño_a FOREIGN KEY (idNiño_a) REFERENCES NIÑOS (idNiño_a)
);

--MODIFICACION VALOR ESTADO (TABLA VACUNACION)
ALTER TABLE vacunacion
ALTER COLUMN estado VARCHAR(15);

CREATE TABLE detalle_evaluacionAntropometrico (
    idEvaluacionAntropometrico INT IDENTITY,
    Peso DECIMAL(5,2),
    Talla DECIMAL(5,2),
    IMC DECIMAL(5,2),
    Percentilo INT
	CONSTRAINT PK_idEvaluacionAntropometrico PRIMARY KEY (idEvaluacionAntropometrico)
);

CREATE TABLE detalle_presionArterial (
    idPresionArterial INT IDENTITY,
    Pas INT,
    Pad INT,
    descripcion char(10)
	CONSTRAINT PK_idPresionArterial PRIMARY KEY (idPresionArterial)
);

TABLA AGUDEZA VISUAL
CREATE TABLE detalle_agudezaVisual (
    idAgudezaVisual INT IDENTITY,
    UsaLentes BIT,
    OjoIzquierdo INT,
    OjoDerecho INT
CONSTRAINT PK_idAgudezaVisual   PRIMARY KEY (idAgudezaVisual)
);

--TABLA DETALLE PIEL
CREATE TABLE detalle_piel (
    idPiel INT IDENTITY,
    conHallazgos BIT,
    descripcion TEXT
 CONSTRAINT PK_idPiel  PRIMARY KEY (idPiel)
);

--TABLA DETALLE PARTES BLANDAS
CREATE TABLE detalle_partesBlandas (
    idPartesBlandas INT IDENTITY,
    conHallazgos BIT,
    descripcion VARCHAR(250)
CONSTRAINT PK_idPartesBlandas   PRIMARY KEY (idPartesBlandas)
);

--TABLA DETALLE RESPIRATORIO
CREATE TABLE detalle_respiratorio (
    idRespiratorio INT IDENTITY,
    conHallazgos BIT,
    descripcion VARCHAR(250)
CONSTRAINT PK_idRespiratorio   PRIMARY KEY (idRespiratorio)
);


--TABLA DETALLE ABDOMINAL
CREATE TABLE detalle_abdominal (
    idAbdominal INT IDENTITY,
    conHallazgos BIT,
    descripcion VARCHAR(250)
CONSTRAINT PK_idAbdominal   PRIMARY KEY (idAbdominal)
);


--TABLA DETALLE OSTEOARTICULAR
CREATE TABLE detalle_osteoarticular (
    idOsteoarticular INT IDENTITY,
    conHallazgos BIT,
    descripcion VARCHAR(250)
CONSTRAINT PK_idOsteoarticular   PRIMARY KEY (idOsteoarticular)
);

--TABLA DETALLE NEUROLOGICO
CREATE TABLE detalle_neurologico (
    idNeurologico INT IDENTITY,
    conHallazgos BIT,
    descripcion VARCHAR(250)
CONSTRAINT PK_idNeurologico   PRIMARY KEY (idNeurologico)
);

--TABLA DETALLE VISUAL
CREATE TABLE detalle_visual (
    idVisual INT IDENTITY,
    conHallazgos BIT,
    descripcion VARCHAR(250)

CONSTRAINT PK_idVisual   PRIMARY KEY (idVisual)
);


CREATE TABLE medico (
    idMedico INT IDENTITY,
    nombre VARCHAR(50) NOT NULL,
	apellido VARCHAR(50) NOT NULL,
    matricula VARCHAR(50) NOT NULL

	CONSTRAINT PK_idMedico PRIMARY KEY (idMedico)
);

CREATE TABLE controles (
    idControles INT IDENTITY,
    idNiño_a INT,
    evaluacionAntropometricoId INT,
    idPresionArterial INT,
    agudezaVisualId INT,
    fechaControl DATE,
    idMedicoResponsable INT,

	CONSTRAINT PK_idControles PRIMARY KEY (idControles),
    CONSTRAINT FK_idNiño FOREIGN KEY (idNiño_a) REFERENCES NIÑOS (idNiño_a),
    CONSTRAINT FK_evaluacionAntropometricoId FOREIGN KEY (evaluacionAntropometricoId) REFERENCES detalle_evaluacionAntropometrico(idEvaluacionAntropometrico),
    CONSTRAINT FK_idPresionArterial	 FOREIGN KEY (idPresionArterial) REFERENCES detalle_presionArterial (idPresionArterial),
    CONSTRAINT FK_idAgudezaVisual	FOREIGN KEY ( agudezaVisualId) REFERENCES detalle_agudezaVisual (idAgudezaVisual),
    CONSTRAINT FK_idMedicoResponsable	FOREIGN KEY (idMedicoResponsable) REFERENCES medico(idMedico)
);

CREATE TABLE hallazgos_clinicos (
    idHallazgosClinicos INT IDENTITY,
    idNiño_a INT,
    pielId INT,
    partesBlandasId INT,
    respiratorioId INT,
    abdominalId INT,
    osteoarticularId INT,
    neurologicoId INT,
    visualId INT,
	CONSTRAINT PK_idHallazgosClinicos PRIMARY KEY (idHallazgosClinicos),
    CONSTRAINT FK_idNiñ@ FOREIGN KEY (idNiño_a) REFERENCES NIÑOS (idNiño_a),
    CONSTRAINT FK_pielId FOREIGN KEY (pielId) REFERENCES detalle_piel (idPiel),
    CONSTRAINT FK_partesBlandasId FOREIGN KEY (partesBlandasId) REFERENCES detalle_partesBlandas(idPartesBlandas),
    CONSTRAINT FK_respiratorioId FOREIGN KEY (respiratorioId) REFERENCES detalle_respiratorio(idRespiratorio),
    CONSTRAINT FK_abdominalId FOREIGN KEY (abdominalId) REFERENCES detalle_abdominal(idAbdominal),
    CONSTRAINT FK_osteoarticularId FOREIGN KEY (osteoarticularId) REFERENCES detalle_osteoarticular(idOsteoarticular),
    CONSTRAINT FK_neurologicoId FOREIGN KEY (neurologicoId) REFERENCES detalle_neurologico(idNeurologico),
    CONSTRAINT FK_visualId FOREIGN KEY (visualId) REFERENCES detalle_visual(idVisual)
);
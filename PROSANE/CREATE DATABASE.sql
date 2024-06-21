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
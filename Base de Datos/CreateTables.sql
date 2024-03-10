-- Query de las tablas y SPs
-- Armando Castro, Stephanie Sandoval

USE PrograDB;

-- Crear la tabla de empleados

CREATE TABLE dbo.Empleado (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(128) NOT NULL,
    Salario MONEY NOT NULL
);

-- Crear la tabla de errores
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;

CREATE TABLE dbo.DataError (
	ID INT IDENTITY(1,1) NOT NULL,
	Usuario VARCHAR(128) NULL,
	Numero INT NULL,
	Estado INT NULL,
	Gravedad INT NULL,
	Linea INT NULL,
	Procedimiento VARCHAR(max) NULL,
	Mensaje VARCHAR(max) NULL,
	Momento DATETIME NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
GO
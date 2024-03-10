-- Armando Castro, Stephanie Sandoval | Mar 12. 24
-- Tarea Programada 01 | Base de Datos I

-- Create the two tables of the database

USE PrograDB;

-- Create the employee table:
CREATE TABLE dbo.Empleado (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(128) NOT NULL,
    Salario MONEY NOT NULL
);

-- Create the error table:
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
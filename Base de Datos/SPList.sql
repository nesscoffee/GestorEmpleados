-- Armando Castro, Stephanie Sandoval | Mar 12. 24
-- Tarea Programada 01 | Base de Datos I

-- Stored Procedure:
-- Creates list with all the employees in the db
-- Sorts alphabetically according to the last name
-- Doesn't show the PK value

-- Note:
-- To sort alphabetically according to name, remove comment
-- from the line following the SELECT statement and
-- comment the next line.

-- Execution example:
-- -- USE PrograDB
-- -- EXECUTE dbo.ListEmployee

CREATE PROCEDURE dbo.ListEmployee
AS
BEGIN
	SET NOCOUNT ON;

	SELECT E.[Nombre], E.[Salario] FROM dbo.Empleado E
	-- ORDER BY E.[Nombre];
	ORDER BY SUBSTRING(E.[Nombre], CHARINDEX(' ', E.[Nombre]) + 1, LEN(E.[Nombre]) - CHARINDEX(' ', E.[Nombre]));

	SET NOCOUNT OFF;
END;
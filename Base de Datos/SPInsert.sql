-- Armando Castro, Stephanie Sandoval | Mar 12. 24
-- Tarea Programada 01 | Base de Datos I

-- Stored Procedure:
-- Inserts new values into the table: Empleado
-- Verifies there are no duplicates

-- Parameter's description:
-- @outResultCode: execution result code
-- -- if the code is 0, the code ran without problems
-- -- if the code is between 0 and 50000, it's a reserved error
-- -- if the code is greater than 50000, it was defined by the programmer

-- Execution example:
-- -- USE PrograDB
-- -- DECLARE @utResultCode INT
-- -- EXECUTE [dbo].[InsertarEmpleado] 'Nombre', 1000, @outResultCode OUTPUT

CREATE PROCEDURE dbo.InsertEmployee
	@inNombre VARCHAR(128)
	, @inSalario MONEY
	, @outResultCode INT OUTPUT

AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY

	-- variable inicialization:
	SET @outResultCode = 0;

	-- check for duplicates:
	IF EXISTS (SELECT 1 FROM [dbo].[Empleado] E WHERE E.Nombre = @inNombre)
	BEGIN
		-- the employee's name already exists:
		SET @outResultCode = 50010;
	END;

	-- if the name is not registered:
	IF (@outResultCode = 0)
	BEGIN
		-- add name to the table:
		INSERT dbo.Empleado (Nombre, Salario)
		VALUES (@inNombre, @inSalario)
	END;

	SELECT @outResultCode AS outResultCode;
	END TRY

	BEGIN CATCH
		INSERT INTO dbo.Errores VALUES (
			SUSER_SNAME(),
			ERROR_NUMBER(),
			ERROR_STATE(),
			ERROR_SEVERITY(),
			ERROR_LINE(),
			ERROR_PROCEDURE(),
			ERROR_MESSAGE(),
			GETDATE()
		);

		-- catch error:
		SET @outResultCode = 50005;

	END CATCH;
	SET NOCOUNT OFF;
END;
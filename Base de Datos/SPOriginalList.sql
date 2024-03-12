-- Armando Castro, Stephanie Sandoval | Mar 12. 24
-- Tarea Programada 01 | Base de Datos I

-- Stored Procedure:
-- Creates list with all the employees in the db
-- Sorts alphabetically according to the name

-- Execution example:
-- -- DECLARE @outResultCode INT
-- -- EXECUTE dbo.ListEmployees @outResultCode OUTPUT

CREATE PROCEDURE dbo.ListEmployees
	@outResultCode INT OUTPUT
AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY

		SET @outResultCode = 0;

		SELECT @outResultCode AS outResultCode;

		SELECT E.[Nombre], E.[Salario]
		FROM dbo.Empleado E
		ORDER BY E.Nombre

	END TRY
	BEGIN CATCH
		
		INSERT INTO dbo.DataError VALUES (
			SUSER_SNAME(),
			ERROR_NUMBER(),
			ERROR_STATE(),
			ERROR_SEVERITY(),
			ERROR_LINE(),
			ERROR_PROCEDURE(),
			ERROR_MESSAGE(),
			GETDATE()
		);

		SET @outResultCode = 50005;

	END CATCH;
	SET NOCOUNT OFF;
END;
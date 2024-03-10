-- Inserta nuevos datos en la tabla Empleado
-- Valida que el nombre del empleado no exista

-- Descripcion de parametros:
-- @outResultCode: codigo de resultado de ejecucion
-- -- si el codigo es 0, el codigo corrio sin errores
-- -- si el codigo de error esta entre 0 y 50000 son errores reservados
-- -- si el codigo es mayor a 50000, fue definido por el programador

-- Ejemplo de ejecucion del SP:
-- -- DECLARE @utResultCode INT
-- -- EXECUTE [dbo].[InsertarEmpleado] 'Nombre', 1000, @outResultCode OUTPUT

CREATE PROCEDURE dbo.InsertarEmpleado
	@inNombre VARCHAR(128)
	, @inSalario MONEY
	, @outResultCode INT OUTPUT

AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY

	-- inicializacion de variables:
	SET @outResultCode = 0;

	-- validaciones:

	-- validar si ya existe un nombre igual al de entrada:
	IF EXISTS (SELECT 1 FROM [dbo].[Empleado] E WHERE E.Nombre = @inNombre)
	BEGIN
		-- nombre de empleado ya existe:
		SET @outResultCode = 50010;
	END;

	-- si el nombre no esta en la base de datos:
	IF (@outResultCode = 0)
	BEGIN
		-- agregar el nombre a la tabla:
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

		-- error en el catch:
		SET @outResultCode = 50005;

	END CATCH;
	SET NOCOUNT OFF;
END;
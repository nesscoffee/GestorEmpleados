-- Lista todos los empleados en orden alfabetico ascendente
-- Ordena segun apellido
-- Para ordenar segun nombre se debe quitar el comentario despues del select y comentar la siguiente
-- Muestra todos los atributos excepto la PK

-- Ejemplo de ejecucion del SP:
-- -- EXECUTE dbo.ListarEmpleado

CREATE PROCEDURE dbo.ListarEmpleado
AS
BEGIN
	SET NOCOUNT ON;

	SELECT E.[Nombre], E.[Salario] FROM dbo.Empleado E
	-- ORDER BY E.[Nombre];
	ORDER BY SUBSTRING(E.[Nombre], CHARINDEX(' ', E.[Nombre]) + 1, LEN(E.[Nombre]) - CHARINDEX(' ', E.[Nombre]));

	SET NOCOUNT OFF;
END;
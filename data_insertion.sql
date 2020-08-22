/** Data Insertion**/
-- INSERT INTO Agencia() VALUES();
-- INSERT INTO Categoria() VALUES();
-- INSERT INTO Direccion() VALUES();
-- INSERT INTO Estado_Movimiento() VALUES();
-- INSERT INTO Estado_Operacion_() VALUES();
-- INSERT INTO Agencia() VALUES();
-- INSERT INTO Agencia() VALUES();
-- INSERT INTO Agencia() VALUES();
-- INSERT INTO Agencia() VALUES();
-- INSERT INTO Agencia() VALUES();
-- INSERT INTO Agencia() VALUES();
-- INSERT INTO Agencia() VALUES();
-- INSERT INTO Agencia() VALUES();
-- INSERT INTO Agencia() VALUES();
-- INSERT INTO Agencia() VALUES();
-- INSERT INTO Agencia() VALUES();


CREATE OR ALTER PROCEDURE NewClient
    @Primer_Nombre NVARCHAR(40),
    @Segundo_Nombre NVARCHAR(40),
    @Primer_Apellido NVARCHAR(40),
    @Segundo_Apellido NVARCHAR(40),
    @Genero TINYINT,
    @Fecha_Nac DATE,
    @Estado_Civil NVARCHAR(30),
    @Juridica BIT,
    @FK_Formacion_Educativa_ID TINYINT,
    @FK_Identificacion_ID NVARCHAR(30),
    @FK_Categoria_ID NVARCHAR(30),
    @DescripcionContacto NVARCHAR(80),
    @FK_Tipo_Mecanismo_ID TINYINT,
    @FK_Persona_ID TINYINT,
    @NameCategoria NVARCHAR(50),
    @NumeroIdentificacion INT,
    @FK_Tipo_Identificacion_ID,
    @DescripcionIdentificacion NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON
    INSERT ALL

    INTO Persona(Primer_Apellido, Segundo_Apellido, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID)
    VALUES (@Primer_Nombre, @Segundo_Nombre, @Primer_Apellido, @Segundo_Apellido,
    @Genero, @Fecha_Nac, @Estado_Civil, @Juridica, @FK_Formacion_Educativa_ID, @FK_Identificacion_ID, @FK_Categoria_ID)

    INTO Mecanismo_Contacto(Descripcion, FK_Tipo_Mecanismo_ID, FK_Persona_ID)
    VALUES (@Descripcion, @FK_Tipo_Mecanismo_ID, @FK_Persona_ID)

    INTO Categoria(Nombre)
    VALUES (@NameCategoria)

    INTO Identificacion(Numero, FK_Tipo_Identificacion_ID)
    VALUES(@NumeroIdentificacion, @FK_Tipo_Identificacion_ID)

    INSERT INTO Tipo_Identificacion(Descripcion)
    VALUES(@DescripcionIdentificacion)

END
GO






-- CREATE PROCEDURE LotsOfParams
-- (
--     @Param1 INT,
--     @Param2 INT,
--     @Param3 INT,
--     @Param4 INT=NULL,
--     @Param5 INT=0,
--     @Param6 INT=5
-- )
-- AS
-- PRINT 1;
-- GO
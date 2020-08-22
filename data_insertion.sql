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
    @FK_Identificacion_ID NVARCHAR(30), -- Podriamos usar SCOPE IDENTITY, ON IDENT, O, OUTPUT CLAUSE A LA HORA DE HACER EL INSERT
    @FK_Categoria_ID NVARCHAR(30),
    @DescripcionContacto NVARCHAR(80),
    @FK_Tipo_Mecanismo_ID TINYINT,
    @FK_Persona_ID TINYINT, -- Podriamos usar SCOPE IDENTITY, ON IDENT, O, OUTPUT CLAUSE A LA HORA DE HACER EL INSERT
    @NameCategoria NVARCHAR(50),
    @NumeroIdentificacion INT,
    @FK_Tipo_Identificacion_ID,
    @DescripcionIdentificacion NVARCHAR(50)
AS
BEGIN
	/*Tiene que ir en un batch. Tiene que ir en una transaccion esto
	 en un transaction
	 	
		BEGIN TRANSACTION

		ROLLBACK

		COMMIT TRANSACTION
	 */
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

--INSERTS Tipo_Identificacion
INSERT INTO Tipo_Identificacion (Descripcion) VALUES ('Física'), ('Juridica'), ('Residencial');

--INSERTS Identificacion


--INSERTS Personas
SELECT * FROM Persona
SELECT * FROM Identificacion
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Zwedru', 'Vonny', 'Whelpdale', 'Haysman', 2, '1993-02-15', 3, 1, 9, 5, 19);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Werota', 'Mattias', 'Brason', 'Petru', 3, '2002-10-04', 1, 1, 1, 6, 37);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Sebba', 'Zabrina', 'Petto', 'Rogeron', 1, '1975-05-20', 2, 0, 9, 7, 20);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Vynohradiv', 'Burnaby', 'Sellen', 'Simo', 2, '1972-10-11', 2, 0, 8, 5, 13);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Chuanbu', 'Stacee', 'Itzik', 'De Blase', 2, '1972-10-11', 5, 0, 8, 9, 28);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Jinta', 'Perri', 'Wisedale', 'Ottewell', 2, '1972-10-11', 6, 1, 8, 10, 5);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Tauranga', 'Penny', 'Hawtrey', 'Amoss', 2, '1972-10-13', 3, 1, 9, 11, 29);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Dalianwan', 'Philippine', 'Scrowston', 'Cicccitti', 3, '1972-10-11', 5, 1, 9, 45, 21);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Qagan Obo', 'Perren', 'Moggie', 'Imrie', 3, '1972-10-12', 1, 1, 2, 65, 39);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Aix-en-Provence', 'Gery', 'Chanders', 'Grahlman', 2, '1972-10-15', 5, 1, 9, 34, 23);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Hīrna', 'Lorry', 'Thickin', 'Fahy', 2, '1995-11-12', 2, 0, 1, 86, 14);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Khanu Woralaksaburi', 'Mildred', 'Bootland', 'Siward', 1, '1995-11-12', 2, 1, 4, 22, 23);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Yenagoa', 'Benson', 'Fass', 'Stannering', 1, '1995-12-11', 1, 1, 8, 14, 27);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Taocheng', 'Jammie', 'Zmitrichenko', 'Coltan', 2, '1995-12-11', 6, 1, 1, 15, 23);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Washington', 'Kimmi', 'Werrilow', 'Spilsburie', 3, '2001-11-11', 3, 0, 7, 16, 17);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Chitose', 'Elaine', 'Wand', 'Rozzell', 1, '1954-05-05', 6, 0, 6, 17, 15);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Vratsa', 'Demott', 'Ives', 'VanBrugh', 3, '1954-05-05', 3, 0, 5, 18, 48);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Khvatovka', 'Elizabet', 'Murcott', 'Abrahams', 1, '1954-05-05', 5, 1, 9, 19, 23);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Longhua', 'Daffi', 'Pleasants', 'Deluce', 3, '1954-05-05', 3, 1, 3, 20, 24);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Perth', 'Arley', 'Grossman', 'Bruckenthal', 1, '1954-05-05', 2, 0, 9, 21, 33);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Governador Valadares', 'Bamby', 'de Bullion', 'Hoolaghan', 1, '1954-05-05', 4, 1, 6, 22, 7);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Yangiobod', 'Jacquetta', 'Stallibrass', 'Treadger', 3, '1956-05-05', 3, 0, 3, 23, 49);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Torzhok', 'Ara', 'Brabyn', 'Marcone', 3, '1955-05-05', 3, 0, 9, 24, 24);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Kabor', 'Fanya', 'Kenwood', 'McKeeman', 3, '1957-05-05', 1, 0, 2, 25, 36);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Ipatinga', 'Maribeth', 'O''Kieran', 'Ferraretto', 3, '1958-05-05', 3, 1, 2, 26, 49);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Berlin', 'Shaine', 'Simpson', 'Frankland', 2, '1999-01-02', 4, 0, 6, 27, 11);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Lysice', 'Ellsworth', 'Edbrooke', 'Islep', 2, '1999-01-03', 6, 1, 4, 28, 2);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Oleszyce', 'Friedrich', 'Wincott', 'Blackham', 1, '1999-01-04', 5, 1, 9, 29, 18);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Pisão', 'Nonah', 'Bartoleyn', 'Aloshechkin', 1, '1999-01-05', 3, 1, 4, 30, 7);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Ozëry', 'Sawyere', 'Horburgh', 'Marousek', 3, '1999-01-06', 3, 1, 3, 31, 23);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Carmo do Cajuru', 'Maurene', 'Doveston', 'Broun', 2, '1999-02-07', 5, 0, 5, 32, 46);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Janów', 'Erwin', 'Lamberto', 'Plewes', 3, '1999-01-02', 3, 1, 4, 33, 26);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Pecna', 'Ella', 'Towl', 'Haisell', 1, '1999-01-02', 5, 0, 9, 34, 17);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Macayug', 'Carlen', 'McPartling', 'Cannaway', 2, '1995-01-02', 2, 0, 9, 35, 46);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Martaban', 'Hendrika', 'Loisi', 'Le Fevre', 1, '1994-01-02', 2, 1, 8, 36, 37);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Itabuna', 'Mandel', 'Fayerman', 'Dymidowski', 1, '1993-01-02', 2, 1, 2, 37, 14);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Padaran', 'Bernardine', 'Wrankmore', 'Quested', 3, '1992-01-02', 5, 0, 7, 38, 8);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Tiblawan', 'Donni', 'Spini', 'Nicolls', 3, '1985-12-12', 5, 0, 3, 39, 48);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('San Roque', 'Alister', 'Richardes', 'Danielut', 2, '1986-12-12', 4, 1, 6, 40, 39);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Radekhiv', 'Randy', 'Peacocke', 'Prestige', 2, '1986-12-12', 5, 0, 5, 41, 30);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Qümong', 'Jasmina', 'Button', 'Yexley', 1, '1986-12-12', 5, 0, 7, 42, 7);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Rasskazovo', 'Ken', 'Tomich', 'Greenhough', 3, '5/28/2005', 3, 0, 7, 43, 44);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Lubowidz', 'Dorisa', 'Maryin', 'Shelmerdine', 1, '3/25/1994', 6, 0, 1, 44, 16);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Yege', 'Wilt', 'Ochterlonie', 'Connock', 2, '4/10/1968', 1, 1, 6, 45, 33);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Chaiyaphum', 'Merl', 'Bather', 'Ashfull', 2, '7/31/1997', 6, 0, 4, 46, 14);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Säter', 'Quintus', 'Omar', 'Brandolini', 2, '6/3/1976', 6, 0, 7, 47, 6);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Amphawa', 'Chelsy', 'Whittock', 'Peartree', 2, '11/25/1965', 2, 0, 3, 48, 8);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Brody', 'Kath', 'Gloyens', 'Touzey', 1, '5/14/1982', 1, 1, 8, 49, 42);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Bajo', 'Valerye', 'Ladel', 'Urrey', 3, '2/10/1969', 3, 0, 7, 50, 7);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Seminole', 'Elyn', 'Egell', 'Cannon', 1, '9/12/1978', 2, 1, 4, 51, 40);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Taltal', 'Camile', 'Tuckley', 'Brend', 3, '9/20/1988', 2, 0, 8, 52, 13);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('San Antonio', 'Freddi', 'Gorges', 'Teligin', 2, '2/5/1975', 5, 1, 2, 53, 39);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Rio de Janeiro', 'Wilt', 'Eaglesham', 'Cattlow', 1, '1/13/1974', 3, 0, 2, 54, 24);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Mīrwāh Gorchani', 'Jude', 'Rene', 'Defont', 1, '7/24/1976', 6, 1, 8, 55, 49);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Jokkmokk', 'Roxine', 'Chitty', 'Getcliffe', 2, '11/4/1969', 6, 1, 9, 56, 19);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Wangqu', 'Jamil', 'Wisbey', 'Jorry', 3, '6/10/1991', 6, 0, 3, 57, 18);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Sampagar', 'Harley', 'Sibley', 'Salzberg', 3, '9/28/1999', 5, 0, 6, 58, 11);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Keboireng', 'Rick', 'Stagge', 'Thieme', 2, '4/17/1993', 6, 0, 4, 59, 33);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Garissa', 'Trixie', 'Cookney', 'Llop', 2, '4/27/1995', 1, 1, 7, 60, 44);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Suban Jeriji', 'Ayn', 'Chavrin', 'Probets', 3, '3/2/2005', 2, 1, 1, 61, 25);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Środa Wielkopolska', 'Preston', 'Laviss', 'Magauran', 1, '5/21/1984', 4, 0, 5, 62, 34);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Ganping', 'Genia', 'Pantone', 'Macey', 2, '1/11/1980', 3, 1, 5, 63, 44);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Cacheu', 'Aldon', 'Tunna', 'Gidley', 1, '10/19/2000', 3, 0, 8, 64, 22);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Huntsville', 'Brina', 'Noblet', 'Francomb', 3, '12/8/1995', 2, 1, 5, 65, 6);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Kondrovo', 'Stearne', 'Kulvear', 'Riply', 1, '10/3/2004', 5, 0, 6, 66, 31);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Jianqiao', 'Orsola', 'Rippin', 'Lidster', 1, '2/22/1980', 3, 1, 8, 67, 39);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Sult', 'Mack', 'Tosney', 'Raggles', 3, '4/11/1993', 2, 1, 6, 68, 49);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Gurupi', 'Pru', 'Boxill', 'Hurndall', 2, '6/18/2005', 3, 1, 9, 69, 17);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Maguan', 'Jaquith', 'Golder', 'Arkil', 1, '4/7/2001', 5, 0, 7, 70, 47);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Bilqās', 'Terence', 'Gason', 'Bugdall', 1, '7/29/1971', 5, 1, 9, 71, 17);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Wodzisław Śląski', 'Feliks', 'Roby', 'Gurney', 1, '11/25/1980', 4, 1, 2, 72, 50);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Wugong', 'Goldarina', 'Kobera', 'Date', 1, '10/20/1978', 3, 0, 3, 73, 7);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Zhutang', 'Dulcinea', 'Leuty', 'Dalziell', 1, '7/30/1990', 6, 0, 6, 74, 42);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Lantang', 'Carny', 'Greenhaugh', 'Vuitton', 3, '11/29/1965', 3, 1, 9, 75, 29);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Phan Thong', 'Shermy', 'Dollman', 'Carder', 2, '12/22/1969', 5, 0, 9, 76, 3);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Novi Zagreb', 'Dorine', 'Waggatt', 'Surguine', 1, '8/18/1977', 2, 1, 9, 77, 5);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Tilik', 'Chelsey', 'Meindl', 'Newlove', 3, '9/3/1998', 2, 0, 4, 78, 24);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Kými', 'Dietrich', 'Emtage', 'Berkowitz', 2, '10/6/1991', 4, 1, 3, 79, 25);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Pando', 'Curtis', 'Dennistoun', 'Ridwood', 3, '12/11/1965', 1, 0, 5, 80, 6);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Gaoshan', 'Bartholomew', 'Rosentholer', 'Lorenzini', 2, '2/15/1967', 6, 0, 8, 81, 47);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Wan’an', 'Wain', 'Serfati', 'Kurth', 1, '2/2/1984', 2, 0, 2, 82, 20);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Zhoukou', 'Audy', 'MacGown', 'Scollick', 2, '3/13/1981', 3, 1, 1, 83, 44);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Sepekov', 'Elfrida', 'Danzey', 'Blanc', 2, '7/18/1972', 3, 0, 5, 84, 17);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Wintzenheim', 'Luci', 'Priddy', 'Baldelli', 1, '2/7/1970', 4, 1, 5, 85, 9);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Semarang', 'Gabriello', 'Von Oertzen', 'Campsall', 3, '8/20/2003', 4, 0, 1, 86, 1);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Youssoufia', 'Hermon', 'Kix', 'Malia', 2, '10/6/1983', 6, 1, 1, 87, 2);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Zhongchao', 'Cornell', 'Aubin', 'Tebb', 3, '8/20/1997', 1, 0, 4, 88, 28);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Nóvita', 'Crosby', 'Bodega', 'Yanyushkin', 2, '7/13/1966', 6, 0, 1, 89, 25);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Bremerhaven', 'Milli', 'Derisley', 'Ferrai', 3, '8/19/1979', 4, 0, 7, 90, 33);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Nahuo', 'Broderick', 'Muddiman', 'Labbett', 3, '12/25/1984', 3, 0, 2, 91, 48);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Padurung', 'Sammie', 'Scoggan', 'Lowrance', 2, '5/31/1975', 4, 1, 3, 92, 14);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Barţa‘ah ash Sharqīyah', 'Ellswerth', 'McGorley', 'Shearston', 2, '12/29/1985', 1, 0, 1, 93, 47);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Petropavlivka', 'Tamarra', 'Duncombe', 'Griffitt', 1, '3/8/1983', 4, 0, 9, 94, 15);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Wuli', 'Bale', 'Barfitt', 'Deerness', 2, '2/11/1987', 2, 0, 6, 95, 28);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Karis', 'Carol-jean', 'Beidebeke', 'Prestage', 2, '11/28/1986', 6, 0, 1, 96, 49);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Gangbei', 'Decca', 'Kidsley', 'Roder', 1, '12/16/1993', 6, 0, 4, 97, 15);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Lopez Jaena', 'Bev', 'Udale', 'Commins', 1, '11/12/1977', 1, 1, 7, 98, 24);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Usman’', 'Klarika', 'Caulliere', 'Tamsett', 3, '10/4/1994', 6, 0, 8, 99, 15);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Kuaro', 'Ross', 'Revens', 'Rodd', 1, '2/5/1985', 5, 0, 4, 100, 2);

INSERT INTO Direccion VALUES 
('Lie1', 'Lie2', 454454, GETDATE(), 1, 1, 19),
('Line4', 'Line4', 452154, GETDATE(), 2, 3, 29),
('Line2', 'Line3', 452154, GETDATE(), 1, 1, 39),
('Line3', 'Lne4', 452154, GETDATE(), 1, 1, 40),
('Line6', 'Line5', 452154, GETDATE(), 1, 1, 9),
('Line7', 'Lne8', 454454, GETDATE(), 1, 1, 9),
('Line1', 'Line2', 454454, GETDATE(), 1, 1, 9),
('Cityfar', 'faraway', 454454, GETDATE(), 2, 3, 9),
('Srtr1', 'st2rr', 454454, GETDATE(), 1, 1, 9),
('str3', 'str5', 454284, GETDATE(), 2, 2, 22),
('strr6', 'str7', 454254, GETDATE(), 2, 2, 23),
('strr9', 'str8', 454454, GETDATE(), 2, 2, 24),
('Str1', 'str2', 454414, GETDATE(), 2, 2, 25),
('str3', 'str5', 454454, GETDATE(), 2, 2, 26),
('strr6', 'str7', 454954, GETDATE(), 2, 2, 28),
('strr9', 'str8', 454454, GETDATE(), 2, 2, 27),
('Str1', 'str2', 454454, GETDATE(), 2, 2, 27)


SELECT * FROM Persona
SELECT * FROM Direccion

SELECT * FROM Sitio_Web


INSERT INTO Sitio_Web VALUES
('ww3.test1.wev',75),
('ww3.test2.wev',74),
('ww3.test3.wev',73),
('ww3.test4.wev',72),
('ww3.test5.wev',71),
('ww3.test6.wev',70),
('ww3.test7.com',69),
('ww3.test8.com',68),
('ww3.test9.com',65),
('ww3.test10.com',66),
('ww2.test11.com',40),
('ww2.test12.com',71),
('ww2.test13.com',45),
('ww2.test24.com',55),
('ww2.test34.com',56),
('ww2.test43.com',56),
('ww2.test53.com',55),
('ww2.test66.com',54),
('ww2.test73.es',53),
('ww2.test86.com',52),
('ww1.test96.com',51),
('ww1.test1230.com',52),
('ww1.test121.com',50),
('ww1.test122.com',49),
('ww1.test1.com',66),
('ww1.test2.com',67),
('ww1.test3.com',68),
('ww1.test4.com',69),
('ww1.test5.com',69),
('ww1.test6.com',75),
('ww4.test7.com',75),
('ww4.test8.com',75),
('ww4.test9.com',75),
('ww4.test10.com',75),
('ww4.test11.com',75),
('ww4.test12.com',75),
('ww4.test13.com',75),
('ww4.test24.com',75),
('ww4.test34.com',75),
('ww4.test43.com',75),
('www.test53.com',75),
('www.test66.com',75),
('www.test73.com',75),
('www.test86.com',75),
('www.test96.com',75),
('www.test1230.com',75),
('www.test121.com',75),
('www.test122.com',75),
('www.test53.com',75),
('www.test66.com',75),
('www.test73.com',75),
('www.test86.com',75),
('www.test96.com',75),
('www.test1230.com',75),
('www.test121.com',75),
('www.test122.com',75)
SELECT * FROM Estado_Persona

INSERT INTO Tipo_Estado_Persona VALUES 
('Activo'),
('Inactivo')

INSERT INTO Estado_Persona VALUES
(GETDATE(), GETDATE(), 1, 74)

SELECT * FROM Tipo_Ingreso

INSERT INTO Estado_Persona VALUES
(GETDATE(), GETDATE(), 1, 74),
(GETDATE(), GETDATE(), 2, 74),
(GETDATE(), GETDATE(), 2, 74),
(GETDATE(), GETDATE(), 1, 74),
(GETDATE(), GETDATE(), 2, 73),
(GETDATE(), GETDATE(), 1, 75),
(GETDATE(), GETDATE(), 2, 72),
(GETDATE(), GETDATE(), 1, 71),
(GETDATE(), GETDATE(), 1, 76),
(GETDATE(), GETDATE(), 2, 78),
(GETDATE(), GETDATE(), 2, 77),
(GETDATE(), GETDATE(), 1, 70),
(GETDATE(), GETDATE(), 2, 71),
(GETDATE(), GETDATE(), 2, 70),
(GETDATE(), GETDATE(), 1, 60),
(GETDATE(), GETDATE(), 1, 50),
(GETDATE(), GETDATE(), 1, 9),
(GETDATE(), GETDATE(), 1, 9),
(GETDATE(), GETDATE(), 1, 9),
(GETDATE(), GETDATE(), 1, 9),
(GETDATE(), GETDATE(), 1, 74),
(GETDATE(), NULL, 1, 74),
(GETDATE(), NULL, 2, 77),
(GETDATE(), NULL, 1, 78),
(GETDATE(), NULL, 1, 74),
(GETDATE(), NULL, 2, 77),
(GETDATE(), NULL, 1, 78),
(GETDATE(), NULL, 1, 24),
(GETDATE(), NULL, 2, 25),
(GETDATE(), NULL, 1, 79),
(GETDATE(), NULL, 1, 28),
(GETDATE(), NULL, 2, 80),
(GETDATE(), NULL, 1, 81),
(GETDATE(), NULL, 1, 77),
(GETDATE(), NULL, 2, 72),
(GETDATE(), NULL, 1, 72),
(GETDATE(), NULL, 1, 71),
(GETDATE(), NULL, 2, 74),
(GETDATE(), NULL, 1, 75),
(GETDATE(), NULL, 1, 26),
(GETDATE(), NULL, 2, 27),
(GETDATE(), NULL, 1, 77),
(GETDATE(), NULL, 1, 29),
(GETDATE(), NULL, 2, 80),
(GETDATE(), NULL, 1, 59)

SELECT * FROM Tipo_Mecanismo
INSERT INTO Tipo_Mecanismo VALUES
('Telefono Domicilio'),
('Telefono Trabajo'),
('Telefono Vacaciones'),
('Telefono Familiar 1'),
('Telefono Familiar 2'),
('Telefono Familiar 3'),
('Telefono Familiar 4'),
('Telefono Familiar 5'),
('Telefono Familiar 6'),
('Telefono Familiar 7'),
('Telefono Familiar 8'),
('Telefono Familiar 9'),
('Telefono Empleado 1'),
('Telefono Empleado 2'),
('Telefono Empleado 3'),
('Telefono Empleado 4'),
('Telefono Empleado 5'),
('Telefono Empleado 6'),
('Telefono Empleado 7'),
('Telefono Empleado 8'),
('Telefono Empleado 9'),
('Telefono Conocido 1'),
('Telefono Conocido 2'),
('Telefono Conocido 3'),
('Telefono Conocido 4'),
('Telefono Conocido 5'),
('Telefono Conocido 6'),
('Telefono Conocido 7'),
('Telefono Conocido 8'),
('Telefono Conocido 9'),
('Telefono Conocido 9'),
('Correo Electronico 1'),
('Correo Electronico 2'),
('Correo Electronico 3'),
('Correo Electronico 4'),
('Correo Electronico 5'),
('Correo Electronico 6'),
('Correo Electronico 7'),
('Correo Electronico 8'),
('Correo Electronico 9'),
('Correo Electronico 9'),
('Correo Fisico 1'),
('Correo Fisico 2'),
('Correo Fisico 3'),
('Correo Fisico 4'),
('Correo Fisico 5'),
('Correo Fisico 6'),
('Correo Fisico 7'),
('Correo Fisico 8'),
('Correo Fisico 9'),
('Correo Fisico 9')
SELECT * FROM Mecanismo_Contacto

INSERT INTO Mecanismo_Contacto VALUES
('12345678', 1, 9),
('11111111', 1, 9),
('22222222', 1, 9),
('33333333', 1, 9),
('44444444', 1, 9),
('55555555', 1, 9),
('12345678', 1, 9),
('11111111', 1, 9),
('22222222', 1, 9),
('33333333', 1, 9),
('44444444', 1, 9),
('55555555', 1, 9)

INSERT INTO Persona_Tipo VALUES
(9,3),
(10,3),
(11,3),
(12,3),
(14,3),
(13,3),
(21,2),
(22,1),
(23,1),
(24,1),
(25,1),
(26,1),
(27,1),
(28,1),
(29,1),
(30,1),
(31,1),
(32,1),
(33,1),
(34,1),
(35,1),
(49,1),
(37,1),
(38,1),
(39,1),
(40,1),
(41,1),
(42,1),
(43,1),
(44,1),
(45,1),
(46,2),
(47,2),
(48,1),
(50,2)
INSERT INTO Persona_Tipo VALUES
(52,2),
(53,2),
(54,2),
(55,2),
(56,2),
(58,2),
(59,2),
(60,2),
(61,2),
(63,2),
(64,2),
(65,2),
(66,2),
(67,2),
(68,2),
(69,2),
(70,2),
(71,2),
(72,2)

-- Create a new stored procedure called 'NuevoCliente' in schema 'dbo'
-- Drop the stored procedure if it already exists
IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'NuevoCliente'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE dbo.NuevoCliente
GO
-- Create the stored procedure in the specified schema
CREATE PROCEDURE dbo.NuevoCliente
    @Primer_Nombre /*parameter name*/  NVARCHAR(40) /*default_value_for_param1*/
    ,@Segundo_Nombre /*parameter name*/ NVARCHAR(40)/*default_value_for_param2*/
    ,@Primer_Apellido /*parameter name*/  NVARCHAR(40) /*default_value_for_param1*/
    ,@Segundo_Apellido /*parameter name*/ NVARCHAR(40)/*default_value_for_param2*/
    ,@Genero /*parameter name*/ TINYINT/*default_value_for_param2*/
    ,@Fecha_Nac DATE 
	,@Estado_Civil INT
	,@Juridica BIT  
	,@FK_Formacion_Educativa_ID TINYINT
	,@FK_Identificacion_ID INT 
	,@FK_Categoria_ID SMALLINT
    ,@Linea1 NVARCHAR(50)
    ,@Linea2 NVARCHAR(50)
    ,@Zipcode INT
    ,@Fecha_Inicio DATE
    ,@FK_Tipo_Direccion_ID INT
    ,@FK_Geografia_ID INT
    ,@Descripcion nvarchar(80)
	,@FK_Tipo_Mecanismo_ID TINYINT
	,@FK_Persona_ID INT
    
-- add more stored procedure parameters here
AS
    BEGIN TRANSACTION
    PRINT 'Ingresando Cliente...'
        INSERT INTO Persona VALUES (
     @Primer_Nombre 
    ,@Segundo_Nombre 
    ,@Primer_Apellido 
    ,@Segundo_Apellido 
    ,@Genero 
    ,@Fecha_Nac 
	,@Estado_Civil
	,@Juridica 
	,@FK_Formacion_Educativa_ID
	,@FK_Identificacion_ID
	,@FK_Categoria_ID

            
    )
    DECLARE @PersonaID INT
    SET @PersonaID = SCOPE_IDENTITY() 

    INSERT INTO Direccion VALUES(
    @Linea1 
    ,@Linea2 
    ,@Zipcode
    ,@Fecha_Inicio 
    ,@FK_Tipo_Direccion_ID 
    ,@FK_Geografia_ID 
    ,@PersonaID 

    )

    INSERT INTO Mecanismo_Contacto VALUES(
        @Descripcion 
	    ,1
	    ,@PersonaID 
    )
   
    COMMIT TRANSACTION
    PRINT 'Cliente ingresado exitosamente'
    
GO
-- example to execute the stored procedure we just created
/*DECLARE @Now DATE
SET @Now = GETDATE()
EXECUTE dbo.NuevoCliente 'Thomas', 'Samos', 'Robinson', 'Roderick',1,@Now,1,1,
2,4,6,'Linea 1', 'Linea 2', 36582, @Now, 1, 1, '88777744', 1, 2
GO*/

-- Create a new stored procedure called 'usp_Info_Cliente' in schema 'dbo'
-- Drop the stored procedure if it already exists
IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'usp_Info_Cliente'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE dbo.usp_Info_Cliente
GO
-- Create the stored procedure in the specified schema
CREATE OR ALTER PROCEDURE dbo.usp_Info_Cliente
     @clienteId INT /*default_value_for_param1*/
-- add more stored procedure parameters here
AS
    -- body of the stored procedure
    SELECT TOP 1
    Primer_Nombre
    ,Segundo_Nombre
    ,Primer_Apellido
    ,Segundo_Apellido
    ,FechaInicio
    ,contacto.Descripcion

    ,tipoestadopersona.Nombre

     FROM v_Persona as persona
     
    INNER JOIN v_Estado_Persona
        ON persona.ID = v_Estado_Persona.FK_Persona_ID
    INNER JOIN v_Mecanismo_Contacto AS contacto
        ON persona.ID = contacto.FK_Persona_ID
    INNER JOIN v_Tipo_Estado_Persona AS tipoestadopersona
        ON v_Estado_Persona.FK_Tipo_Estado_ID = tipoestadopersona.ID
    WHERE persona.ID = @clienteId
    ORDER BY v_Estado_Persona.FechaInicio DESC
     
GO

-- example to execute the stored procedure we just created
EXECUTE dbo.usp_Info_Cliente 9
GO

ALTER TABLE Direccion ADD INDEX ix_FK_Persona_ID
HASH (FK_Persona_ID) WITH (BUCKET_COUNT = 64); -- Nonunique.
GO
ALTER TABLE Estado_Persona ADD INDEX ix_FK_Persona_ID
HASH (FK_Persona_ID) WITH (BUCKET_COUNT = 64); -- Nonunique.
GO
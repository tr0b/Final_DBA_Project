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
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Huqiu', 'Baryram', 'Bauduccio', 'Falconar', 1, '2/27/1989', 1, 1, 2, 1, 24);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Zwedru', 'Vonny', 'Whelpdale', 'Haysman', 2, '2/3/1993', 3, 1, 9, 2, 19);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Werota', 'Mattias', 'Brason', 'Petru', 3, '2/10/2002', 1, 1, 1, 3, 37);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Sebba', 'Zabrina', 'Petto', 'Rogeron', 1, '7/3/1975', 2, 0, 9, 4, 20);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Vynohradiv', 'Burnaby', 'Sellen', 'Simo', 2, '10/25/1972', 2, 0, 6, 5, 13);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Chuanbu', 'Stacee', 'Itzik', 'De Blase', 2, '1/18/1972', 5, 0, 8, 6, 28);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Jinta', 'Perri', 'Wisedale', 'Ottewell', 2, '11/26/1980', 6, 1, 8, 7, 5);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Tauranga', 'Penny', 'Hawtrey', 'Amoss', 2, '11/16/1975', 3, 1, 9, 8, 29);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Dalianwan', 'Philippine', 'Scrowston', 'Cicccitti', 3, '9/6/1990', 5, 1, 9, 9, 21);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Qagan Obo', 'Perren', 'Moggie', 'Imrie', 3, '12/24/1974', 1, 1, 2, 10, 39);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Aix-en-Provence', 'Gery', 'Chanders', 'Grahlman', 2, '1/7/1970', 5, 1, 9, 11, 23);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Hīrna', 'Lorry', 'Thickin', 'Fahy', 2, '12/11/1995', 2, 0, 1, 12, 14);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Khanu Woralaksaburi', 'Mildred', 'Bootland', 'Siward', 1, '8/15/1982', 2, 1, 4, 13, 23);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Yenagoa', 'Benson', 'Fass', 'Stannering', 1, '6/7/1998', 1, 1, 8, 14, 27);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Taocheng', 'Jammie', 'Zmitrichenko', 'Coltan', 2, '9/16/1994', 6, 1, 1, 15, 23);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Washington', 'Kimmi', 'Werrilow', 'Spilsburie', 3, '8/29/1965', 3, 0, 7, 16, 17);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Chitose', 'Elaine', 'Wand', 'Rozzell', 1, '6/25/1979', 6, 0, 6, 17, 15);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Vratsa', 'Demott', 'Ives', 'VanBrugh', 3, '1/30/1967', 3, 0, 5, 18, 48);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Khvatovka', 'Elizabet', 'Murcott', 'Abrahams', 1, '5/2/1983', 5, 1, 9, 19, 23);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Longhua', 'Daffi', 'Pleasants', 'Deluce', 3, '8/29/1995', 3, 1, 3, 20, 24);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Perth', 'Arley', 'Grossman', 'Bruckenthal', 1, '12/14/1967', 2, 0, 9, 21, 33);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Governador Valadares', 'Bamby', 'de Bullion', 'Hoolaghan', 1, '2/26/2001', 4, 1, 6, 22, 7);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Yangiobod', 'Jacquetta', 'Stallibrass', 'Treadger', 3, '1/18/2001', 3, 0, 3, 23, 49);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Torzhok', 'Ara', 'Brabyn', 'Marcone', 3, '11/8/1984', 3, 0, 9, 24, 24);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Kabor', 'Fanya', 'Kenwood', 'McKeeman', 3, '5/13/1993', 1, 0, 2, 25, 36);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Ipatinga', 'Maribeth', 'O''Kieran', 'Ferraretto', 3, '9/24/1979', 3, 1, 2, 26, 49);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Berlin', 'Shaine', 'Simpson', 'Frankland', 2, '9/7/1987', 4, 0, 6, 27, 11);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Lysice', 'Ellsworth', 'Edbrooke', 'Islep', 2, '7/1/1968', 6, 1, 4, 28, 2);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Oleszyce', 'Friedrich', 'Wincott', 'Blackham', 1, '7/13/1967', 5, 1, 9, 29, 18);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Pisão', 'Nonah', 'Bartoleyn', 'Aloshechkin', 1, '3/20/1991', 3, 1, 4, 30, 7);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Ozëry', 'Sawyere', 'Horburgh', 'Marousek', 3, '3/3/1999', 3, 1, 3, 31, 23);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Carmo do Cajuru', 'Maurene', 'Doveston', 'Broun', 2, '3/23/1989', 5, 0, 5, 32, 46);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Janów', 'Erwin', 'Lamberto', 'Plewes', 3, '7/6/1986', 3, 1, 4, 33, 26);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Pecna', 'Ella', 'Towl', 'Haisell', 1, '12/4/1971', 5, 0, 9, 34, 17);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Macayug', 'Carlen', 'McPartling', 'Cannaway', 2, '1/1/2003', 2, 0, 9, 35, 46);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Martaban', 'Hendrika', 'Loisi', 'Le Fevre', 1, '9/22/2004', 2, 1, 8, 36, 37);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Itabuna', 'Mandel', 'Fayerman', 'Dymidowski', 1, '10/3/1971', 2, 1, 2, 37, 14);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Padaran', 'Bernardine', 'Wrankmore', 'Quested', 3, '8/1/1972', 5, 0, 7, 38, 8);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Tiblawan', 'Donni', 'Spini', 'Nicolls', 3, '11/26/1981', 5, 0, 3, 39, 48);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('San Roque', 'Alister', 'Richardes', 'Danielut', 2, '11/6/2000', 4, 1, 6, 40, 39);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Radekhiv', 'Randy', 'Peacocke', 'Prestige', 2, '8/21/1997', 5, 0, 5, 41, 30);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Qümong', 'Jasmina', 'Button', 'Yexley', 1, '4/25/1984', 5, 0, 7, 42, 7);
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

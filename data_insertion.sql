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


--INSERTS Personas
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Emmery', 'Ulrike', 'Frenzl', 'Parade', 2, '9/30/2000', 1, 1, 6, 110376228, 45);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Berte', 'Ondrea', 'Killiam', 'Greenan', 1, '7/25/1984', 3, 1, 5, 301095476, 19);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Dorisa', 'Leslie', 'Crepel', 'Duff', 2, '3/13/1980', 1, 0, 4, 468955398, 32);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Jeff', 'Abbot', 'Cronshaw', 'Silveston', 2, '10/17/1966', 1, 1, 4, 153117495, 31);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Jerri', 'Sibeal', 'Burren', 'Hansom', 3, '1/30/1988', 2, 0, 3, 415998941, 39);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Sylvia', 'Roger', 'Mumbey', 'Stellino', 3, '8/30/1992', 1, 0, 2, 262483864, 8);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Beryl', 'Hakeem', 'Woodlands', 'Shrimpling', 1, '4/30/1976', 4, 0, 3, 614922703, 11);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Wolfgang', 'Davita', 'Rafe', 'Tatlowe', 1, '11/28/1978', 6, 0, 7, 671581146, 8);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Dosi', 'Lambert', 'Lyte', 'Willmot', 2, '9/9/1976', 1, 0, 7, 514246887, 28);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Lib', 'Bail', 'Thoumasson', 'MacMeekan', 1, '7/1/1985', 2, 0, 2, 457734353, 22);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Thibaud', 'Rayna', 'Chrishop', 'Kiddey', 2, '4/17/1983', 4, 0, 9, 582882666, 11);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Viva', 'Ottilie', 'Chadbourne', 'Paolucci', 2, '9/22/1992', 5, 1, 3, 241031775, 19);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Benito', 'Rafaela', 'Ricci', 'Betty', 3, '10/19/1969', 6, 1, 7, 437280255, 21);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Tremain', 'Dyna', 'Headford', 'Phateplace', 2, '9/8/1983', 5, 1, 4, 347757942, 38);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Garold', 'Nanette', 'Kincla', 'Stratley', 1, '12/11/1980', 4, 1, 9, 145378505, 18);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Eadith', 'Joachim', 'Klas', 'Arne', 1, '7/4/1980', 5, 0, 7, 264004431, 27);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Harman', 'Robyn', 'Gumery', 'Ruller', 1, '10/12/1971', 1, 0, 7, 245821781, 35);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Roger', 'Lorette', 'Legh', 'Clews', 3, '4/26/1991', 1, 1, 3, 409802523, 48);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Sara-ann', 'Helen-elizabeth', 'Maykin', 'Pressnell', 2, '9/6/1978', 4, 0, 4, 500336469, 49);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Donnajean', 'Hannis', 'Casol', 'Paulton', 1, '11/28/1975', 4, 0, 7, 165407611, 17);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Dione', 'Dorris', 'Peaurt', 'Espinosa', 1, '6/18/1991', 3, 0, 5, 737425201, 25);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Anabelle', 'Nicola', 'Rouchy', 'Langcastle', 2, '4/14/1999', 3, 1, 9, 347794431, 27);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Mahmud', 'Sabine', 'Knee', 'McGoldrick', 2, '1/12/1986', 1, 0, 1, 518363294, 40);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Antonietta', 'Perry', 'Regorz', 'Gandrich', 3, '2/16/2003', 4, 1, 3, 675556302, 42);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Broderick', 'Andre', 'Janata', 'Loutheane', 2, '5/26/2003', 2, 0, 2, 704199648, 49);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Stillmann', 'Corbie', 'Derr', 'Brownfield', 1, '4/6/1980', 5, 1, 3, 161707192, 43);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Petey', 'Peta', 'Berg', 'McNelly', 1, '11/22/1997', 4, 1, 7, 530558382, 20);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Marris', 'Leonora', 'Shapera', 'Kidman', 1, '1/14/2004', 5, 0, 4, 379464036, 2);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Todd', 'Yolanthe', 'Nayshe', 'Agirre', 1, '1/3/1975', 5, 0, 2, 769213866, 30);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Martainn', 'Augy', 'Pearl', 'Moriarty', 2, '6/22/1985', 1, 1, 2, 122138609, 18);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Hillary', 'Marylee', 'Spriggin', 'Stubbin', 1, '10/31/1999', 1, 1, 3, 537064239, 22);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Caren', 'Dominick', 'Whanstall', 'Hedworth', 3, '6/22/2000', 2, 0, 7, 147877681, 16);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Whitby', 'Cherilyn', 'Simmell', 'Caunt', 2, '6/18/1990', 1, 1, 3, 535557351, 40);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Christabel', 'Cass', 'Hancke', 'Jermey', 2, '7/7/2001', 5, 0, 2, 421559099, 7);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Kimbell', 'Randa', 'Pringell', 'Juckes', 1, '7/19/1972', 3, 1, 7, 656080577, 38);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Adella', 'Dynah', 'Strete', 'Lomen', 2, '6/26/1993', 5, 0, 4, 302405150, 17);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Teressa', 'Vittorio', 'Verdie', 'Quarrington', 2, '1/19/2001', 3, 0, 8, 570668231, 29);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Griffith', 'Ora', 'Michelotti', 'Pidcock', 2, '10/28/1995', 6, 1, 9, 194542858, 4);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Joletta', 'Sharity', 'Liversidge', 'Astlet', 3, '3/30/1993', 1, 1, 6, 443432060, 9);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Jori', 'Ferrel', 'Headland', 'Thon', 1, '3/17/1997', 6, 1, 7, 290592502, 43);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Lulita', 'Gene', 'Ciardo', 'Learman', 2, '8/7/1979', 6, 0, 6, 205602529, 12);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Sayer', 'Gene', 'Whalebelly', 'Moreby', 3, '11/4/1976', 1, 0, 8, 347819003, 35);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Dimitri', 'Katherine', 'D''Ambrogi', 'Feighry', 3, '9/16/1969', 4, 1, 2, 440122891, 27);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Briggs', 'Joanna', 'Parres', 'Kirby', 2, '6/29/2003', 6, 0, 1, 510584522, 3);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Ranna', 'Edmon', 'Barthel', 'O''Connolly', 2, '7/21/2001', 4, 1, 2, 663769657, 8);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Alex', 'Abigael', 'Goozee', 'Benterman', 3, '8/5/2002', 6, 1, 6, 197260988, 34);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Shane', 'Venus', 'Furzer', 'Wiffill', 3, '4/15/1978', 3, 0, 4, 516139739, 6);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Anthiathia', 'Kurtis', 'Shwenn', 'Mulholland', 2, '1/12/2000', 2, 0, 8, 586294430, 1);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Towny', 'Margette', 'Clorley', 'Robardley', 3, '11/15/1976', 5, 1, 6, 220327782, 20);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Ignatius', 'Judy', 'Meldrum', 'Dimsdale', 3, '12/19/1970', 1, 1, 9, 763668348, 35);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Thelma', 'Micki', 'Ketch', 'Brabham', 2, '4/19/1988', 1, 0, 5, 461141035, 19);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Jere', 'Cinda', 'Kobierra', 'Corday', 2, '2/12/2001', 6, 1, 6, 445138321, 37);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Nadia', 'Freddie', 'Devennie', 'Beetlestone', 3, '4/3/1991', 1, 1, 3, 310876913, 36);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Allyn', 'Julieta', 'Faber', 'Scawen', 2, '10/26/2002', 4, 1, 8, 682942916, 19);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Shem', 'Julianne', 'Daykin', 'Force', 3, '12/20/2000', 1, 1, 3, 241629960, 32);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Tanner', 'Silvester', 'Guerner', 'Kerfoot', 2, '12/18/1990', 6, 0, 8, 715750447, 28);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Mariellen', 'Valentine', 'Paradise', 'Jorcke', 3, '5/30/2000', 5, 0, 5, 658885609, 32);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Hallie', 'Mellie', 'Gerry', 'Rivitt', 1, '2/24/1986', 5, 1, 4, 613776940, 37);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Mureil', 'Yorke', 'Klulicek', 'Wellbank', 1, '4/25/1986', 5, 0, 6, 253205713, 43);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Betsey', 'Inglis', 'Redhole', 'Franchi', 1, '2/27/1971', 6, 0, 5, 799019613, 8);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Lorrin', 'Odette', 'Edds', 'Urlich', 2, '11/10/1974', 6, 0, 6, 502288529, 49);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Bari', 'Iggie', 'Coppledike', 'Fishby', 2, '2/6/1978', 5, 0, 3, 221228950, 26);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Dukey', 'Lisha', 'Ivic', 'Scarff', 1, '4/30/1970', 5, 0, 7, 700760887, 33);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Brewster', 'Baxy', 'Fullstone', 'Voyce', 2, '12/16/1970', 6, 0, 1, 143033822, 33);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Bernard', 'Geoffry', 'Djordjevic', 'Beelby', 3, '7/19/1988', 6, 1, 9, 222582358, 40);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Alayne', 'Feodora', 'Jinks', 'Sherewood', 2, '10/29/1980', 2, 1, 4, 102551903, 26);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Zahara', 'Sukey', 'Smallwood', 'Lowles', 3, '5/9/1987', 4, 0, 7, 449910029, 12);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Alex', 'Koenraad', 'Kirwan', 'Threadgall', 1, '9/25/1981', 3, 0, 2, 473535894, 4);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Early', 'Elsi', 'Scrowson', 'Slot', 1, '10/23/1997', 1, 0, 3, 473956956, 50);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Ralf', 'Jeane', 'Sinnat', 'Duplock', 2, '4/22/1981', 2, 0, 6, 380660063, 34);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Pet', 'Cynthie', 'McNiven', 'Cordeix', 2, '1/7/1978', 2, 0, 1, 431444036, 25);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Wilek', 'Gayleen', 'Stait', 'Rearie', 1, '7/8/1968', 4, 0, 9, 135307687, 9);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Wally', 'Anatole', 'Hebborn', 'Schmuhl', 2, '6/26/1978', 5, 1, 6, 762975430, 28);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Devon', 'Cally', 'Tallent', 'Rolling', 1, '4/7/1982', 6, 1, 3, 697607047, 41);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Michele', 'Berri', 'Tunnacliffe', 'Iveagh', 2, '11/27/1988', 3, 1, 3, 414156985, 38);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Brittany', 'Ximenez', 'Rusk', 'Binion', 1, '5/21/1995', 5, 0, 7, 656471466, 42);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Prudence', 'Rutledge', 'Gaskoin', 'Threadgould', 1, '1/3/1984', 5, 0, 2, 290765053, 14);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Eleni', 'Dael', 'Toye', 'McQuarter', 2, '1/7/1974', 4, 0, 4, 325848437, 30);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Jules', 'Thorvald', 'Roback', 'Colbron', 2, '1/14/1999', 5, 0, 1, 467736817, 18);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Hendrick', 'Tim', 'Stirtle', 'Levesque', 2, '2/29/1996', 4, 0, 4, 748456377, 31);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Danni', 'Llewellyn', 'Mowle', 'Kennedy', 3, '1/19/1973', 6, 1, 5, 379715326, 31);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Jeannine', 'Barnie', 'Schimke', 'Derrell', 3, '8/25/1972', 1, 1, 6, 501238956, 32);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Odell', 'Quinton', 'Ciabatteri', 'Glabach', 1, '12/30/1968', 6, 1, 6, 499988154, 39);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Kacy', 'Zuzana', 'Hartridge', 'Donwell', 2, '2/26/1997', 1, 1, 4, 742969992, 2);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Drusie', 'Bride', 'Yaxley', 'Konzelmann', 2, '6/19/1988', 3, 1, 3, 427599008, 2);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Faye', 'Robbie', 'Roalfe', 'Rumgay', 3, '1/25/1983', 4, 1, 1, 692979049, 15);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Luigi', 'Carlen', 'Matthiesen', 'Rabbe', 1, '10/2/1970', 4, 1, 6, 369680155, 17);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Feliza', 'Danell', 'Gabbot', 'Torricella', 2, '7/1/2003', 5, 1, 2, 562234692, 36);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Erny', 'Vance', 'Sylett', 'Owens', 3, '12/11/1988', 2, 1, 6, 170926110, 41);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Peg', 'Essa', 'Origan', 'Slyford', 3, '6/16/1983', 4, 0, 1, 258679388, 18);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Gabe', 'Joellyn', 'Strutton', 'Durrett', 1, '3/18/1973', 1, 1, 9, 105638709, 22);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Dannie', 'Natalina', 'Bewshaw', 'Baldi', 2, '1/13/1994', 2, 1, 9, 554559099, 34);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Barney', 'Friederike', 'Kenneford', 'Vernazza', 3, '11/10/1994', 4, 1, 1, 617637772, 26);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Jasper', 'Marita', 'Ovize', 'Embery', 2, '5/11/1967', 2, 1, 8, 624110763, 45);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Trent', 'Regine', 'Vaughan-Hughes', 'Ingledew', 1, '2/4/1975', 4, 1, 8, 767859752, 22);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Anestassia', 'Darbie', 'Parcell', 'Haggar', 2, '5/27/1979', 1, 1, 7, 305154312, 35);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Abie', 'Agustin', 'Cremer', 'Hansard', 2, '4/3/1989', 1, 0, 7, 223296275, 33);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Nikki', 'Jacquette', 'Jorry', 'Stacy', 1, '1/1/1968', 1, 1, 9, 352225180, 43);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Brady', 'Arielle', 'Quaife', 'Vinecombe', 3, '5/18/1972', 4, 1, 6, 739228313, 32);
INSERT INTO Persona (Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Genero, Fecha_Nac, Estado_Civil, Juridica, FK_Formacion_Educativa_ID, FK_Identificacion_ID, FK_Categoria_ID) VALUES ('Nevins', 'Kalie', 'Tapscott', 'Kummerlowe', 1, '5/17/1981', 6, 0, 4, 338721722, 32);

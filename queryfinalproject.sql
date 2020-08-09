USE master
CREATE DATABASE dbBanco
USE dbBanco

CREATE TABLE Tipo_Persona(
	ID TINYINT PRIMARY KEY IDENTITY(1,1)
	,Nombre nvarchar(50)
)
GO
CREATE TABLE Formacion_Educativa(
	ID INT PRIMARY KEY IDENTITY(1,1)
	,Descripcion nvarchar(50)
)
GO
CREATE TABLE Tipo_Mecanismo(
	ID TINYINT PRIMARY KEY IDENTITY(1,1)
	,Descripcion nvarchar(50)
)
GO
CREATE TABLE Persona(
	ID INT PRIMARY KEY IDENTITY(1,1) NOT NULL
	,Primer_Nombre nvarchar(40) NOT NULL
	,Segundo_Nombre nvarchar(40) NULL
	,Primer_Apellido nvarchar(40) NOT NULL
	,Segundo_Apellido nvarchar(40) NULL
	,Genero TINYINT NULL
	,Fecha_Nac DATE NOT NULL
	,Estado_Civil INT NULL
	,Juridica BIT NOT NULL 
)
GO
CREATE TABLE Tipo_Estado_Persona(
	ID TINYINT PRIMARY KEY IDENTITY(1,1)
	,Nombre nvarchar(50)
)
GO
CREATE TABLE Estado_Persona(
	ID INT PRIMARY KEY IDENTITY(1,1)
	,FechaInicio DATETIME
	,FechaFin DATETIME
	,FK_Tipo_Estado_Persona_ID TINYINT
	,FK_Persona_ID INT
)
GO
CREATE TABLE Mecanismo_Contacto(
	ID INT PRIMARY KEY IDENTITY(1,1)
	,Descripcion nvarchar(80)
	,FK_Tipo_Mecanismo_ID TINYINT
	,FK_Persona_ID INT
)
GO
CREATE TABLE Moneda(
	ID INT PRIMARY KEY IDENTITY(1,1)
	,Nombre nvarchar(50)
	,IsoAlpha3 nvarchar(3)
)
GO
CREATE TABLE Agencia(
	ID INT PRIMARY KEY IDENTITY(1,1)
	,Descripcion nvarchar(80)
)
GO
CREATE TABLE Tipo_Geografia(
	ID TINYINT PRIMARY KEY IDENTITY(1,1)
	,Nombre nvarchar(50)
)
GO
CREATE TABLE Tipo_Ingreso(
	ID TINYINT PRIMARY KEY IDENTITY(1,1)
	,Nombre nvarchar(50)
	,IsoAlpha3 nvarchar(3)
)
GO
CREATE TABLE Ingreso(
	ID TINYINT PRIMARY KEY IDENTITY(1,1) NOT NULL
	,Monto money
	,Planilla BIT
	,FK_Persona_ID INT
)
GO
CREATE TABLE Tipo_Direccion(
	ID TINYINT PRIMARY KEY IDENTITY(1,1)
	,Nombre nvarchar(50)
)
GO
CREATE TABLE Geografia(
	ID INT PRIMARY KEY IDENTITY(1,1)
	,Nombre nvarchar(50)
	,FK_GeografiaID INT
	,FK_TipoGeografiaID TINYINT
)
GO
CREATE TABLE Direccion(
	ID INT PRIMARY KEY IDENTITY(1,1)
	,Linea1 nvarchar(50)
	,Linea2 nvarchar(50)
	,Zipcode SMALLINT
	,FechaInicio DATE
	,FK_Tipo_Direccion_ID INT
	,FK_Geografia_ID INT
	,FK_Persona_ID INT
)
GO
CREATE TABLE Tipo_Identificacion(
	ID TINYINT PRIMARY KEY IDENTITY(1,1)
	,Descripcion nvarchar(50)
)
GO
CREATE TABLE Identificacion(
	ID INT PRIMARY KEY IDENTITY(1,1)
	,Numero INT
	,FK_Tipo_Identificacion TINYINT
)
GO
CREATE TABLE Categorias(
	ID INT PRIMARY KEY IDENTITY(1,1)
	,Nombre nvarchar(50)
)
GO
CREATE TABLE Tipo_Relacion(
	ID SMALLINT PRIMARY KEY IDENTITY(1,1)
	,Descripcion nvarchar(50)
)
GO
CREATE TABLE Relacion(
	ID INT PRIMARY KEY IDENTITY(1,1) NOT NULL
	,FK_Persona1_ID INT NOT NULL
	,FK_Persona2_ID INT NOT NULL
	,FK_Tipo_Relacion SMALLINT NOT NULL
)
GO
CREATE TABLE Sitio_Web(
	ID INT PRIMARY KEY IDENTITY(1,1) NOT NULL
	,Descripcion nvarchar(200) NOT NULL
	,FK_Persona_ID INT NOT NULL
)
GO
CREATE TABLE Naturaleza_Industria(
	ID INT PRIMARY KEY IDENTITY(1,1) NOT NULL
	,Nombre nvarchar(50) NOT NULL
)
CREATE TABLE Industria_Persona(
	ID INT PRIMARY KEY IDENTITY(1,1) NOT NULL
	,FK_Persona_ID INT NOT NULL
	,FK_Naturaleza_Industria_ID INT NOT NULL
)
GO
CREATE TABLE Garantia(
	ID INT PRIMARY KEY IDENTITY(1,1)
	,Descripcion nvarchar(100)
)
GO
CREATE TABLE Tipo_Operacion_Crediticia(
	ID INT PRIMARY KEY IDENTITY(1,1) NOT NULL
	,Descripcion nvarchar(50) NOT NULL
	,FK__ID TINYINT NOT NULL
)
GO
CREATE TABLE Estado_Operacion_Crediticia(
	ID INT PRIMARY KEY IDENTITY(1,1) NOT NULL
	,Descripcion nvarchar(50) NOT NULL
)
GO
CREATE TABLE Estado_Movimiento(
	ID INT PRIMARY KEY IDENTITY(1,1)
	,Descripcion nvarchar(50)
	,FK__ID TINYINT
)
GO
CREATE TABLE Tipo_Movimiento(
	ID INT PRIMARY KEY IDENTITY(1,1)
	,Descripcion nvarchar(50)
	,FK__ID TINYINT
)
GO
CREATE TABLE Agencia(
	ID INT PRIMARY KEY IDENTITY(1,1) NOT NULL
	,Nombre nvarchar(50) NOT NULL
	,FK_Geografia_ID INT NOT NULL
)
GO
CREATE TABLE Movimiento(
	ID INT PRIMARY KEY IDENTITY(1,1)
	,Monto money NOT NULL
	,Descripcion nvarchar(50)
	,FK_Operacion_Crediticia_ID TINYINT
)
GO
CREATE TABLE Any(
	ID INT PRIMARY KEY IDENTITY(1,1) NOT NULL
	,Descripcion nvarchar(50) NOT NULL
	,FK__ID TINYINT NOT NULL
)
GO
CREATE TABLE Any(
	ID INT PRIMARY KEY IDENTITY(1,1) NOT NULL
	,Descripcion nvarchar(50) NOT NULL
	,FK__ID TINYINT NOT NULL
)
GO
CREATE TABLE Any(
	ID INT PRIMARY KEY IDENTITY(1,1) NOT NULL
	,Descripcion nvarchar(50) NOT NULL
	,FK__ID TINYINT NOT NULL
)
GO
CREATE TABLE Any(
	ID INT PRIMARY KEY IDENTITY(1,1) NOT NULL
	,Descripcion nvarchar(50) NOT NULL
	,FK__ID TINYINT NOT NULL
)
GO
CREATE TABLE Any(
	ID INT PRIMARY KEY IDENTITY(1,1) NOT NULL
	,Descripcion nvarchar(50) NOT NULL
	,FK__ID TINYINT NOT NULL
)
GO

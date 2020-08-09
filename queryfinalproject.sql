USE master
GO
CREATE DATABASE dbBanco
GO
USE dbBanco
GO
/*
 *
 * Query dbBanco 2020-08-09
 *
 */
/*Creacion Tabla Tipo Persona*/
CREATE TABLE Tipo_Persona(
	ID TINYINT PRIMARY KEY IDENTITY(1,1)
	,Nombre nvarchar(50)
)
GO
/*Creacion Tabla Formacion Educativa*/
CREATE TABLE Formacion_Educativa(
	ID TINYINT PRIMARY KEY IDENTITY(1,1)
	,Descripcion nvarchar(50)
)
GO
/*Creacion Tabla Tipo Mecanismos*/
CREATE TABLE Tipo_Mecanismo(
	ID TINYINT PRIMARY KEY IDENTITY(1,1)
	,Descripcion nvarchar(50)
)
GO
/*Creacion Tabla Persona*/
/**
Las personas pueden ser de distinto tipo
(juridicas, fisicas)
 **/
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
	,FK_Formacion_Educativa_ID TINYINT NOT NULL 
	,FK_Categoria_ID SMALLINT NOT NULL 
	,CONSTRAINT FK_Formacion_Educativa FOREIGN KEY (FK_Formacion_Educativa_ID) REFERENCES Formacion_Educativa(ID) 
	,CONSTRAINT FK_Categoria_Persona FOREIGN KEY (FK_Categoria_ID) REFERENCES Categoria(ID) 
)
GO
/*Creacion Tabla Tipo Estado Persona*/
CREATE TABLE Tipo_Estado_Persona(
	ID TINYINT PRIMARY KEY IDENTITY(1,1)
	,Nombre nvarchar(50)
)
GO
CREATE TABLE Persona_Tipo(
	ID INT PRIMARY KEY IDENTITY(1,1)
	,FK_Persona_ID INT
	,FK_Tipo_ID TINYINT
	,CONSTRAINT FK_Persona FOREIGN KEY (FK_Persona_ID) REFERENCES Persona(ID) 
	,CONSTRAINT FK_Tipo_de_Persona FOREIGN KEY (FK_Tipo_ID) REFERENCES Tipo_Persona(ID) 
)
GO
/*Creacion Tabla Tipo Estado Persona*/
CREATE TABLE Estado_Persona(
	ID INT PRIMARY KEY IDENTITY(1,1)
	,FechaInicio DATETIME
	,FechaFin DATETIME
	,FK_Tipo_Estado_Persona_ID TINYINT
	,FK_Persona_ID INT
	,CONSTRAINT FK_Tipo_Estado_Persona FOREIGN KEY (FK_Tipo_Estado_ID) REFERENCES Tipo_Estado_Persona(ID) 
	,CONSTRAINT FK_Estado_Persona FOREIGN KEY (FK_Persona_ID) REFERENCES Persona(ID) 
)
GO
/*Creacion Tabla Mecanismo Contacto*/
CREATE TABLE Mecanismo_Contacto(
	ID INT PRIMARY KEY IDENTITY(1,1)
	,Descripcion nvarchar(80)
	,FK_Tipo_Mecanismo_ID TINYINT
	,FK_Persona_ID INT
	,CONSTRAINT FK_Contacto_Persona FOREIGN KEY (FK_Persona_ID) REFERENCES Persona(ID) 
	,CONSTRAINT FK_Tipo_Mecanismo_Contacto FOREIGN KEY (FK_Tipo_Mecanismo_ID) REFERENCES Tipo_Mecanismo(ID) 
)
GO
/*Creacion Tabla Moneda*/
CREATE TABLE Moneda(
	ID INT PRIMARY KEY IDENTITY(1,1)
	,Nombre nvarchar(50)
	,IsoAlpha3 nvarchar(3) -- E.g. USD, ASD, CRC, EUR,
)
GO
/*Creacion Tabla Agencia*/
CREATE TABLE Agencia(
	ID INT PRIMARY KEY IDENTITY(1,1)
	,Descripcion nvarchar(80)
)
GO
/*Creacion Tabla Tipo Geografia*/
CREATE TABLE Tipo_Geografia(
	ID TINYINT PRIMARY KEY IDENTITY(1,1)
	,Nombre nvarchar(50)
)
GO
/*Creacion Tabla Tipo Ingreso*/
CREATE TABLE Tipo_Ingreso(
	ID TINYINT PRIMARY KEY IDENTITY(1,1)
	,Nombre nvarchar(50)
	,IsoAlpha3 nvarchar(3)
)
GO
/*Creacion Tabla Ingreso*/
CREATE TABLE Ingreso(
	ID TINYINT PRIMARY KEY IDENTITY(1,1) NOT NULL
	,Monto money
	,Planilla BIT
	,FK_Persona_ID INT
	,FK_Tipo_Ingreso_ID TINYINT
	,CONSTRAINT FK_Persona FOREIGN KEY (FK_Persona_ID) REFERENCES Persona(ID) 
	,CONSTRAINT FK_Tipo_Ingreso FOREIGN KEY (FK_Tipo_Ingreso_ID) REFERENCES Tipo_Ingreso(ID) 
)
GO
/*Creacion Tabla Tipo Direccion*/
CREATE TABLE Tipo_Direccion(
	ID TINYINT PRIMARY KEY IDENTITY(1,1)
	,Nombre nvarchar(50)
)
GO
/*Creacion Tabla Geografia*/
CREATE TABLE Geografia(
	ID INT PRIMARY KEY IDENTITY(1,1)
	,Nombre nvarchar(50)
	,FK_GeografiaID INT
	,FK_Tipo_Geografia_ID TINYINT
	,CONSTRAINT FK_Tipo_Geografia FOREIGN KEY (FK_Tipo_Geografia_ID) REFERENCES Tipo_Geografia(ID) 
)
GO
/*Creacion Tabla Categorias*/
CREATE TABLE Categoria(
	ID SMALLINT PRIMARY KEY IDENTITY(1,1)
	,Nombre nvarchar(50)
)
GO
/*Creacion Tabla Direccion*/
CREATE TABLE Direccion(
	ID INT PRIMARY KEY IDENTITY(1,1)
	,Linea1 nvarchar(50)
	,Linea2 nvarchar(50)
	,Zipcode SMALLINT
	,FechaInicio DATE
	,FK_Tipo_Direccion_ID TINYINT
	,FK_Geografia_ID INT
	,FK_Persona_ID INT
	,CONSTRAINT FK_Tipo_Direccion FOREIGN KEY (FK_Tipo_Direccion_ID) REFERENCES Tipo_Direccion(ID) 
	,CONSTRAINT FK_Geografia_Direccion FOREIGN KEY (FK_Geografia_ID) REFERENCES Geografia(ID) 
	,CONSTRAINT FK_Persona_Direccion FOREIGN KEY (FK_Persona_ID) REFERENCES Persona(ID)
	)
GO
/*Creacion Tabla Tipo Identificacion*/
CREATE TABLE Tipo_Identificacion(
	ID TINYINT PRIMARY KEY IDENTITY(1,1)
	,Descripcion nvarchar(50)
)
GO
/*Creacion Tabla Identificacion*/
CREATE TABLE Identificacion(
	ID INT PRIMARY KEY IDENTITY(1,1)
	,Numero INT
	,FK_Tipo_Identificacion_ID TINYINT
	,CONSTRAINT FK_Tipo_Identificacion FOREIGN KEY (FK_Tipo_Identificacion_ID) REFERENCES Tipo_Identificacion(ID) 
)
GO
/*Creacion Tabla Tipo Relacion*/
CREATE TABLE Tipo_Relacion(
	ID SMALLINT PRIMARY KEY IDENTITY(1,1)
	,Descripcion nvarchar(50)
)
GO
/*Creacion Tabla Intermediaria Relacion*/
CREATE TABLE Relacion(
	ID INT PRIMARY KEY IDENTITY(1,1) NOT NULL
	,FK_Persona1_ID INT NOT NULL
	,FK_Persona2_ID INT NOT NULL
	,FK_Tipo_Relacion SMALLINT NOT NULL
	,CONSTRAINT FK_Persona1 FOREIGN KEY (FK_Persona1_ID) REFERENCES Persona(ID) -- Enlace Persona1
	,CONSTRAINT FK_Persona2 FOREIGN KEY (FK_Persona2_ID) REFERENCES Persona(ID) -- Enlace Persona2
	,CONSTRAINT FK_PersonaRelacion FOREIGN KEY (FK_Tipo_Relacion) REFERENCES Tipo_Relacion(ID) -- Enlace Relacion Personas
)
GO
/*Creacion Tabla Sitio Web*/
CREATE TABLE Sitio_Web(
	ID INT PRIMARY KEY IDENTITY(1,1) NOT NULL
	,Descripcion nvarchar(200) NOT NULL
	,FK_Persona_ID INT NOT NULL
	,CONSTRAINT FK_Persona_Sitio_Web FOREIGN KEY (FK_Persona_ID) REFERENCES Persona(ID) 
)
GO
/*Creacion Tabla Naturaleza Industria*/
CREATE TABLE Naturaleza_Industria(
	ID INT PRIMARY KEY IDENTITY(1,1) NOT NULL
	,Nombre nvarchar(50) NOT NULL
)
/*Creacion Tabla Intermediaria Industria Persona*/
CREATE TABLE Industria_Persona(
	ID INT PRIMARY KEY IDENTITY(1,1) NOT NULL
	,FK_Persona_ID INT NOT NULL
	,FK_Naturaleza_Industria_ID INT NOT NULL
	,CONSTRAINT FK_Persona_Industria FOREIGN KEY (FK_Persona_ID) REFERENCES Persona(ID) -- Enlace Persona
	,CONSTRAINT FK_Naturaleza_Industria FOREIGN KEY (FK_Naturaleza_Industria_ID) REFERENCES Naturaleza_Industria(ID) -- Enlace Naturaleza Industria
)
GO
/*Creacion Tabla Garantia*/
CREATE TABLE Garantia(
	ID INT PRIMARY KEY IDENTITY(1,1)
	,Descripcion nvarchar(100)
)
GO
/*Creacion Tabla Tipo Operacion Crediticia*/
CREATE TABLE Tipo_Operacion_Crediticia(
	ID INT PRIMARY KEY IDENTITY(1,1) NOT NULL
	,Descripcion nvarchar(50) NOT NULL
)
GO
/*Creacion Tabla Estado Operacion Crediticia*/
CREATE TABLE Estado_Operacion_Crediticia(
	ID INT PRIMARY KEY IDENTITY(1,1) NOT NULL
	,Descripcion nvarchar(50) NOT NULL
)
GO
/*Creacion Tabla Estado Movimiento*/
CREATE TABLE Estado_Movimiento(
	ID TINYINT PRIMARY KEY IDENTITY(1,1)
	,Descripcion nvarchar(50)
)
GO
/*Creacion Tabla Tipo Movimiento*/
CREATE TABLE Tipo_Movimiento(
	ID TINYINT PRIMARY KEY IDENTITY(1,1)
	,Descripcion nvarchar(50)
)
GO
/*Creacion Tabla Operacion_Crediticia*/
CREATE TABLE Operacion_Crediticia(
	ID INT PRIMARY KEY IDENTITY(1,1) NOT NULL
	,Fecha_Formalizacion DATETIME NOT NULL
	,Fecha_Vencimiento DATETIME NOT NULL
	,Fecha_Cancelacion DATETIME NULL
	,Descripcion nvarchar(50) NOT NULL
	,Mora_Legal MONEY NOT NULL
	,Mora_Financiera MONEY NOT NULL
	,Saldo_Principal MONEY NOT NULL
	,Cuotas_Vencidas INT NOT NULL
	,Monto_Cuotas_Vencidas MONEY NOT NULL
	,Monto_Interes_Cobrado_Total MONEY NOT NULL
	,Monto_Gestion_Cobrado_Total MONEY NOT NULL
	,Cuota_Principal MONEY NOT NULL
	,Cuota_Interes MONEY NOT NULL
	,Cuota_Seguro MONEY NOT NULL
	,Cuota_Comision MONEY NOT NULL
	,Monto_Amortizacion_Extraordinaria MONEY NOT NULL
	,Monto_Original MONEY NOT NULL
	,Tasa_Interes TINYINT NOT NULL
	,Dia_Pago nvarchar(60) NOT NULL
	,Dias_Atraso_SUGEF INT NOT NULL
	,Saldo_Amortizado MONEY NOT NULL
	,Plazo nvarchar(60) NOT NULL
	,Monto_Interes_Acumulado MONEY NOT NULL
	,Plazo_Restante nvarchar(60) NOT NULL
	,FK_Persona_ID INT NOT NULL
	,FK_Estado_Operacion_Crediticia_ID INT NOT NULL
	,FK_Tipo_Operacion_Crediticia_ID INT NOT NULL
	,FK_Agencia_ID INT NOT NULL
	,CONSTRAINT FK_Persona_Operacion_Crediticia FOREIGN KEY (FK_Persona_ID) REFERENCES Persona(ID) -- Enlace a Persona Responsable de Op crediticia
	,CONSTRAINT FK_Estado_Operacion_Crediticia FOREIGN KEY (FK_Estado_Operacion_Crediticia_ID) REFERENCES Estado_Operacion_Crediticia(ID) -- Enlace a Estado Actual Operacion Crediticia
	,CONSTRAINT FK_Tipo_Operacion_Crediticia FOREIGN KEY (FK_Tipo_Operacion_Crediticia_ID) REFERENCES Tipo_Operacion_Crediticia(ID) -- Enlace a Tipo Operacion Crediticia
	,CONSTRAINT FK_Agencia FOREIGN KEY (FK_Agencia_ID) REFERENCES Agencia(ID) -- Enlace Agencia
)
GO
/*Creacion Tabla Movimiento*/
CREATE TABLE Movimiento(
	ID INT PRIMARY KEY IDENTITY(1,1)
	,Monto money NOT NULL
	,Descripcion nvarchar(50)
	,FK_Operacion_Crediticia_ID INT
	,FK_Moneda_ID INT
	,FK_Tipo_Movimiento_ID TINYINT
	,FK_Estado_Movimiento_ID TINYINT
	,CONSTRAINT FK_Movimiento_Operacion_Cred FOREIGN KEY (FK_Operacion_Crediticia_ID) REFERENCES Operacion_Crediticia(ID)
	,CONSTRAINT FK_Tipo_Movimiento FOREIGN KEY (FK_Tipo_Movimiento_ID) REFERENCES Tipo_Movimiento(ID)
	,CONSTRAINT FK_Moneda_Movimiento FOREIGN KEY (FK_Moneda_ID) REFERENCES Moneda(ID)
	,CONSTRAINT FK_Estado_Movimiento FOREIGN KEY (FK_Estado_Movimiento_ID) REFERENCES Estado_Movimiento(ID)
)
GO

/*Creacion Tabla Garantias Operacion Creditica*/
CREATE TABLE Garantia_Operacion_Crediticia(
	ID INT PRIMARY KEY IDENTITY(1,1)
	,FK_Operacion_Crediticia_ID INT
	,FK_Garantia_ID INT
	,CONSTRAINT FK_Operacion_Crediticia FOREIGN KEY (FK_Operacion_Crediticia_ID) REFERENCES Operacion_Crediticia(ID) 
	,CONSTRAINT FK_Garantia_Operacion FOREIGN KEY (FK_Garantia_ID) REFERENCES Garantia(ID) 
)
GO
---Templates para tablas adicionales en caso de ser necesario
/* CREATE TABLE Any(
 *         ID INT PRIMARY KEY IDENTITY(1,1) NOT NULL
 *         ,Descripcion nvarchar(50) NOT NULL
 *         ,FK__ID TINYINT NOT NULL
 * )
 * GO
 * CREATE TABLE Any(
 *         ID INT PRIMARY KEY IDENTITY(1,1) NOT NULL
 *         ,Descripcion nvarchar(50) NOT NULL
 *         ,FK__ID TINYINT NOT NULL
 * )
 * GO
 * CREATE TABLE Any(
 *         ID INT PRIMARY KEY IDENTITY(1,1) NOT NULL
 *         ,Descripcion nvarchar(50) NOT NULL
 *         ,FK__ID TINYINT NOT NULL
 * )
 * GO
 * CREATE TABLE Any(
 *         ID INT PRIMARY KEY IDENTITY(1,1) NOT NULL
 *         ,Descripcion nvarchar(50) NOT NULL
 *         ,FK__ID TINYINT NOT NULL
 * )
 * GO */

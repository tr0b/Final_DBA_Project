CREATE VIEW v_Tipo_Persona WITH SCHEMABINDING AS

SELECT ID, Nombre FROM Tipo_Persona
GO

CREATE VIEW v_Formacion_Educativa WITH SCHEMABINDING AS

SELECT ID, Descripcion FROM Formacion_Educativa
GO

CREATE VIEW v_Tipo_Mecanismo WITH SCHEMABINDING AS

SELECT ID, Descripcion FROM Tipo_Mecanismo
GO

CREATE VIEW v_Categoria WITH SCHEMABINDING AS

SELECT ID, Nombre FROM Categoria
GO

CREATE VIEW v_Tipo_Identificacion WITH SCHEMABINDING AS

SELECT ID, Descripcion FROM Tipo_Identificacion
GO

CREATE VIEW v_Identificacion WITH SCHEMABINDING AS

SELECT ID, Numero, FK_Tipo_Identificacion_ID FROM Identificacion
GO

CREATE VIEW v_Persona WITH SCHEMABINDING AS

SELECT 

	ID 
	,Primer_Nombre   
	,Segundo_Nombre  
	,Primer_Apellido   
	,Segundo_Apellido  
	,Genero TINYINT 
	,Fecha_Nac 
	,Estado_Civil 
	,Juridica BIT  
	,FK_Formacion_Educativa_ID TINYINT 
	,FK_Identificacion_ID 
	,FK_Categoria_ID 

FROM Persona
GO

CREATE VIEW v_Tipo_Estado_Persona WITH SCHEMABINDING AS

SELECT ID, Nombre FROM Tipo_Estado_Persona
GO

CREATE VIEW v_Persona_Tipo WITH SCHEMABINDING AS

SELECT
	ID 
	,FK_Persona_ID
	,FK_Tipo_ID
FROM Persona_Tipo
GO

CREATE VIEW v_Estado_Persona WITH SCHEMABINDING AS 

SELECT 

	,FechaInicio
	,FechaFin
	,FK_Tipo_Estado_ID
	,FK_Persona_ID

FROM Estado_Persona
GO

CREATE VIEW v_Mecanismo_Contacto WITH SCHEMABINDING AS

SELECT 

	ID 
	,Descripcion 
	,FK_Tipo_Mecanismo_ID 
	,FK_Persona_ID
FROM Mecanismo_Contacto
GO

CREATE VIEW v_Moneda WITH SCHEMABINDING AS

SELECT 

	ID 
	,Nombre 
	,IsoAlpha3 
FROM Moneda
GO

CREATE VIEW v_Agencia WITH SCHEMABINDING AS

SELECT 

	ID 
	,Descripcion
FROM Agencia
GO

CREATE VIEW v_Tipo_Geografia WITH SCHEMABINDING AS

SELECT 

	ID 
	,Nombre 

FROM Tipo_Geografia
GO

CREATE VIEW v_Tipo_Ingreso WITH SCHEMABINDING AS

SELECT 

	ID 
	,Nombre 
	,IsoAlpha3 
FROM Tipo_Ingreso
GO

CREATE VIEW v_Ingreso WITH SCHEMABINDING AS

	ID 
	,Monto 
	,Planilla 
	,FK_Persona_ID 
	,FK_Tipo_Ingreso_ID 
SELECT 

FROM Ingreso
GO

CREATE VIEW v_Tipo_Direccion WITH SCHEMABINDING AS

SELECT 

	ID 
	,Nombre 
FROM Tipo_Direccion
GO

CREATE VIEW v_Direccion WITH SCHEMABINDING AS

SELECT 

	ID 
	,Linea1 
	,Linea2 
	,Zipcode
	,FechaInicio
	,FK_Tipo_Direccion_ID 
	,FK_Geografia_ID 
	,FK_Persona_ID 
FROM Direccion
GO

CREATE VIEW v_Tipo_Relacion WITH SCHEMABINDING AS

SELECT 

	ID 
	,Descripcion 
FROM Tipo_Relacion
GO

CREATE VIEW v_Relacion WITH SCHEMABINDING AS

SELECT 

	ID 
	,FK_Persona1_ID 
	,FK_Persona2_ID 
	,FK_Tipo_Relacion 
FROM Relacion
GO

CREATE VIEW v_Sitio_Web WITH SCHEMABINDING AS

SELECT 

	ID 
	,Descripcion 
	,FK_Persona_ID 
	
FROM Sitio_Web
GO

CREATE VIEW v_Naturaleza_Industria WITH SCHEMABINDING AS 

SELECT 

	ID 
	,Nombre 
FROM Naturaleza_Industria
GO

CREATE VIEW v_Industria_Persona WITH SCHEMABINDING AS

SELECT 

	ID 
	,FK_Persona_ID
	,FK_Naturaleza_Industria_ID
FROM Industria_Persona
GO

CREATE VIEW v_Garantia WITH SCHEMABINDING AS

SELECT 

	ID 
	,Descripcion 
FROM Garantia
GO

CREATE VIEW v_Tipo_Operacion_Crediticia WITH SCHEMABINDING AS

SELECT 

	ID 
	,Descripcion
FROM Tipo_Operacion_Crediticia
GO

CREATE VIEW v_Estado_Operacion_Crediticia WITH SCHEMABINDING AS

SELECT 

	ID 
	,Descripcion 
FROM Estado_Operacion_Crediticia
GO

CREATE VIEW v_Estado_Movimiento WITH SCHEMABINDING AS

SELECT 

	ID 
	,Descripcion 

FROM Estado_Movimiento
GO

CREATE VIEW v_Tipo_Movimiento WITH SCHEMABINDING AS

SELECT 

	ID 
	,Descripcion 

FROM Tipo_Movimiento
GO

CREATE VIEW v_Operacion_Crediticia WITH SCHEMABINDING AS

SELECT

	ID 
	,Fecha_Formalizacion
	,Fecha_Vencimiento 
	,Fecha_Cancelacion 
	,Descripcion 
	,Mora_Legal 
	,Mora_Financiera 
	,Saldo_Principal 
	,Cuotas_Vencidas 
	,Monto_Cuotas_Vencidas 
	,Monto_Interes_Cobrado_Total 
	,Monto_Gestion_Cobrado_Total 
	,Cuota_Principal 
	,Cuota_Interes 
	,Cuota_Seguro 
	,Cuota_Comision 
	,Monto_Amortizacion_Extraordinaria 
	,Monto_Original 
	,Tasa_Interes
	,Dia_Pago 
	,Dias_Atraso_SUGEF
	,Saldo_Amortizado
	,Plazo
	,Monto_Interes_Acumulado
	,Plazo_Restante
	,FK_Persona_ID
	,FK_Estado_Operacion_Crediticia_ID
	,FK_Tipo_Operacion_Crediticia_ID
	,FK_Agencia_ID
FROM Operacion_Crediticia
GO

CREATE VIEW v_Movimiento WITH SCHEMABINDING AS

SELECT 

	ID 
	,Monto
	,Descripcion 
	,FK_Operacion_Crediticia_ID 
	,FK_Moneda_ID 
	,FK_Tipo_Movimiento_ID 
	,FK_Estado_Movimiento_ID 
FROM Movimiento
GO

CREATE VIEW v_Garantia_Operacion_Crediticia WITH SCHEMABINDING AS

SELECT 

	ID 
	,FK_Operacion_Crediticia_ID 
	,FK_Garantia_ID 
FROM Garantia_Operacion_Crediticia
GO

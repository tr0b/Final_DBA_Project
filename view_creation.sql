CREATE VIEW v_Tipo_Persona WITH SCHEMABINDING AS

SELECT ID, Nombre FROM dbo.Tipo_Persona
GO
CREATE VIEW v_Formacion_Educativa WITH SCHEMABINDING AS

SELECT ID, Descripcion FROM dbo.Formacion_Educativa
GO

CREATE VIEW v_Tipo_Mecanismo WITH SCHEMABINDING AS

SELECT ID, Descripcion FROM dbo.Tipo_Mecanismo
GO

CREATE VIEW v_Categoria WITH SCHEMABINDING AS

SELECT ID, Nombre FROM dbo.Categoria
GO

CREATE VIEW v_Tipo_Identificacion WITH SCHEMABINDING AS

SELECT ID, Descripcion FROM dbo.Tipo_Identificacion
GO

CREATE VIEW v_Identificacion WITH SCHEMABINDING AS

SELECT ID, Numero, FK_Tipo_Identificacion_ID FROM dbo.Identificacion
GO

CREATE VIEW v_Persona WITH SCHEMABINDING AS

SELECT 

	ID 
	,Primer_Nombre   
	,Segundo_Nombre  
	,Primer_Apellido   
	,Segundo_Apellido  
	,Genero 
	,Fecha_Nac 
	,Estado_Civil 
	,Juridica  
	,FK_Formacion_Educativa_ID
	,FK_Identificacion_ID 
	,FK_Categoria_ID 

FROM dbo.Persona
GO

CREATE VIEW v_Tipo_Estado_Persona WITH SCHEMABINDING AS

SELECT ID, Nombre FROM dbo.Tipo_Estado_Persona
GO

CREATE VIEW v_Persona_Tipo WITH SCHEMABINDING AS

SELECT
	ID 
	,FK_Persona_ID
	,FK_Tipo_ID
FROM dbo.Persona_Tipo
GO

CREATE VIEW v_Estado_Persona WITH SCHEMABINDING AS 

SELECT 

	FechaInicio
	,FechaFin
	,FK_Tipo_Estado_ID
	,FK_Persona_ID

FROM dbo.Estado_Persona
GO

CREATE VIEW v_Mecanismo_Contacto WITH SCHEMABINDING AS

SELECT 

	ID 
	,Descripcion 
	,FK_Tipo_Mecanismo_ID 
	,FK_Persona_ID
FROM dbo.Mecanismo_Contacto
GO

CREATE VIEW v_Moneda WITH SCHEMABINDING AS

SELECT 

	ID 
	,Nombre 
	,IsoAlpha3 
FROM dbo.Moneda
GO

CREATE VIEW v_Agencia WITH SCHEMABINDING AS

SELECT 

	ID 
	,Descripcion
FROM dbo.Agencia
GO

CREATE VIEW v_Tipo_Geografia WITH SCHEMABINDING AS

SELECT 

	ID 
	,Nombre 

FROM dbo.Tipo_Geografia
GO

CREATE VIEW v_Tipo_Ingreso WITH SCHEMABINDING AS

SELECT 

	ID 
	,Nombre 
	,IsoAlpha3 
FROM dbo.Tipo_Ingreso
GO

CREATE VIEW v_Ingreso WITH SCHEMABINDING AS

SELECT 
	ID 
	,Monto 
	,Planilla 
	,FK_Persona_ID 
	,FK_Tipo_Ingreso_ID 
FROM dbo.Ingreso
GO

CREATE VIEW v_Tipo_Direccion WITH SCHEMABINDING AS

SELECT 

	ID 
	,Nombre 
FROM dbo.Tipo_Direccion
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
FROM dbo.Direccion
GO

CREATE VIEW v_Geografia WITH SCHEMABINDING AS

SELECT 

	ID 
	,Nombre 
	,FK_GeografiaID 
	,FK_Tipo_Geografia_ID 
FROM dbo.Geografia
GO

CREATE VIEW v_Tipo_Relacion WITH SCHEMABINDING AS

SELECT 

	ID 
	,Descripcion 
FROM dbo.Tipo_Relacion
GO

CREATE VIEW v_Relacion WITH SCHEMABINDING AS

SELECT 

	ID 
	,FK_Persona1_ID 
	,FK_Persona2_ID 
	,FK_Tipo_Relacion 
FROM dbo.Relacion
GO

CREATE VIEW v_Sitio_Web WITH SCHEMABINDING AS

SELECT 

	ID 
	,Descripcion 
	,FK_Persona_ID 
	
FROM dbo.Sitio_Web
GO

CREATE VIEW v_Naturaleza_Industria WITH SCHEMABINDING AS 

SELECT 

	ID 
	,Nombre 
FROM dbo.Naturaleza_Industria
GO

CREATE VIEW v_Industria_Persona WITH SCHEMABINDING AS

SELECT 

	ID 
	,FK_Persona_ID
	,FK_Naturaleza_Industria_ID
FROM dbo.Industria_Persona
GO

CREATE VIEW v_Garantia WITH SCHEMABINDING AS

SELECT 

	ID 
	,Descripcion 
FROM dbo.Garantia
GO

CREATE VIEW v_Tipo_Operacion_Crediticia WITH SCHEMABINDING AS

SELECT 

	ID 
	,Descripcion
FROM dbo.Tipo_Operacion_Crediticia
GO

CREATE VIEW v_Estado_Operacion_Crediticia WITH SCHEMABINDING AS

SELECT 

	ID 
	,Descripcion 
FROM dbo.Estado_Operacion_Crediticia
GO

CREATE VIEW v_Estado_Movimiento WITH SCHEMABINDING AS

SELECT 

	ID 
	,Descripcion 

FROM dbo.Estado_Movimiento
GO

CREATE VIEW v_Tipo_Movimiento WITH SCHEMABINDING AS

SELECT 

	ID 
	,Descripcion 

FROM dbo.Tipo_Movimiento
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
FROM dbo.Operacion_Crediticia
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
FROM dbo.Movimiento
GO

CREATE VIEW v_Garantia_Operacion_Crediticia WITH SCHEMABINDING AS

SELECT 

	ID 
	,FK_Operacion_Crediticia_ID 
	,FK_Garantia_ID 
FROM dbo.Garantia_Operacion_Crediticia
GO
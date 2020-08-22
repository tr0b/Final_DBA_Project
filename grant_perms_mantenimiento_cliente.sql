USE dbBanco
GO
/*Grant read-write on tables for operation_querying*/

GRANT DELETE ON Tipo_Persona TO Consulta_Operaciones
GO
GRANT DELETE ON Formacion_Educativa TO Consulta_Operaciones
GO

GRANT DELETE ON Tipo_Mecanismo TO Consulta_Operaciones
GO

GRANT DELETE ON Categoria TO Consulta_Operaciones
GO

GRANT DELETE ON Tipo_Identificacion TO Consulta_Operaciones
GO

GRANT DELETE ON Identificacion TO Consulta_Operaciones
GO

GRANT DELETE ON Persona TO Consulta_Operaciones
GO

GRANT DELETE ON Tipo_Estado_Persona TO Consulta_Operaciones
GO

GRANT DELETE ON Persona_Tipo TO Consulta_Operaciones
GO

GRANT DELETE ON Estado_Persona TO Consulta_Operaciones 
GO

GRANT DELETE ON Mecanismo_Contacto TO Consulta_Operaciones
GO

GRANT DELETE ON Moneda TO Consulta_Operaciones
GO

GRANT DELETE ON Agencia TO Consulta_Operaciones
GO

GRANT DELETE ON Tipo_Geografia TO Consulta_Operaciones
GO

GRANT DELETE ON Tipo_Ingreso TO Consulta_Operaciones
GO

GRANT DELETE ON Ingreso TO Consulta_Operaciones
GO

GRANT DELETE ON Tipo_Direccion TO Consulta_Operaciones
GO

GRANT DELETE ON Direccion TO Consulta_Operaciones
GO

GRANT DELETE ON Geografia TO Consulta_Operaciones
GO

GRANT DELETE ON Tipo_Relacion TO Consulta_Operaciones
GO

GRANT DELETE ON Relacion TO Consulta_Operaciones
GO

GRANT DELETE ON Sitio_Web TO Consulta_Operaciones
GO

GRANT DELETE ON Naturaleza_Industria TO Consulta_Operaciones 
GO

GRANT DELETE ON Industria_Persona TO Consulta_Operaciones
GO

GRANT DELETE ON Garantia TO Consulta_Operaciones
GO

GRANT DELETE ON Tipo_Operacion_Crediticia TO Consulta_Operaciones
GO

GRANT DELETE ON Estado_Operacion_Crediticia TO Consulta_Operaciones
GO

GRANT DELETE ON Estado_Movimiento TO Consulta_Operaciones
GO

GRANT DELETE ON Tipo_Movimiento TO Consulta_Operaciones
GO

GRANT DELETE ON Operacion_Crediticia TO Consulta_Operaciones
GO

GRANT DELETE ON Movimiento TO Consulta_Operaciones
GO

GRANT DELETE ON Garantia_Operacion_Crediticia TO Consulta_Operaciones
GO

GRANT UPDATE ON Tipo_Persona TO Consulta_Operaciones
GO
GRANT UPDATE ON Formacion_Educativa TO Consulta_Operaciones
GO

GRANT UPDATE ON Tipo_Mecanismo TO Consulta_Operaciones
GO

GRANT UPDATE ON Categoria TO Consulta_Operaciones
GO

GRANT UPDATE ON Tipo_Identificacion TO Consulta_Operaciones
GO

GRANT UPDATE ON Identificacion TO Consulta_Operaciones
GO

GRANT UPDATE ON Persona TO Consulta_Operaciones
GO

GRANT UPDATE ON Tipo_Estado_Persona TO Consulta_Operaciones
GO

GRANT UPDATE ON Persona_Tipo TO Consulta_Operaciones
GO

GRANT UPDATE ON Estado_Persona TO Consulta_Operaciones 
GO

GRANT UPDATE ON Mecanismo_Contacto TO Consulta_Operaciones
GO

GRANT UPDATE ON Moneda TO Consulta_Operaciones
GO

GRANT UPDATE ON Agencia TO Consulta_Operaciones
GO

GRANT UPDATE ON Tipo_Geografia TO Consulta_Operaciones
GO

GRANT UPDATE ON Tipo_Ingreso TO Consulta_Operaciones
GO

GRANT UPDATE ON Ingreso TO Consulta_Operaciones
GO

GRANT UPDATE ON Tipo_Direccion TO Consulta_Operaciones
GO

GRANT UPDATE ON Direccion TO Consulta_Operaciones
GO

GRANT UPDATE ON Geografia TO Consulta_Operaciones
GO

GRANT UPDATE ON Tipo_Relacion TO Consulta_Operaciones
GO

GRANT UPDATE ON Relacion TO Consulta_Operaciones
GO

GRANT UPDATE ON Sitio_Web TO Consulta_Operaciones
GO

GRANT UPDATE ON Naturaleza_Industria TO Consulta_Operaciones 
GO

GRANT UPDATE ON Industria_Persona TO Consulta_Operaciones
GO

GRANT UPDATE ON Garantia TO Consulta_Operaciones
GO

GRANT UPDATE ON Tipo_Operacion_Crediticia TO Consulta_Operaciones
GO

GRANT UPDATE ON Estado_Operacion_Crediticia TO Consulta_Operaciones
GO

GRANT UPDATE ON Estado_Movimiento TO Consulta_Operaciones
GO

GRANT UPDATE ON Tipo_Movimiento TO Consulta_Operaciones
GO

GRANT UPDATE ON Operacion_Crediticia TO Consulta_Operaciones
GO

GRANT UPDATE ON Movimiento TO Consulta_Operaciones
GO

GRANT UPDATE ON Garantia_Operacion_Crediticia TO Consulta_Operaciones
GO
/**Nevermind, exercise didnt really ask for this**/

/*GRANT SELECT ON Tipo_Persona TO Consulta_Operaciones
GO
GRANT SELECT ON Formacion_Educativa TO Consulta_Operaciones
GO

GRANT SELECT ON Tipo_Mecanismo TO Consulta_Operaciones
GO

GRANT SELECT ON Categoria TO Consulta_Operaciones
GO

GRANT SELECT ON Tipo_Identificacion TO Consulta_Operaciones
GO

GRANT SELECT ON Identificacion TO Consulta_Operaciones
GO

GRANT SELECT ON Persona TO Consulta_Operaciones
GO

GRANT SELECT ON Tipo_Estado_Persona TO Consulta_Operaciones
GO

GRANT SELECT ON Persona_Tipo TO Consulta_Operaciones
GO

GRANT SELECT ON Estado_Persona TO Consulta_Operaciones 
GO

GRANT SELECT ON Mecanismo_Contacto TO Consulta_Operaciones
GO

GRANT SELECT ON Moneda TO Consulta_Operaciones
GO

GRANT SELECT ON Agencia TO Consulta_Operaciones
GO

GRANT SELECT ON Tipo_Geografia TO Consulta_Operaciones
GO

GRANT SELECT ON Tipo_Ingreso TO Consulta_Operaciones
GO

GRANT SELECT ON Ingreso TO Consulta_Operaciones
GO

GRANT SELECT ON Tipo_Direccion TO Consulta_Operaciones
GO

GRANT SELECT ON Direccion TO Consulta_Operaciones
GO

GRANT SELECT ON Geografia TO Consulta_Operaciones
GO

GRANT SELECT ON Tipo_Relacion TO Consulta_Operaciones
GO

GRANT SELECT ON Relacion TO Consulta_Operaciones
GO

GRANT SELECT ON Sitio_Web TO Consulta_Operaciones
GO

GRANT SELECT ON Naturaleza_Industria TO Consulta_Operaciones 
GO

GRANT SELECT ON Industria_Persona TO Consulta_Operaciones
GO

GRANT SELECT ON Garantia TO Consulta_Operaciones
GO

GRANT SELECT ON Tipo_Operacion_Crediticia TO Consulta_Operaciones
GO

GRANT SELECT ON Estado_Operacion_Crediticia TO Consulta_Operaciones
GO

GRANT SELECT ON Estado_Movimiento TO Consulta_Operaciones
GO

GRANT SELECT ON Tipo_Movimiento TO Consulta_Operaciones
GO

GRANT SELECT ON Operacion_Crediticia TO Consulta_Operaciones
GO

GRANT SELECT ON Movimiento TO Consulta_Operaciones
GO

GRANT SELECT ON Garantia_Operacion_Crediticia TO Consulta_Operaciones
GO*/
/*Inserts*/
GRANT INSERT ON Tipo_Persona TO Consulta_Operaciones
GO

GRANT INSERT ON Formacion_Educativa TO Consulta_Operaciones
GO

GRANT INSERT ON Tipo_Mecanismo TO Consulta_Operaciones
GO

GRANT INSERT ON Categoria TO Consulta_Operaciones
GO

GRANT INSERT ON Tipo_Identificacion TO Consulta_Operaciones
GO

GRANT INSERT ON Identificacion TO Consulta_Operaciones
GO

GRANT INSERT ON Persona TO Consulta_Operaciones
GO

GRANT INSERT ON Tipo_Estado_Persona TO Consulta_Operaciones
GO

GRANT INSERT ON Persona_Tipo TO Consulta_Operaciones
GO

GRANT INSERT ON Estado_Persona TO Consulta_Operaciones 
GO

GRANT INSERT ON Mecanismo_Contacto TO Consulta_Operaciones
GO

GRANT INSERT ON Moneda TO Consulta_Operaciones
GO

GRANT INSERT ON Agencia TO Consulta_Operaciones
GO

GRANT INSERT ON Tipo_Geografia TO Consulta_Operaciones
GO

GRANT INSERT ON Tipo_Ingreso TO Consulta_Operaciones
GO

GRANT INSERT ON Ingreso TO Consulta_Operaciones
GO

GRANT INSERT ON Tipo_Direccion TO Consulta_Operaciones
GO

GRANT INSERT ON Direccion TO Consulta_Operaciones
GO

GRANT INSERT ON Geografia TO Consulta_Operaciones
GO

GRANT INSERT ON Tipo_Relacion TO Consulta_Operaciones
GO

GRANT INSERT ON Relacion TO Consulta_Operaciones
GO

GRANT INSERT ON Sitio_Web TO Consulta_Operaciones
GO

GRANT INSERT ON Naturaleza_Industria TO Consulta_Operaciones 
GO

GRANT INSERT ON Industria_Persona TO Consulta_Operaciones
GO

GRANT INSERT ON Garantia TO Consulta_Operaciones
GO

GRANT INSERT ON Tipo_Operacion_Crediticia TO Consulta_Operaciones
GO

GRANT INSERT ON Estado_Operacion_Crediticia TO Consulta_Operaciones
GO

GRANT INSERT ON Estado_Movimiento TO Consulta_Operaciones
GO

GRANT INSERT ON Tipo_Movimiento TO Consulta_Operaciones
GO

GRANT INSERT ON Operacion_Crediticia TO Consulta_Operaciones
GO

GRANT INSERT ON Movimiento TO Consulta_Operaciones
GO

GRANT INSERT ON Garantia_Operacion_Crediticia TO Consulta_Operaciones
GO

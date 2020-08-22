/*Role & Login Creation*/
EXEC sp_configure 'CONTAINED DATABASE AUTHENTICATION', 1
GO
RECONFIGURE
GO
USE master
--Creacion de Thomas (Administrador / Rol administrativo )
CREATE LOGIN Thomas WITH PASSWORD = N'Thomas555';
-- Luego creamos un usuario Eri (tiene el rol Mantenimiento Clientes)
CREATE LOGIN Eri WITH PASSWORD = N'Eri12345';
-- Luego creamos un usuario Samos (tiene el rol Consulta Operaciones)
CREATE LOGIN Samos WITH PASSWORD = N'Samos555';
-- Finalmente creamos un usuario Kira (tiene el ROL Lectura General)
CREATE LOGIN Kira WITH PASSWORD = N'Kira5555';
--Asociamos los logins a los usuarios dentro de la DB
USE dbBanco
CREATE USER Thomas 
FROM LOGIN Thomas
GO
CREATE USER Samos  
FROM LOGIN  Samos 
GO
CREATE USER Kira  
FROM LOGIN  Kira 
GO
CREATE USER Eri  
FROM LOGIN  Eri 
GO
--Se crea el  rol administrativo para Thomas
CREATE ROLE Rol_Administrativo AUTHORIZATION Thomas;
GO
--Se crea el  rol mantenimiento clientes para Thomas
CREATE ROLE Rol_Mantenimiento_Clientes AUTHORIZATION Eri;
GO
--Se crea el  rol consultas operaciones para Samos
CREATE ROLE Consulta_Operaciones AUTHORIZATION Samos;
GO
--Se crea el  rol lectura general Para Kira
CREATE ROLE Lectura_General AUTHORIZATION Kira;
GO
-- Se Revocan los privilegios de select dentro del schema DBO en los siguientes roles
/*Es requerido aplicar (GRANT) todos los objetos que caigan en la gobernanza de los roles
anteriores. (TRABAJAR EN ESTO)*/
-- Privilegios EXEC USER SPS
/*GRANT EXECUTE ON dbo.sp_AddProduct TO ROL_EXEC_USER_SPS;
GRANT EXECUTE ON dbo.sp_totalSalesIncomebyDate TO ROL_EXEC_USER_SPS;*/
-- Privilegios DENY SPS
/*DENY EXECUTE ON dbo.sp_AddProduct TO ROL_DENY_EXEC_USER_SPS;
DENY EXECUTE ON dbo.sp_totalSalesIncomebyDate TO ROL_DENY_EXEC_USER_SPS;*/
--Privilegios fulla access categoria
/*GRANT EXECUTE ON dbo.sp_addCategory TO ROL_FULL_ACCESS_Categoria;
GRANT EXECUTE ON dbo.sp_updateCategory TO ROL_FULL_ACCESS_Categoria;
GRANT EXECUTE ON dbo.sp_removeCategory TO ROL_FULL_ACCESS_Categoria;*/

ALTER ROLE Rol_Administrativo 
ADD MEMBER Thomas
GO
ALTER ROLE Rol_Mantenimiento_Clientes
ADD MEMBER Eri
GO
ALTER ROLE Consulta_Operaciones
ADD MEMBER Samos
GO
ALTER ROLE Lectura_General
ADD MEMBER Kira
GO
/*Grant selects on views for General read-only role*/
GRANT SELECT ON dbo.v_Tipo_Persona TO Lectura_General
GO
GRANT SELECT ON dbo.v_Formacion_Educativa TO Lectura_General
GO

GRANT SELECT ON dbo.v_Tipo_Mecanismo TO Lectura_General
GO

GRANT SELECT ON dbo.v_Categoria TO Lectura_General
GO

GRANT SELECT ON dbo.v_Tipo_Identificacion TO Lectura_General
GO

GRANT SELECT ON dbo.v_Identificacion TO Lectura_General
GO

GRANT SELECT ON dbo.v_Persona TO Lectura_General
GO

GRANT SELECT ON dbo.v_Tipo_Estado_Persona TO Lectura_General
GO

GRANT SELECT ON dbo.v_Persona_Tipo TO Lectura_General
GO

GRANT SELECT ON dbo.v_Estado_Persona TO Lectura_General 
GO

GRANT SELECT ON dbo.v_Mecanismo_Contacto TO Lectura_General
GO

GRANT SELECT ON dbo.v_Moneda TO Lectura_General
GO

GRANT SELECT ON dbo.v_Agencia TO Lectura_General
GO

GRANT SELECT ON dbo.v_Tipo_Geografia TO Lectura_General
GO

GRANT SELECT ON dbo.v_Tipo_Ingreso TO Lectura_General
GO

GRANT SELECT ON dbo.v_Ingreso TO Lectura_General
GO

GRANT SELECT ON dbo.v_Tipo_Direccion TO Lectura_General
GO

GRANT SELECT ON dbo.v_Direccion TO Lectura_General
GO

GRANT SELECT ON dbo.v_Geografia TO Lectura_General
GO

GRANT SELECT ON dbo.v_Tipo_Relacion TO Lectura_General
GO

GRANT SELECT ON dbo.v_Relacion TO Lectura_General
GO

GRANT SELECT ON dbo.v_Sitio_Web TO Lectura_General
GO

GRANT SELECT ON dbo.v_Naturaleza_Industria TO Lectura_General 
GO

GRANT SELECT ON dbo.v_Industria_Persona TO Lectura_General
GO

GRANT SELECT ON dbo.v_Garantia TO Lectura_General
GO

GRANT SELECT ON dbo.v_Tipo_Operacion_Crediticia TO Lectura_General
GO

GRANT SELECT ON dbo.v_Estado_Operacion_Crediticia TO Lectura_General
GO

GRANT SELECT ON dbo.v_Estado_Movimiento TO Lectura_General
GO

GRANT SELECT ON dbo.v_Tipo_Movimiento TO Lectura_General
GO

GRANT SELECT ON dbo.v_Operacion_Crediticia TO Lectura_General
GO

GRANT SELECT ON dbo.v_Movimiento TO Lectura_General
GO

GRANT SELECT ON dbo.v_Garantia_Operacion_Crediticia TO Lectura_General
GO
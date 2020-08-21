/*Role & Login Creation*/
EXEC sp_configure 'CONTAINED DATABASE AUTHENTICATION', 1
GO
RECONFIGURE
GO
USE master
CREATE LOGIN Thomas WITH PASSWORD = N'Thomas555';
-- Luego creamos un usuario Samos (tiene el ROL DENY EXEC USER SPS)
CREATE LOGIN Samos WITH PASSWORD = N'Samos555';
-- Finalmente creamos un usuario Kira (tiene el ROL FULL ACCESS)
CREATE LOGIN Kira WITH PASSWORD = N'Kira5555';
--Asociamos los logins a los usuarios dentro de la DB
USE dbBanco
CREATE USER Thomas 
FROM LOGIN Thomas
CREATE USER Samos  
FROM LOGIN  Samos 
GO
CREATE USER Kira  
FROM LOGIN  Kira 
GO
--Se crea el rol consulta ventas para Thomas
CREATE ROLE Rol_Administrativo AUTHORIZATION Thomas;
GO
--Se crea el rol exec user sps para Thomas
CREATE ROLE Rol_Mantenimiento_Clientes AUTHORIZATION Thomas;
GO
--Se crea el rol deny exec user sps para Samos
CREATE ROLE Consulta_Operaciones AUTHORIZATION Samos;
GO
--Se crea el rol full access categorias Para Kira
CREATE ROLE Lectura_General AUTHORIZATION Kira;
GO
-- Se dan los privilegios de SELECT necesarios
GRANT SELECT ON v_Production_Products TO ROL_CONSULTA_VENTAS

GRANT SELECT ON v_Sales_Customers TO ROL_CONSULTA_VENTAS

GRANT SELECT ON v_Sales_Orders TO ROL_CONSULTA_VENTAS

GRANT SELECT ON v_Sales_OrderDetails TO ROL_CONSULTA_VENTAS
/*Es requerido aplicar (GRANT) todos los objetos que caigan en la gobernanza de los roles
anteriores. (TRABAJAR EN ESTO)*/
-- Privilegios EXEC USER SPS
GRANT EXECUTE ON dbo.sp_AddProduct TO ROL_EXEC_USER_SPS;
GRANT EXECUTE ON dbo.sp_totalSalesIncomebyDate TO ROL_EXEC_USER_SPS;
-- Privilegios DENY SPS
DENY EXECUTE ON dbo.sp_AddProduct TO ROL_DENY_EXEC_USER_SPS;
DENY EXECUTE ON dbo.sp_totalSalesIncomebyDate TO ROL_DENY_EXEC_USER_SPS;
--Privilegios fulla access categoria
GRANT EXECUTE ON dbo.sp_addCategory TO ROL_FULL_ACCESS_Categoria;
GRANT EXECUTE ON dbo.sp_updateCategory TO ROL_FULL_ACCESS_Categoria;
GRANT EXECUTE ON dbo.sp_removeCategory TO ROL_FULL_ACCESS_Categoria;

ALTER ROLE ROL_CONSULTA_VENTAS 
ADD MEMBER Thomas
ALTER ROLE ROL_EXEC_USER_SPS
ADD MEMBER Thomas
ALTER ROLE ROL_DENY_EXEC_USER_SPS
ADD MEMBER Samos
ALTER ROLE ROL_FULL_ACCESS_Categoria
ADD MEMBER Kira
CREATE USER AgenciaA WITHOUT LOGIN;  
CREATE USER EmpleadoThomas WITHOUT LOGIN;  
GO

GRANT SELECT ON v_Operacion_Crediticia TO Manager;  
GO

CREATE SCHEMA Security;  
GO  
  
CREATE FUNCTION Security.fn_securitypredicate(@SalesRep AS sysname)  
    RETURNS TABLE  
WITH SCHEMABINDING  
AS  
    RETURN SELECT 1 AS fn_securitypredicate_result
WHERE @SalesRep = USER_NAME() OR USER_NAME() = 'Manager';
GO

--Check SQL Server Version
SELECT @@VERSION
GO
--Compliance with SQL Server baselines
SELECT SERVERPROPERTY('ProductLevel') as SP_installed,
SERVERPROPERTY('ProductVersion') as Version;
GO
--2.1 Ensure 'Ad Hoc Distributed Queries' Server Configuration Option is
--SET to '0' (Scored)
SELECT name, CAST(value as int) as value_configured, CAST(value_in_use as int) as value_in
FROM sys.configurations
WHERE NAME = 'Ad Hoc Distributed Queries'
GO
--Enable sp_configure show advanced options
EXECUTE sp_configure 'show advanced options', 1;
RECONFIGURE;
GO
--Remediation for 2.1
EXECUTE sp_configure 'Ad Hoc Distributed Queries', 0;
RECONFIGURE;
GO
--Disable sp_configure show advanced options
EXECUTE sp_configure 'show advanced options', 0;
RECONFIGURE;
GO
--2.2 Ensure 'CLR Enabled' Server Configuration Option is set to '0' (Scored)
SELECT name,
CAST(value as int) as value_configured,
CAST(value_in_use as int) as value_in_use
FROM sys.configurations
WHERE name = 'clr enabled';
GO
--Remediation for 2.2:
EXECUTE sp_configure 'clr enabled', 0;
RECONFIGURE;
GO
--Verification
SELECT name,
CAST(value as int) as value_configured,
CAST(value_in_use as int) as value_in_use
FROM sys.configurations
WHERE name = 'clr enabled';
GO
--2.3 Ensure 'Cross DB Ownership Chaining' Server Configuration Option is
--set to '0' (Scored)
SELECT name,
CAST(value as int) as value_configured,
CAST(value_in_use as int) as value_in_use
FROM sys.configurations
WHERE name = 'cross db ownership chaining';
GO
--Remediation
EXECUTE sp_configure 'cross db ownership chaining', 0;
RECONFIGURE;
GO
--Verification
SELECT name,
CAST(value as int) as value_configured,
CAST(value_in_use as int) as value_in_use
FROM sys.configurations
WHERE name = 'cross db ownership chaining';
GO
--2.4 Ensure 'Database Mail XPs' Server Configuration Option is set to '0'
--(Scored)
SELECT name,
CAST(value as int) as value_configured,
CAST(value_in_use as int) as value_in_use
FROM sys.configurations
WHERE name = 'Database Mail XPs';
GO
--Remediation
--Activate show advanced options
EXECUTE sp_configure 'show advanced options', 1;
RECONFIGURE;
GO
--Set Database Mail XP's to zero
EXECUTE sp_configure 'Database Mail XPs', 0;
RECONFIGURE;
GO
--Deactivate show advanced options
EXECUTE sp_configure 'show advanced options', 0;
RECONFIGURE;
GO
--2.5 Ensure 'Ole Automation Procedures' Server Configuration Option is
--set to '0' (Scored)
SELECT name,
CAST(value as int) as value_configured,
CAST(value_in_use as int) as value_in_use
FROM sys.configurations
WHERE name = 'Ole Automation Procedures';
GO
--Remediation
--Activate show advanced options
EXECUTE sp_configure 'show advanced options', 1;
RECONFIGURE;
GO
--Set Database Mail XP's to zero
EXECUTE sp_configure 'Ole Automation Procedures', 0;
RECONFIGURE;
GO
--Deactivate show advanced options
EXECUTE sp_configure 'show advanced options', 0;
RECONFIGURE;
GO
--Verification
SELECT name,
CAST(value as int) as value_configured,
CAST(value_in_use as int) as value_in_use
FROM sys.configurations
WHERE name = 'Ole Automation Procedures';
GO
/*2.6 Ensure 'Remote Access' Server Configuration Option is set to '0'
(Scored)*/
SELECT name,
CAST(value as int) as value_configured,
CAST(value_in_use as int) as value_in_use
FROM sys.configurations
WHERE name = 'remote access';
GO
--Remediation
--Activate show advanced options
EXECUTE sp_configure 'show advanced options', 1;
RECONFIGURE;
GO
--Set Database Mail XP's to zero
EXECUTE sp_configure 'remote access', 0;
RECONFIGURE;
GO
--Deactivate show advanced options
EXECUTE sp_configure 'show advanced options', 0;
RECONFIGURE;
GO
--Verification
SELECT name,
CAST(value as int) as value_configured,
CAST(value_in_use as int) as value_in_use
FROM sys.configurations
WHERE name = 'remote access';
GO
/*2.7 Ensure 'Remote Admin Connections' Server Configuration Option is*/
USE master;
GO
SELECT name,
CAST(value as int) as value_configured,
CAST(value_in_use as int) as value_in_use
FROM sys.configurations
WHERE name = 'remote admin connections'
AND SERVERPROPERTY('IsClustered') = 0;
GO
--Remediation
EXECUTE sp_configure 'remote admin connections', 0;
RECONFIGURE;
GO
--Verification
USE master;
GO
SELECT name,
CAST(value as int) as value_configured,
CAST(value_in_use as int) as value_in_use
FROM sys.configurations
WHERE name = 'remote admin connections'
AND SERVERPROPERTY('IsClustered') = 0;
GO
/**2.8 Ensure 'Scan For Startup Procs' Server Configuration Option is set to
'0' (Scored)**/
SELECT name,
CAST(value as int) as value_configured,
CAST(value_in_use as int) as value_in_use
FROM sys.configurations
WHERE name = 'scan for startup procs';
GO
--Remediation
--Activate show advanced options
EXECUTE sp_configure 'show advanced options', 1;
RECONFIGURE;
GO
--Set Database Mail XP's to zero
EXECUTE sp_configure 'scan for startup procs', 0;
RECONFIGURE;
GO
--Deactivate show advanced options
EXECUTE sp_configure 'show advanced options', 0;
RECONFIGURE;
GO
/*2.9 Ensure 'Trustworthy' Database Property is set to 'Off' (Scored)*/
SELECT name
FROM sys.databases
WHERE is_trustworthy_on = 1
AND name != 'msdb';
GO
--Remediation
--In this case for each DATABASE that has Trustworthy
--activated, the following command will need to be executed
--ALTER DATABASE [<database_name>] SET TRUSTWORTHY OFF;
--GO
/*2.10 Ensure Unnecessary SQL Server Protocols are set to 'Disabled' (Not
Scored)*/
--Check current connections
SELECT  
    local_tcp_port,session_id,connect_time,net_transport ,num_reads ,num_writes,client_net_address ,
	(select text from sys.dm_exec_sql_text(most_recent_sql_handle)) as Query
FROM sys.dm_exec_connections 
order by connect_time  desc
GO

/**2.11 Ensure SQL Server is configured to use non-standard ports (Not
Scored)**/
DECLARE @value nvarchar(256);
EXECUTE master.dbo.xp_instance_regread
N'HKEY_LOCAL_MACHINE',
N'SOFTWARE\Microsoft\Microsoft SQL
Server\MSSQLServer\SuperSocketNetLib\Tcp\IPAll',
N'TcpPort',
@value OUTPUT,
N'no_output';
SELECT @value AS TCP_Port WHERE @value = '1433';
GO
/**2.12 Ensure 'Hide Instance' option is set to 'Yes' for Production SQL
Server instances (Scored)**/
DECLARE @getValue INT;
EXEC master.sys.xp_instance_regread
@rootkey = N'HKEY_LOCAL_MACHINE',
@key = N'SOFTWARE\Microsoft\Microsoft SQL
Server\MSSQLServer\SuperSocketNetLib',
@value_name = N'HideInstance',
@value = @getValue OUTPUT;
SELECT @getValue;
GO
--Remediation

/**EXEC master.sys.xp_instance_regwrite
@rootkey = N'HKEY_LOCAL_MACHINE',
@key = N'SOFTWARE\Microsoft\Microsoft SQL
Server\MSSQLServer\SuperSocketNetLib',
@value_name = N'HideInstance',
@type = N'REG_DWORD',
@value = 1;
GO**/

--Verification
/**DECLARE @getValue INT;
EXEC master.sys.xp_instance_regread
@rootkey = N'HKEY_LOCAL_MACHINE',
@key = N'SOFTWARE\Microsoft\Microsoft SQL
Server\MSSQLServer\SuperSocketNetLib',
@value_name = N'HideInstance',
@value = @getValue OUTPUT;
SELECT @getValue;
GO**/
--2.13 Ensure the 'sa' Login Account is set to 'Disabled' (Scored)
SELECT name, is_disabled
FROM sys.server_principals
WHERE sid = 0x01
AND is_disabled = 0;
GO
--Remediation (Pregunta al profesor: ¿Si solo tenemos
-- a 'sa', no sería mejor solo renombrar 'sa' a otro nombre? )
/*Execute the following T-SQL query:
USE [master]
GO
DECLARE @tsql nvarchar(max)
SET @tsql = 'ALTER LOGIN ' + SUSER_NAME(0x01) + ' DISABLE'
EXEC (@tsql)
GO
3*/
/*2.14 Ensure the 'sa' Login Account has been renamed (Scored)*/
SELECT name
FROM sys.server_principals
WHERE sid = 0x01;
GO
--Remediation: Renaming the user sa to something else
-- (in this case, user1)
ALTER LOGIN sa WITH NAME = user1;
GO
/*2.15 Ensure 'AUTO_CLOSE' is set to 'OFF' on contained databases
(Scored)*/
SELECT name, containment, containment_desc, is_auto_close_on
FROM sys.databases
WHERE containment <> 0 and is_auto_close_on = 1;
GO
--Remediation
/*Removing AUTO CLOSE FOR A GIVEN DATABASE*/
/*ALTER DATABASE <database_name> SET AUTO_CLOSE OFF;*/
/**GO**/
/*2.16 Ensure no login exists with the name 'sa' (Scored)*/
SELECT principal_id, name
FROM sys.server_principals
WHERE name = 'sa';
GO
--Remediation
USE [master]
GO
-- If principal_id = 1 or the login owns database objects, rename the sa
--login
/**ALTER LOGIN [sa] WITH NAME = <different_name>;**/
/**GO**/
-- If the login owns no database objects, then drop it
-- Do NOT drop the login if it is principal_id = 1
/**DROP LOGIN sa**/
/**3 Authentication and Authorization**/
/*
3.1 Ensure 'Server Authentication' Property is set to 'Windows
Authentication Mode' (Scored)
*/

SELECT SERVERPROPERTY('IsIntegratedSecurityOnly') as [login_mode];
GO
--Remediation
/*USE [master]
GO
EXEC xp_instance_regwrite N'HKEY_LOCAL_MACHINE',
N'Software\Microsoft\MSSQLServer\MSSQLServer', N'LoginMode', REG_DWORD, 1
GO*/
/*
Since we are using SQL Login Authentication for remotely accessing the 
Linux AWS Server isntance, we cannot set this to Windows Authentication mode

(Unless we had an RDS from the start. Although this is too expensive for now....)
*/

/*3.2 Ensure CONNECT permissions on the 'guest' user is Revoked within
all SQL Server databases excluding the master, msdb and tempdb
(Scored)*/
-- master database
USE master;
GO
SELECT DB_NAME() AS DatabaseName, 'guest' AS Database_User,
[permission_name], [state_desc]
FROM sys.database_permissions
WHERE [grantee_principal_id] = DATABASE_PRINCIPAL_ID('guest')
AND [state_desc] LIKE 'GRANT%'
AND [permission_name] = 'CONNECT'
AND DB_NAME() NOT IN ('master','tempdb','msdb');
GO
-- model database
USE model;
GO
SELECT DB_NAME() AS DatabaseName, 'guest' AS Database_User,
[permission_name], [state_desc]
FROM sys.database_permissions
WHERE [grantee_principal_id] = DATABASE_PRINCIPAL_ID('guest')
AND [state_desc] LIKE 'GRANT%'
AND [permission_name] = 'CONNECT'
AND DB_NAME() NOT IN ('master','tempdb','msdb');
GO
/**-- <database_name_here> database

USE <database_name_here>;
GO
SELECT DB_NAME() AS DatabaseName, 'guest' AS Database_User,
[permission_name], [state_desc]
FROM sys.database_permissions
WHERE [grantee_principal_id] = DATABASE_PRINCIPAL_ID('guest')
AND [state_desc] LIKE 'GRANT%'
AND [permission_name] = 'CONNECT'
AND DB_NAME() NOT IN ('master','tempdb','msdb');
GO**/
--Remediation
/*
USE <database_name>;
GO
REVOKE CONNECT FROM guest;
*/
/*3.3 Ensure 'Orphaned Users' are Dropped From SQL Server Databases
(Scored)*/
/*
USE [<database_name>];
GO
EXEC sp_change_users_login @Action='Report';
Remediation:
If the orphaned user cannot or should not be matched to an
*/
/*Example: with master*/
USE master;
GO
EXEC sp_change_users_login @Action='Report';
GO
--Remediation
/*USE [<database_name>];
GO
DROP USER <username>;*/
/*3.4 Ensure SQL Authentication is not used in contained databases
(Scored)*/
SELECT name AS user1 -- or sa, or any other user
FROM sys.database_principals
WHERE name NOT IN ('dbo','Information_Schema','sys','guest')
AND type IN ('U','S','G')
AND authentication_type = 2;
GO
--Remediation
/**3.5 Ensure the SQL Server’s MSSQL Service Account is Not an
Administrator (Not Scored)**/
/*Not available in EC2*/
/*3.6 Ensure the SQL Server’s SQLAgent Service Account is Not an
Administrator (Not Scored)*/
/*Not available in EC2*/
/*3.7 Ensure the SQL Server’s Full-Text Service Account is Not an
Administrator (Not Scored)*/
/*Not available in EC2*/
/*3.8 Ensure only the default permissions specified by Microsoft are
granted to the public server role (Scored)*/
SELECT *
FROM master.sys.server_permissions
WHERE (grantee_principal_id = SUSER_SID(N'public') and state_desc LIKE
'GRANT%')
AND NOT (state_desc = 'GRANT' and [permission_name] = 'VIEW ANY DATABASE' and
class_desc = 'SERVER')
AND NOT (state_desc = 'GRANT' and [permission_name] = 'CONNECT' and
class_desc = 'ENDPOINT' and major_id = 2)
AND NOT (state_desc = 'GRANT' and [permission_name] = 'CONNECT' and
class_desc = 'ENDPOINT' and major_id = 3)
AND NOT (state_desc = 'GRANT' and [permission_name] = 'CONNECT' and
class_desc = 'ENDPOINT' and major_id = 4)
AND NOT (state_desc = 'GRANT' and [permission_name] = 'CONNECT' and
class_desc = 'ENDPOINT' and major_id = 5);
GO
--Remediation
/*USE [master]
GO
REVOKE <permission_name> FROM public;
GO*/
/*3.9 Ensure Windows BUILTIN groups are not SQL Logins (Scored)*/
SELECT pr.[name], pe.[permission_name], pe.[state_desc]
FROM sys.server_principals pr
JOIN sys.server_permissions pe
ON pr.principal_id = pe.grantee_principal_id
WHERE pr.name like 'BUILTIN%';
GO
/**Work on this**/
/*pending....*/
/*3.10 Ensure Windows local groups are not SQL Logins (Scored)*/
USE [master]
GO
SELECT pr.[name] AS LocalGroupName, pe.[permission_name], pe.[state_desc]
FROM sys.server_principals pr
JOIN sys.server_permissions pe
ON pr.[principal_id] = pe.[grantee_principal_id]
WHERE pr.[type_desc] = 'WINDOWS_GROUP'
AND pr.[name] like CAST(SERVERPROPERTY('MachineName') AS nvarchar) + '%';
--Remediation
/*Drop Logins for each row*/
/*
USE [master]
GO DROP LOGIN [<name>] --login name here
GO*/

/*3.11 Ensure the public role in the msdb database is not granted access*/
USE [msdb]
GO
SELECT sp.name AS proxyname
FROM dbo.sysproxylogin spl
JOIN sys.database_principals dp
ON dp.sid = spl.sid
JOIN sysproxies sp
ON sp.proxy_id = spl.proxy_id
WHERE principal_id = USER_ID('public');
GO
--Remediations
USE [msdb]
GO
EXEC dbo.sp_revoke_login_from_proxy @name = N'public', @proxy_name =
N'<proxyname>';
GO
/*4 Password Policies*/
/*4.1 Ensure 'MUST_CHANGE' Option is set to 'ON' for All SQL
Authenticated Logins (Not Scored)*/
/*Does not apply in EC2*/
/*4.2 Ensure 'CHECK_EXPIRATION' Option is set to 'ON' for All SQL
Authenticated Logins Within the Sysadmin Role (Scored)*/
SELECT l.[name], 'sysadmin membership' AS 'Access_Method'
FROM sys.sql_logins AS l
WHERE IS_SRVROLEMEMBER('sysadmin',name) = 1
AND l.is_expiration_checked <> 1
UNION ALL
SELECT l.[name], 'CONTROL SERVER' AS 'Access_Method'
FROM sys.sql_logins AS l
JOIN sys.server_permissions AS p
ON l.principal_id = p.grantee_principal_id
WHERE p.type = 'CL' AND p.state IN ('G', 'W')
AND l.is_expiration_checked <> 1;
GO
--Remediation
/*
We must include this rule for each user within sysadmin roles
(in this case -> user1) 
*/
/*ALTER LOGIN <login_name> WITH CHECK_EXPIRATION = ON;*/
ALTER LOGIN user1 WITH CHECK_EXPIRATION = ON;
GO
/**4.3 Ensure 'CHECK_POLICY' Option is set to 'ON' for All SQL
Authenticated Logins (Scored)**/ 
SELECT name, is_disabled
FROM sys.sql_logins
WHERE is_policy_checked = 0;
GO
--Remediation
ALTER LOGIN user1 WITH CHECK_POLICY = ON;
GO
/*Verification*/
SELECT name, is_disabled
FROM sys.sql_logins
WHERE is_policy_checked = 0;
GO
/*5 Auditing and Logging
This section contains recommendatio*/
/*5.1 Ensure 'Maximum number of error log files' is set to greater than or
equal to '12' (Scored)*/
DECLARE @NumErrorLogs int;
EXEC master.sys.xp_instance_regread
N'HKEY_LOCAL_MACHINE',
N'Software\Microsoft\MSSQLServer\MSSQLServer',
N'NumErrorLogs',
@NumErrorLogs OUTPUT;
SELECT ISNULL(@NumErrorLogs, -1) AS [NumberOfLogFiles];
GO
/* Remedation*/
/**Work in this punto**/
EXEC master.sys.xp_instance_regwrite
N'HKEY_LOCAL_MACHINE',
N'Software\Microsoft\MSSQLServer\MSSQLServer',
N'NumErrorLogs',
REG_DWORD,
12;
GO
/*Verification*/
/*5.2 Ensure 'Default Trace Enabled' Server Configuration Option is set to
'1' (Scored)*/
SELECT name,
CAST(value as int) as value_configured,
CAST(value_in_use as int) as value_in_use
FROM sys.configurations
WHERE name = 'default trace enabled';
GO
--Remediation
EXECUTE sp_configure 'show advanced options', 1;
RECONFIGURE;
EXECUTE sp_configure 'default trace enabled', 1;
RECONFIGURE;
GO
EXECUTE sp_configure 'show advanced options', 0;
RECONFIGURE;
GO
/*Verification*/
/*5.3 Ensure 'Login Auditing' is set to 'failed logins' (Scored)*/
EXEC xp_loginconfig 'audit level';
GO
/*
EXEC xp_instance_regwrite N'HKEY_LOCAL_MACHINE',
N'Software\Microsoft\MSSQLServer\MSSQLServer', N'AuditLevel',
REG_DWORD, 2
 */

 /*5.4 Ensure 'SQL Server Audit' is set to capture both 'failed' and
'successful logins' (Scored)*/

SELECT
S.name AS 'Audit Name'
, CASE S.is_state_enabled
WHEN 1 THEN 'Y'
WHEN 0 THEN 'N' END AS 'Audit Enabled'
, S.type_desc AS 'Write Location'
, SA.name AS 'Audit Specification Name'
, CASE SA.is_state_enabled
WHEN 1 THEN 'Y'
WHEN 0 THEN 'N' END AS 'Audit Specification Enabled'
, SAD.audit_action_name
, SAD.audited_result
FROM sys.server_audit_specification_details AS SAD
JOIN sys.server_audit_specifications AS SA
ON SAD.server_specification_id = SA.server_specification_id
JOIN sys.server_audits AS S
ON SA.audit_guid = S.audit_guid
WHERE SAD.audit_action_id IN ('CNAU', 'LGFL', 'LGSD');
GO
--Remediation
CREATE SERVER AUDIT TrackLogins
TO APPLICATION_LOG;
GO
CREATE SERVER AUDIT SPECIFICATION TrackAllLogins
FOR SERVER AUDIT TrackLogins
ADD (FAILED_LOGIN_GROUP),
ADD (SUCCESSFUL_LOGIN_GROUP),
ADD (AUDIT_CHANGE_GROUP)
WITH (STATE = ON);
GO
ALTER SERVER AUDIT TrackLogins
WITH (STATE = ON);
GO
--Verification
SELECT
S.name AS 'Audit Name'
, CASE S.is_state_enabled
WHEN 1 THEN 'Y'
WHEN 0 THEN 'N' END AS 'Audit Enabled'
, S.type_desc AS 'Write Location'
, SA.name AS 'Audit Specification Name'
, CASE SA.is_state_enabled
WHEN 1 THEN 'Y'
WHEN 0 THEN 'N' END AS 'Audit Specification Enabled'
, SAD.audit_action_name
, SAD.audited_result
FROM sys.server_audit_specification_details AS SAD
JOIN sys.server_audit_specifications AS SA
ON SAD.server_specification_id = SA.server_specification_id
JOIN sys.server_audits AS S
ON SA.audit_guid = S.audit_guid
WHERE SAD.audit_action_id IN ('CNAU', 'LGFL', 'LGSD');
GO
--6 Application Development
/*6.1 Ensure Database and Application User Input is Sanitized (Not Scored)*/
/*
Check with the application teams to ensure any database interaction is through the use of
stored procedures and not dynamic SQL. Revoke any INSERT , UPDATE , or DELETE privileges
to users so that modifications to data must be done through stored procedures. Verify that
there's no SQL query in the application code produced by string concatenation.
*/

/*


Remediation


*/

/*6.2 Ensure 'CLR Assembly Permission Set' is set to 'SAFE_ACCESS' for All*/
SELECT name,
permission_set_desc
FROM sys.assemblies
WHERE is_user_defined = 1;
GO
--Remediation
/*
ALTER ASSEMBLY <assembly_name> WITH PERMISSION_SET = SAFE;
GO
*/
/*7 Encryption*/
/*
7.1 Ensure 'Symmetric Key encryption algorithm' is set to 'AES_128' or
higher in non-system databases (Scored)
*/
USE dbBanco
GO
SELECT db_name() AS Database_Name, name AS Key_Name
FROM sys.symmetric_keys
WHERE algorithm_desc NOT IN ('AES_128','AES_192','AES_256')
AND db_id() > 4;
GO
/*
Remediation

Update all Encrypted data to use newer algorithms

*/
/*
7.2 Ensure Asymmetric Key Size is set to 'greater than or equal to 2048'
*/
USE dbBanco
GO
SELECT db_name() AS Database_Name, name AS Key_Name
FROM sys.asymmetric_keys
WHERE key_length < 2048
AND db_id() > 4;
GO

/*
Remediation

Update all Encrypted data to use newer, stronger algorithms. 

*/

/*
8 Appendix: Additional Considerations
*/
/*
8.1 Ensure 'SQL Server Browser Service' is configured correctly (Not)
*/

/*
Remediation:
Enable or disable the service as needed for your environment.
*/
DECLARE @Now DATE
SET @Now = GETDATE()
EXECUTE dbo.NuevoCliente 'Aaa', 'Samos', 'Robinson', 'Roderick',1,@Now,1,1,
2,4,6,'Linea 1', 'Linea 2', 36582, @Now, 1, 1, '88777744', 1, 2
GO

SELECT * FROM v_Agencia
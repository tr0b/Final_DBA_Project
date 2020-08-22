ALTER TABLE Sales.Customers ADD  CONSTRAINT PK_Customers PRIMARY KEY CLUSTERED 
(
    custid ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO


 
CREATE NONCLUSTERED INDEX idx_nc_custid ON Sales.Orders
(
    custid ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO

/*Index creation*/
CREATE UNIQUE CLUSTERED INDEX C_Idx_Op_Crediticia ON Operacion_Crediticia(ID)
CREATE NONCLUSTERED INDEX Idx_Fecha_Vencimiento_Operacion ON Operacion_Crediticia(Fecha_Vencimiento ASC)
CREATE NONCLUSTERED INDEX Idx_Fecha_Inicio_Operacion ON Operacion_Crediticia(Fecha_Formalizacion ASC)
CREATE NONCLUSTERED INDEX Idx_Tipo_Operacion_Crediticia ON Operacion_Crediticia(FK_Tipo_Operacion_Crediticia_ID)
CREATE NONCLUSTERED INDEX Idx_Garantias_Operacion ON Garantia_Operacion_Crediticia(FK_Garantia_ID ASC)
CREATE NONCLUSTERED INDEX Idx_Cuota_Fija_Opt ON Operacion_Crediticia(Cuota_Principal DESC)
CREATE NONCLUSTERED INDEX Idx_Porcentaje_Completado ON Movimiento(FK_Operacion_Crediticia_ID DESC)
CREATE NONCLUSTERED INDEX Idx_Monto_Original ON Operacion_Crediticia(Monto_Original DESC)
CREATE NONCLUSTERED INDEX Idx_Saldo_Vencido ON Operacion_Crediticia(Saldo_Amortizado DESC)
CREATE NONCLUSTERED INDEX Idx_Cantidad_Cuotas_Vencidas ON Operacion_Crediticia(Cuotas_Vencidas DESC)

DROP VIEW v_Operacion_Crediticia

ALTER TABLE Operacion_Crediticia
	ADD CONSTRAINT C_Idx_Op_Crediticia UNIQUE NONCLUSTERED (ID DESC)
GO
ALTER TABLE Operacion_Crediticia
	ADD INDEX Idx_Fecha_Vencimiento_Operacion HASH Operacion_Crediticia(Fecha_Vencimiento ASC) WITH (BUCKET_COUNT = 64);
GO
ALTER TABLE Operacion_Crediticia
	ADD INDEX Idx_Fecha_Inicio_Operacion HASH Operacion_Crediticia(Fecha_Formalizacion ASC) WITH (BUCKET_COUNT = 64);
GO
ALTER TABLE Operacion_Crediticia
	ADD INDEX Idx_Tipo_Operacion_Crediticia HASH Operacion_Crediticia(FK_Tipo_Operacion_Crediticia_ID ASC) WITH (BUCKET_COUNT = 64);
GO
ALTER TABLE Operacion_Crediticia
	ADD INDEX Idx_Cuota_Fija_Opt HASH Operacion_Crediticia(Cuota_Principal DESC) WITH (BUCKET_COUNT = 64);
GO
ALTER TABLE Operacion_Crediticia
	ADD INDEX Idx_Monto_Original HASH Operacion_Crediticia(Monto_Original DESC) WITH (BUCKET_COUNT = 64);
GO
ALTER TABLE Operacion_Crediticia
	ADD INDEX Idx_Saldo_Vencido HASH Operacion_Crediticia(Saldo_Amortizado DESC) WITH (BUCKET_COUNT = 64);
GO
ALTER TABLE Operacion_Crediticia
	ADD INDEX Idx_Cantidad_Cuotas_Vencidas HASH Operacion_Crediticia(Cuotas_Vencidas DESC) WITH (BUCKET_COUNT = 64);
GO

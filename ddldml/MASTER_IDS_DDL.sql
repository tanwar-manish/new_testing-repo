/*DBTYPE:SQLSERVER|TARGETDB:HPFSIDS*/

PRINT 'Start Executing : MASTER_IDS_DDL.SQL'
-----------------Start File-----MASTER_IDS_DDL.SQL-----------------

IF EXISTS (SELECT * FROM SYS.OBJECTS WHERE OBJECT_ID = OBJECT_ID(N'dbo.REPORT_LEGECY_TERMINATED_ASSET') AND TYPE IN (N'U'))
BEGIN
    --DROP TABLE dbo.REPORT_LEGECY_TERMINATED_ASSET
    PRINT '>> CUSTOMER PORTAL : TABLE dbo.REPORT_LEGECY_TERMINATED_ASSET EXISTS >>'
END

IF NOT EXISTS (SELECT * FROM SYS.OBJECTS WHERE OBJECT_ID = OBJECT_ID(N'dbo.REPORT_LEGECY_TERMINATED_ASSET') AND TYPE IN (N'U'))
BEGIN
    PRINT '>> CUSTOMER PORTAL : TABLE dbo.REPORT_LEGECY_TERMINATED_ASSET CREATED >>'
END

CREATE TABLE [dbo].[REPORT_LEGECY_TERMINATED_ASSET] ([CH_ID] NUMERIC(18, 0) NULL ,
[CD_ID] BIGINT NULL ,
[ASSET_CD] VARCHAR(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[PARENT_ASSET_CD] NVARCHAR(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[CUR_CD] NVARCHAR(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[GPC_ASSET_ROLE_CD] NVARCHAR(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[ASSET_FINANCE_TYP_CD] NVARCHAR(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[ASSET_STATUS_CD] NVARCHAR(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[ASSET_STATUS] VARCHAR(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[PO_NO] NVARCHAR(500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[ASSET_LOC_CD] NVARCHAR(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[INV_BILL_TO_CD] VARCHAR(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[TERMINATION_DT] DATETIME NULL ,
[HOLD_EFF_DT] DATE NULL ,
[SUPPLIER_INV_DT] DATE NULL ,
[SUPPLIER_INV_NO] NVARCHAR(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[TERMINATED_FLAG] VARCHAR(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[AVG_RENT_PER_MONTH_AMT] DECIMAL(38, 7) NULL ,
[TOT_LEASE_RCVBL_AMT] DECIMAL(38, 7) NULL ,
[LAST_BILLED_RENT_AMT] DECIMAL(38, 7) NULL ,
[LAST_BILLED_TAX_AMT] DECIMAL(38, 7) NULL ,
[LAST_BILLED_TOT_AMT] DECIMAL(38, 7) NULL ,
[ASSET_LOC_ADDR] NVARCHAR(2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[BILL_ADDR] NVARCHAR(400) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[SERIAL_NO] NVARCHAR(1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[ACCEPTANCE_DT] DATE NULL ,
[EQUIP_COST_AMT] DECIMAL(38, 7) NULL ,
[VNDR_NM] NVARCHAR(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[MFG_CD] NVARCHAR(1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[EQUIP_TYPE_CD] NVARCHAR(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[MFG_PART_NO] NVARCHAR(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[ASSET_DESC] NVARCHAR(500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[PARENT_ASSET_IND] VARCHAR(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[METERED_ASSET_IND] CHAR(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[QUANTITY] INT NULL ,
[ASSETSERIALNUMBERID] BIGINT NULL ,
[LASTREFRESHTIME] DATETIME NULL)
CREATE NONCLUSTERED INDEX [IX_Report_Legecy_Terminated_Asset_ASSET_CD] ON [dbo].[REPORT_LEGECY_TERMINATED_ASSET] ([ASSET_CD] ASC)
CREATE NONCLUSTERED INDEX [REPORT_LEGECY_TERMINATED_ASSET_INDX_CH_ID] ON [dbo].[REPORT_LEGECY_TERMINATED_ASSET] ([ASSET_CD] ASC)
CREATE NONCLUSTERED INDEX [REPORT_LEGECY_TERMINATED_ASSET_INDX_ASSETSERIALNUMBERID] ON [dbo].[REPORT_LEGECY_TERMINATED_ASSET] ([ASSETSERIALNUMBERID] ASC)PRINT '>> CUSTOMER PORTAL : TABLE dbo.REPORT_LEGECY_TERMINATED_ASSET CREATED >>'
END

PRINT 'Start Executing : MASTER_IDS_DDL.SQL'
-----------------Start File-----MASTER_IDS_DDL.SQL-----------------

IF EXISTS (SELECT * FROM SYS.OBJECTS WHERE OBJECT_ID = OBJECT_ID(N'dbo.abc') AND TYPE IN (N'U'))
BEGIN
    --DROP TABLE dbo.abc
    PRINT '>> CUSTOMER PORTAL : TABLE dbo.abc EXISTS >>'
END

IF NOT EXISTS (SELECT * FROM SYS.OBJECTS WHERE OBJECT_ID = OBJECT_ID(N'dbo.abc') AND TYPE IN (N'U'))
BEGIN
    PRINT '>> CUSTOMER PORTAL : TABLE dbo.abc CREATED >>'
END

----------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE [dbo].[REPORT_LEGECY_TERMINATED_ASSET] ([CH_ID] NUMERIC(18, 0) NULL,
[CD_ID] BIGINT NULL,
[ASSET_CD] VARCHAR(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PARENT_ASSET_CD] NVARCHAR(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CUR_CD] NVARCHAR(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GPC_ASSET_ROLE_CD] NVARCHAR(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ASSET_FINANCE_TYP_CD] NVARCHAR(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ASSET_STATUS_CD] NVARCHAR(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ASSET_STATUS] VARCHAR(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PO_NO] NVARCHAR(500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ASSET_LOC_CD] NVARCHAR(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[INV_BILL_TO_CD] VARCHAR(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TERMINATION_DT] DATETIME NULL,
[HOLD_EFF_DT] DATE NULL,
[SUPPLIER_INV_DT] DATE NULL,
[SUPPLIER_INV_NO] NVARCHAR(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TERMINATED_FLAG] VARCHAR(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AVG_RENT_PER_MONTH_AMT] DECIMAL(38, 7) NULL,
[TOT_LEASE_RCVBL_AMT] DECIMAL(38, 7) NULL,
[LAST_BILLED_RENT_AMT] DECIMAL(38, 7) NULL,
[LAST_BILLED_TAX_AMT] DECIMAL(38, 7) NULL,
[LAST_BILLED_TOT_AMT] DECIMAL(38, 7) NULL,
[ASSET_LOC_ADDR] NVARCHAR(2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BILL_ADDR] NVARCHAR(400) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SERIAL_NO] NVARCHAR(1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ACCEPTANCE_DT] DATE NULL,
[EQUIP_COST_AMT] DECIMAL(38, 7) NULL,
[VNDR_NM] NVARCHAR(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MFG_CD] NVARCHAR(1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EQUIP_TYPE_CD] NVARCHAR(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MFG_PART_NO] NVARCHAR(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ASSET_DESC] NVARCHAR(500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PARENT_ASSET_IND] VARCHAR(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[METERED_ASSET_IND] CHAR(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[QUANTITY] INT NULL,
[ASSETSERIALNUMBERID] BIGINT NULL,
[LASTREFRESHTIME] DATETIME NULL)
CREATE NONCLUSTERED INDEX [IX_Report_Legecy_Terminated_Asset_ASSET_CD] ON [dbo].[REPORT_LEGECY_TERMINATED_ASSET] ([ASSET_CD] ASC)
CREATE NONCLUSTERED INDEX [REPORT_LEGECY_TERMINATED_ASSET_INDX_CH_ID] ON [dbo].[REPORT_LEGECY_TERMINATED_ASSET] ([ASSET_CD] ASC)
CREATE NONCLUSTERED INDEX [REPORT_LEGECY_TERMINATED_ASSET_INDX_ASSETSERIALNUMBERID] ON [dbo].[REPORT_LEGECY_TERMINATED_ASSET] ([ASSETSERIALNUMBERID] ASC)PRINT '>> CUSTOMER PORTAL : TABLE dbo.abc CREATED >>'
END

PRINT 'Start Executing : MASTER_IDS_DDL.SQL'
-----------------Start File-----MASTER_IDS_DDL.SQL-----------------

IF EXISTS (SELECT * FROM SYS.OBJECTS WHERE OBJECT_ID = OBJECT_ID(N'dbo.REPORT_LEGECY_TERMINATED_ASSET') AND TYPE IN (N'U'))
BEGIN
    --DROP TABLE dbo.REPORT_LEGECY_TERMINATED_ASSET
    PRINT '>> CUSTOMER PORTAL : TABLE dbo.REPORT_LEGECY_TERMINATED_ASSET EXISTS >>'
END

IF NOT EXISTS (SELECT * FROM SYS.OBJECTS WHERE OBJECT_ID = OBJECT_ID(N'dbo.REPORT_LEGECY_TERMINATED_ASSET') AND TYPE IN (N'U'))
BEGIN
    PRINT '>> CUSTOMER PORTAL : TABLE dbo.REPORT_LEGECY_TERMINATED_ASSET CREATED >>'
END

CREATE TABLE [dbo].[REPORT_LEGECY_TERMINATED_ASSET] ([CH_ID] NUMERIC(18, 0) NULL ,
[CD_ID] BIGINT NULL ,
[ASSET_CD] VARCHAR(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[PARENT_ASSET_CD] NVARCHAR(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[CUR_CD] NVARCHAR(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[GPC_ASSET_ROLE_CD] NVARCHAR(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[ASSET_FINANCE_TYP_CD] NVARCHAR(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[ASSET_STATUS_CD] NVARCHAR(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[ASSET_STATUS] VARCHAR(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[PO_NO] NVARCHAR(500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[ASSET_LOC_CD] NVARCHAR(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[INV_BILL_TO_CD] VARCHAR(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[TERMINATION_DT] DATETIME NULL ,
[HOLD_EFF_DT] DATE NULL ,
[SUPPLIER_INV_DT] DATE NULL ,
[SUPPLIER_INV_NO] NVARCHAR(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[TERMINATED_FLAG] VARCHAR(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[AVG_RENT_PER_MONTH_AMT] DECIMAL(38, 7) NULL ,
[TOT_LEASE_RCVBL_AMT] DECIMAL(38, 7) NULL ,
[LAST_BILLED_RENT_AMT] DECIMAL(38, 7) NULL ,
[LAST_BILLED_TAX_AMT] DECIMAL(38, 7) NULL ,
[LAST_BILLED_TOT_AMT] DECIMAL(38, 7) NULL ,
[ASSET_LOC_ADDR] NVARCHAR(2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[BILL_ADDR] NVARCHAR(400) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[SERIAL_NO] NVARCHAR(1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[ACCEPTANCE_DT] DATE NULL ,
[EQUIP_COST_AMT] DECIMAL(38, 7) NULL ,
[VNDR_NM] NVARCHAR(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[MFG_CD] NVARCHAR(1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[EQUIP_TYPE_CD] NVARCHAR(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[MFG_PART_NO] NVARCHAR(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[ASSET_DESC] NVARCHAR(500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[PARENT_ASSET_IND] VARCHAR(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[METERED_ASSET_IND] CHAR(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[QUANTITY] INT NULL ,
[ASSETSERIALNUMBERID] BIGINT NULL ,
[LASTREFRESHTIME] DATETIME NULL)
CREATE NONCLUSTERED INDEX [IX_Report_Legecy_Terminated_Asset_ASSET_CD] ON [dbo].[REPORT_LEGECY_TERMINATED_ASSET] ([ASSET_CD] ASC)
CREATE NONCLUSTERED INDEX [REPORT_LEGECY_TERMINATED_ASSET_INDX_CH_ID] ON [dbo].[REPORT_LEGECY_TERMINATED_ASSET] ([ASSET_CD] ASC)
CREATE NONCLUSTERED INDEX [REPORT_LEGECY_TERMINATED_ASSET_INDX_ASSETSERIALNUMBERID] ON [dbo].[REPORT_LEGECY_TERMINATED_ASSET] ([ASSETSERIALNUMBERID] ASC)PRINT '>> CUSTOMER PORTAL : TABLE dbo.REPORT_LEGECY_TERMINATED_ASSET CREATED >>'
END

PRINT 'Start Executing : MASTER_IDS_DDL.SQL'
-----------------Start File-----MASTER_IDS_DDL.SQL-----------------

IF EXISTS (SELECT * FROM SYS.OBJECTS WHERE OBJECT_ID = OBJECT_ID(N'dbo.abc') AND TYPE IN (N'U'))
BEGIN
    --DROP TABLE dbo.abc
    PRINT '>> CUSTOMER PORTAL : TABLE dbo.abc EXISTS >>'
END

IF NOT EXISTS (SELECT * FROM SYS.OBJECTS WHERE OBJECT_ID = OBJECT_ID(N'dbo.abc') AND TYPE IN (N'U'))
BEGIN
    PRINT '>> CUSTOMER PORTAL : TABLE dbo.abc CREATED >>'
END

----------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE [dbo].[REPORT_LEGECY_TERMINATED_ASSET] ([CH_ID] NUMERIC(18, 0) NULL,
[CD_ID] BIGINT NULL,
[ASSET_CD] VARCHAR(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PARENT_ASSET_CD] NVARCHAR(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CUR_CD] NVARCHAR(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GPC_ASSET_ROLE_CD] NVARCHAR(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ASSET_FINANCE_TYP_CD] NVARCHAR(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ASSET_STATUS_CD] NVARCHAR(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ASSET_STATUS] VARCHAR(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PO_NO] NVARCHAR(500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ASSET_LOC_CD] NVARCHAR(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[INV_BILL_TO_CD] VARCHAR(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TERMINATION_DT] DATETIME NULL,
[HOLD_EFF_DT] DATE NULL,
[SUPPLIER_INV_DT] DATE NULL,
[SUPPLIER_INV_NO] NVARCHAR(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TERMINATED_FLAG] VARCHAR(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AVG_RENT_PER_MONTH_AMT] DECIMAL(38, 7) NULL,
[TOT_LEASE_RCVBL_AMT] DECIMAL(38, 7) NULL,
[LAST_BILLED_RENT_AMT] DECIMAL(38, 7) NULL,
[LAST_BILLED_TAX_AMT] DECIMAL(38, 7) NULL,
[LAST_BILLED_TOT_AMT] DECIMAL(38, 7) NULL,
[ASSET_LOC_ADDR] NVARCHAR(2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BILL_ADDR] NVARCHAR(400) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SERIAL_NO] NVARCHAR(1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ACCEPTANCE_DT] DATE NULL,
[EQUIP_COST_AMT] DECIMAL(38, 7) NULL,
[VNDR_NM] NVARCHAR(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MFG_CD] NVARCHAR(1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EQUIP_TYPE_CD] NVARCHAR(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MFG_PART_NO] NVARCHAR(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ASSET_DESC] NVARCHAR(500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PARENT_ASSET_IND] VARCHAR(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[METERED_ASSET_IND] CHAR(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[QUANTITY] INT NULL,
[ASSETSERIALNUMBERID] BIGINT NULL,
[LASTREFRESHTIME] DATETIME NULL)
CREATE NONCLUSTERED INDEX [IX_Report_Legecy_Terminated_Asset_ASSET_CD] ON [dbo].[REPORT_LEGECY_TERMINATED_ASSET] ([ASSET_CD] ASC)
CREATE NONCLUSTERED INDEX [REPORT_LEGECY_TERMINATED_ASSET_INDX_CH_ID] ON [dbo].[REPORT_LEGECY_TERMINATED_ASSET] ([ASSET_CD] ASC)
CREATE NONCLUSTERED INDEX [REPORT_LEGECY_TERMINATED_ASSET_INDX_ASSETSERIALNUMBERID] ON [dbo].[REPORT_LEGECY_TERMINATED_ASSET] ([ASSETSERIALNUMBERID] ASC)PRINT '>> CUSTOMER PORTAL : TABLE dbo.abc CREATED >>'
END

PRINT 'Start Executing : MASTER_IDS_DDL.SQL'
-----------------Start File-----MASTER_IDS_DDL.SQL-----------------

IF EXISTS (SELECT * FROM SYS.OBJECTS WHERE OBJECT_ID = OBJECT_ID(N'dbo.REPORT_LEGECY_TERMINATED_ASSET') AND TYPE IN (N'U'))
BEGIN
    --DROP TABLE dbo.REPORT_LEGECY_TERMINATED_ASSET
    PRINT '>> CUSTOMER PORTAL : TABLE dbo.REPORT_LEGECY_TERMINATED_ASSET EXISTS >>'
END

IF NOT EXISTS (SELECT * FROM SYS.OBJECTS WHERE OBJECT_ID = OBJECT_ID(N'dbo.REPORT_LEGECY_TERMINATED_ASSET') AND TYPE IN (N'U'))
BEGIN
    PRINT '>> CUSTOMER PORTAL : TABLE dbo.REPORT_LEGECY_TERMINATED_ASSET CREATED >>'
END

CREATE TABLE [dbo].[REPORT_LEGECY_TERMINATED_ASSET] ([CH_ID] NUMERIC(18, 0) NULL ,
[CD_ID] BIGINT NULL ,
[ASSET_CD] VARCHAR(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[PARENT_ASSET_CD] NVARCHAR(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[CUR_CD] NVARCHAR(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[GPC_ASSET_ROLE_CD] NVARCHAR(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[ASSET_FINANCE_TYP_CD] NVARCHAR(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[ASSET_STATUS_CD] NVARCHAR(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[ASSET_STATUS] VARCHAR(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[PO_NO] NVARCHAR(500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[ASSET_LOC_CD] NVARCHAR(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[INV_BILL_TO_CD] VARCHAR(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[TERMINATION_DT] DATETIME NULL ,
[HOLD_EFF_DT] DATE NULL ,
[SUPPLIER_INV_DT] DATE NULL ,
[SUPPLIER_INV_NO] NVARCHAR(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[TERMINATED_FLAG] VARCHAR(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[AVG_RENT_PER_MONTH_AMT] DECIMAL(38, 7) NULL ,
[TOT_LEASE_RCVBL_AMT] DECIMAL(38, 7) NULL ,
[LAST_BILLED_RENT_AMT] DECIMAL(38, 7) NULL ,
[LAST_BILLED_TAX_AMT] DECIMAL(38, 7) NULL ,
[LAST_BILLED_TOT_AMT] DECIMAL(38, 7) NULL ,
[ASSET_LOC_ADDR] NVARCHAR(2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[BILL_ADDR] NVARCHAR(400) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[SERIAL_NO] NVARCHAR(1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[ACCEPTANCE_DT] DATE NULL ,
[EQUIP_COST_AMT] DECIMAL(38, 7) NULL ,
[VNDR_NM] NVARCHAR(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[MFG_CD] NVARCHAR(1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[EQUIP_TYPE_CD] NVARCHAR(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[MFG_PART_NO] NVARCHAR(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[ASSET_DESC] NVARCHAR(500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[PARENT_ASSET_IND] VARCHAR(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[METERED_ASSET_IND] CHAR(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
[QUANTITY] INT NULL ,
[ASSETSERIALNUMBERID] BIGINT NULL ,
[LASTREFRESHTIME] DATETIME NULL)
CREATE NONCLUSTERED INDEX [IX_Report_Legecy_Terminated_Asset_ASSET_CD] ON [dbo].[REPORT_LEGECY_TERMINATED_ASSET] ([ASSET_CD] ASC)
CREATE NONCLUSTERED INDEX [REPORT_LEGECY_TERMINATED_ASSET_INDX_CH_ID] ON [dbo].[REPORT_LEGECY_TERMINATED_ASSET] ([ASSET_CD] ASC)
CREATE NONCLUSTERED INDEX [REPORT_LEGECY_TERMINATED_ASSET_INDX_ASSETSERIALNUMBERID] ON [dbo].[REPORT_LEGECY_TERMINATED_ASSET] ([ASSETSERIALNUMBERID] ASC)PRINT '>> CUSTOMER PORTAL : TABLE dbo.REPORT_LEGECY_TERMINATED_ASSET CREATED >>'
END

PRINT 'Start Executing : MASTER_IDS_DDL.SQL'
-----------------Start File-----MASTER_IDS_DDL.SQL-----------------

IF EXISTS (SELECT * FROM SYS.OBJECTS WHERE OBJECT_ID = OBJECT_ID(N'dbo.abc') AND TYPE IN (N'U'))
BEGIN
    --DROP TABLE dbo.abc
    PRINT '>> CUSTOMER PORTAL : TABLE dbo.abc EXISTS >>'
END

IF NOT EXISTS (SELECT * FROM SYS.OBJECTS WHERE OBJECT_ID = OBJECT_ID(N'dbo.abc') AND TYPE IN (N'U'))
BEGIN
    PRINT '>> CUSTOMER PORTAL : TABLE dbo.abc CREATED >>'
END

----------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE [dbo].[REPORT_LEGECY_TERMINATED_ASSET] ([CH_ID] NUMERIC(18, 0) NULL,
[CD_ID] BIGINT NULL,
[ASSET_CD] VARCHAR(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PARENT_ASSET_CD] NVARCHAR(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CUR_CD] NVARCHAR(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GPC_ASSET_ROLE_CD] NVARCHAR(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ASSET_FINANCE_TYP_CD] NVARCHAR(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ASSET_STATUS_CD] NVARCHAR(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ASSET_STATUS] VARCHAR(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PO_NO] NVARCHAR(500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ASSET_LOC_CD] NVARCHAR(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[INV_BILL_TO_CD] VARCHAR(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TERMINATION_DT] DATETIME NULL,
[HOLD_EFF_DT] DATE NULL,
[SUPPLIER_INV_DT] DATE NULL,
[SUPPLIER_INV_NO] NVARCHAR(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TERMINATED_FLAG] VARCHAR(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AVG_RENT_PER_MONTH_AMT] DECIMAL(38, 7) NULL,
[TOT_LEASE_RCVBL_AMT] DECIMAL(38, 7) NULL,
[LAST_BILLED_RENT_AMT] DECIMAL(38, 7) NULL,
[LAST_BILLED_TAX_AMT] DECIMAL(38, 7) NULL,
[LAST_BILLED_TOT_AMT] DECIMAL(38, 7) NULL,
[ASSET_LOC_ADDR] NVARCHAR(2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BILL_ADDR] NVARCHAR(400) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SERIAL_NO] NVARCHAR(1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ACCEPTANCE_DT] DATE NULL,
[EQUIP_COST_AMT] DECIMAL(38, 7) NULL,
[VNDR_NM] NVARCHAR(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MFG_CD] NVARCHAR(1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EQUIP_TYPE_CD] NVARCHAR(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MFG_PART_NO] NVARCHAR(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ASSET_DESC] NVARCHAR(500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PARENT_ASSET_IND] VARCHAR(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[METERED_ASSET_IND] CHAR(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[QUANTITY] INT NULL,
[ASSETSERIALNUMBERID] BIGINT NULL,
[LASTREFRESHTIME] DATETIME NULL)
CREATE NONCLUSTERED INDEX [IX_Report_Legecy_Terminated_Asset_ASSET_CD] ON [dbo].[REPORT_LEGECY_TERMINATED_ASSET] ([ASSET_CD] ASC)
CREATE NONCLUSTERED INDEX [REPORT_LEGECY_TERMINATED_ASSET_INDX_CH_ID] ON [dbo].[REPORT_LEGECY_TERMINATED_ASSET] ([ASSET_CD] ASC)
CREATE NONCLUSTERED INDEX [REPORT_LEGECY_TERMINATED_ASSET_INDX_ASSETSERIALNUMBERID] ON [dbo].[REPORT_LEGECY_TERMINATED_ASSET] ([ASSETSERIALNUMBERID] ASC)PRINT '>> CUSTOMER PORTAL : TABLE dbo.abc CREATED >>'
END


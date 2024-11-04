/*DBTYPE:SQLSERVER|TARGETDB:HPFSIDS*/
--------------------------------------------------------------------------------------------
---######### DROP - CP Objects Starts
--------------------------------------------------------------------------------------------

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'DBO.REPORT_IDS_ACTIVE_ASSET') AND [NAME] = N'REPORT_IDS_ACTIVE_ASSET_INDX_CH_ID')
BEGIN
 DROP INDEX REPORT_IDS_ACTIVE_ASSET_INDX_CH_ID ON DBO.REPORT_IDS_ACTIVE_ASSET;
 PRINT '>> Customer Portal : iNDEX REPORT_IDS_ACTIVE_ASSET_INDX_CH_ID dropped >>'
END 

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'DBO.REPORT_IDS_ACTIVE_ASSET') AND [NAME] = N'REPORT_IDS_ACTIVE_ASSET_INDX_ASSETSERIALNUMBERID')
BEGIN
 DROP INDEX REPORT_IDS_ACTIVE_ASSET_INDX_ASSETSERIALNUMBERID ON DBO.REPORT_IDS_ACTIVE_ASSET;
 PRINT '>> Customer Portal : iNDEX REPORT_IDS_ACTIVE_ASSET_INDX_ASSETSERIALNUMBERID dropped >>'
END 

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'DBO.REPORT_LEGECY_TERMINATED_ASSET') AND [NAME] = N'REPORT_LEGECY_TERMINATED_ASSET_INDX_ASSETSERIALNUMBERID')
BEGIN
 DROP INDEX REPORT_LEGECY_TERMINATED_ASSET_INDX_ASSETSERIALNUMBERID ON DBO.REPORT_LEGECY_TERMINATED_ASSET;
 PRINT '>> Customer Portal : iNDEX REPORT_LEGECY_TERMINATED_ASSET_INDX_ASSETSERIALNUMBERID dropped >>'
END 

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'DBO.REPORT_V_CP_CONTRACT') AND [NAME] = N'REPORT_V_CP_CONTRACT_CH_ID')
BEGIN
 DROP INDEX REPORT_V_CP_CONTRACT_CH_ID ON DBO.REPORT_V_CP_CONTRACT;
 PRINT '>> Customer Portal : iNDEX REPORT_V_CP_CONTRACT_CH_ID dropped >>'
END 


-------------------------------------------------------------------------------------------
---######### DROP - CP Objects Ends
--------------------------------------------------------------------------------------------


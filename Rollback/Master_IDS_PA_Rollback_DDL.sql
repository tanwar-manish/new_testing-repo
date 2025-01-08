<<<<<<< HEAD
<<<<<<< HEAD
/*DBTYPE:SQLSERVER|TARGETDB:HPFSIDS*/

-- Check DIMN_20210430.LogsForProcDebug is created then if yes then drop it for further logic
IF OBJECT_ID(N'DIMN_20210430.LogsForProcDebug') IS NOT NULL
    BEGIN
		DROP TABLE DIMN_20210430.LogsForProcDebug
	END
	
=======
/*DBTYPE:SQLSERVER|TARGETDB:HPFSIDS*/

-- Check DIMN_20210430.LogsForProcDebug is created then if yes then drop it for further logic
IF OBJECT_ID(N'DIMN_20210430.LogsForProcDebug') IS NOT NULL
    BEGIN
		DROP TABLE DIMN_20210430.LogsForProcDebug
	END
	
>>>>>>> 3344ef01528bbbf95981394f0b446a0908cb245c
=======
/*DBTYPE:SQLSERVER|TARGETDB:HPFSIDS*/

-- Check DIMN_20210430.LogsForProcDebug is created then if yes then drop it for further logic
IF OBJECT_ID(N'DIMN_20210430.LogsForProcDebug') IS NOT NULL
    BEGIN
		DROP TABLE DIMN_20210430.LogsForProcDebug
	END
	
>>>>>>> 673d74f274a00a7aa135df1f937d8666bae03d07
GO
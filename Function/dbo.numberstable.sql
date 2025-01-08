<<<<<<< HEAD
<<<<<<< HEAD
/*DBTYPE:SQLSERVER|TARGETDB:HPFSIDS*/

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE SPECIFIC_SCHEMA = '[dbo]' AND SPECIFIC_NAME = '[NumbersTable]' AND ROUTINE_TYPE = 'FUNCTION')
BEGIN
    DROP FUNCTION [dbo].[NumbersTable]
END
GO
CREATE FUNCTION [dbo].[NumbersTable]   
(  
@fromNumber int,  
@toNumber int,  
@byStep int  
)   
/*  
 Object Name  : [dbo].[NumbersTable]  
 Object Type  : Function  
 Purpose   : Returns a sequence of numbers between two numbers that you can pass these boundary values as parameters  
 Parameters  : From number, To number and Step  
 Exec Step  : Q  
       SELECT * FROM [dbo].[NumbersTable](1,quantity,1)  
            <-: Version Log :->  
*============================================================================================================================*  
* [Version #]  [Modified By]  [Modified Date]  [Purpose]               *  
* -----------  -------------  ---------------  ---------               *  
* v1.0    ---     ---     Initial version              *  
* v1.1    Mahesh Mohite  08/09/2022   Changes related to CustomerAssetAPI - Datahub briding development *  
* v1.2   Automation  08/01/2025   Automation *                                 *  
*=========================================================================================================================== *  
*/   
RETURNS TABLE  
RETURN (  
 WITH CTE_NumbersTable AS (  
  SELECT @fromNumber AS i  
  UNION ALL  
  SELECT i + @byStep  
  FROM CTE_NumbersTable  
  WHERE  
  (i + @byStep) <= @toNumber  
 )  
 SELECT *   
 FROM CTE_NumbersTable  
   
)  

GO
GRANT EXECUTE ON [dbo].[NumbersTable] TO DMUsr01;
GO
=======
/*DBTYPE:SQLSERVER|TARGETDB:HPFSIDS*/

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE SPECIFIC_SCHEMA = '[dbo]' AND SPECIFIC_NAME = '[NumbersTable]' AND ROUTINE_TYPE = 'FUNCTION')
BEGIN
    DROP FUNCTION [dbo].[NumbersTable]
END
GO
CREATE FUNCTION [dbo].[NumbersTable]   
(  
@fromNumber int,  
@toNumber int,  
@byStep int  
)   
/*  
 Object Name  : [dbo].[NumbersTable]  
 Object Type  : Function  
 Purpose   : Returns a sequence of numbers between two numbers that you can pass these boundary values as parameters  
 Parameters  : From number, To number and Step  
 Exec Step  : Q  
       SELECT * FROM [dbo].[NumbersTable](1,quantity,1)  
            <-: Version Log :->  
*============================================================================================================================*  
* [Version #]  [Modified By]  [Modified Date]  [Purpose]               *  
* -----------  -------------  ---------------  ---------               *  
* v1.0    ---     ---     Initial version              *  
* v1.1    Mahesh Mohite  08/09/2022   Changes related to CustomerAssetAPI - Datahub briding development *  
* v1.2    Manish  09/01/2025                                *  
*=========================================================================================================================== *  
*/   
RETURNS TABLE  
RETURN (  
 WITH CTE_NumbersTable AS (  
  SELECT @fromNumber AS i  
  UNION ALL  
  SELECT i + @byStep  
  FROM CTE_NumbersTable  
  WHERE  
  (i + @byStep) <= @toNumber  
 )  
 SELECT *   
 FROM CTE_NumbersTable  
   
)  

GO
GRANT EXECUTE ON [dbo].[NumbersTable] TO DMUsr01;
GO
>>>>>>> 3344ef01528bbbf95981394f0b446a0908cb245c
=======
/*DBTYPE:SQLSERVER|TARGETDB:HPFSIDS*/

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE SPECIFIC_SCHEMA = '[dbo]' AND SPECIFIC_NAME = '[NumbersTable]' AND ROUTINE_TYPE = 'FUNCTION')
BEGIN
    DROP FUNCTION [dbo].[NumbersTable]
END
GO
CREATE FUNCTION [dbo].[NumbersTable]   
(  
@fromNumber int,  
@toNumber int,  
@byStep int  
)   
/*  
 Object Name  : [dbo].[NumbersTable]  
 Object Type  : Function  
 Purpose   : Returns a sequence of numbers between two numbers that you can pass these boundary values as parameters  
 Parameters  : From number, To number and Step  
 Exec Step  : Q  
       SELECT * FROM [dbo].[NumbersTable](1,quantity,1)  
            <-: Version Log :->  
*============================================================================================================================*  
* [Version #]  [Modified By]  [Modified Date]  [Purpose]               *  
* -----------  -------------  ---------------  ---------               *  
* v1.0    ---     ---     Initial version              *  
* v1.1    Mahesh Mohite  08/09/2022   Changes related to CustomerAssetAPI - Datahub briding development *  
*                                *  
*=========================================================================================================================== *  
*/   
RETURNS TABLE  
RETURN (  
 WITH CTE_NumbersTable AS (  
  SELECT @fromNumber AS i  
  UNION ALL  
  SELECT i + @byStep  
  FROM CTE_NumbersTable  
  WHERE  
  (i + @byStep) <= @toNumber  
 )  
 SELECT *   
 FROM CTE_NumbersTable  
   
)  

GO
GRANT EXECUTE ON [dbo].[NumbersTable] TO DMUsr01;
GO
>>>>>>> 673d74f274a00a7aa135df1f937d8666bae03d07

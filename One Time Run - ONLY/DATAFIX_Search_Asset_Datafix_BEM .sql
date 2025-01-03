/*DBTYPE:SQLSERVER|TARGETDB:HPFSIDS*/
/****** Object:  Synonym [DIMN].[PP_Search_Asset_01_BEM]    Script Date: 5/10/2022 5:37:17 PM ******/
IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = N'PP_Search_Asset_01_BEM' AND schema_id = SCHEMA_ID(N'DIMN'))
begin
drop SYNONYM [DIMN].[PP_Search_Asset_01_BEM]
end
CREATE SYNONYM [DIMN].[PP_Search_Asset_01_BEM] FOR [DIMN_20210430].[PP_Search_Asset_01_BEM]
GO
GRANT EXECUTE ON [DIMN].[PP_Search_Asset_01_BEM] TO DMUsr01
go

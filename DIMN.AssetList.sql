
CREATE TYPE [dbo].[TestType] AS TABLE(
	[TestColumn] [nvarchar](10)
	)
go


CREATE TYPE [DIMN].[AssetList] AS TABLE(
	[AssetKey] [int] NOT NULL,
	PRIMARY KEY CLUSTERED 
(
	[AssetKey] ASC
)WITH (IGNORE_DUP_KEY = OFF)
)
end






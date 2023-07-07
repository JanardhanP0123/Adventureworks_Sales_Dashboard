--cleansing dimproduct table --
--COLUMN NAMES CHANGED--
--SUBCATEGORY AND CATEGORY TABLES ARE JOINED--
SELECT 
       PR.[ProductKey]
      ,PR.[ProductAlternateKey] AS [Product Item Code]
      --,[ProductSubcategoryKey]
      --,[WeightUnitMeasureCode]
      --,[SizeUnitMeasureCode]
      ,PR.[EnglishProductName] AS [Product Name],
	   PS.EnglishProductSubcategoryName AS [Product Sub category],  --COLUMN FROM SUBCATEGORY TABLE, NULL VALUES IN SUBCATEGORY, DONT KNOW HOW TO GROUP TO WHICH SUB CATEGORY, SO NULL LEFT AS IS, NEED TO GET CLARITY FROM BUSINESS--
	   ISNULL(PC.EnglishProductCategoryName, 'Components' ) AS [Product Category]   --COLUMN FROM CATEGORY TABLE, NULL VALUES IN PRODUCT CATEGORY CHANGED TO COMPONENTS--   
      --,[SpanishProductName]
      --,[FrenchProductName]
      --,[StandardCost]
      --,[FinishedGoodsFlag]
      ,PR.[Color] AS [Product Colour]
      --,[SafetyStockLevel]
      --,[ReorderPoint]
      --,[ListPrice]
      ,PR.[Size] AS [Product Size]
      --,[SizeRange]
      --,[Weight]
      --,[DaysToManufacture]
      ,PR.[ProductLine] AS [Product Line]
      --,[DealerPrice]
      --,[Class]
      --,[Style]
      ,PR.[ModelName] AS [Product Model name]
      --,[LargePhoto]
      ,PR.[EnglishDescription] AS [Product Decription]
      --,[FrenchDescription]
      --,[ChineseDescription]
      --,[ArabicDescription]
      --,[HebrewDescription]
      --,[ThaiDescription]
      --,[GermanDescription]
      --,[JapaneseDescription]
      --,[TurkishDescription]
      --,[StartDate]
      --,[EndDate]
      ,ISNULL(PR.STATUS,'Unknown') AS [Product Status]     --NULL ENTRIES ARE CHANGED TO UNKNOWN--

  FROM [AdventureWorksDW2022].[dbo].[DimProduct] AS PR
  LEFT JOIN [dbo].[DimProductSubcategory] AS PS ON PS.ProductSubcategoryKey = PR.ProductSubcategoryKey
  LEFT JOIN [dbo].[DimProductCategory] AS PC ON PC.ProductCategoryKey = PS.ProductCategoryKey
  ORDER BY PR.ProductKey ASC

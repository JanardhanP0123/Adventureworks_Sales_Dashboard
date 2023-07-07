--- Cleansed customer table---
--Added full name--
--Case statement for Gender--
--Left joined customer and geography tables on column geography key--
--ordered by customer key --

SELECT 
         CUSTOMER.CustomerKey AS [CustomerKey]
      --,[GeographyKey]
      --,[CustomerAlternateKey]
      --,[Title]
      ,CUSTOMER.FirstName AS  [FirstName]
      --,[MiddleName]
      ,CUSTOMER.LastName AS [LastName]
	  ,CUSTOMER.FirstName + ' ' + CUSTOMER.LastName AS [FullName]
     -- ,[NameStyle]
      --,[BirthDate]
      --,[MaritalStatus]
     -- ,[Suffix]
      , CASE CUSTOMER.Gender WHEN 'M' THEN 'Male' WHEN 'F' THEN 'Female' END AS [Gender]
      --,[EmailAddress]
      --,[YearlyIncome]
      --,[TotalChildren]
     -- ,[NumberChildrenAtHome]
      --,[EnglishEducation]
      --,[SpanishEducation]
      --,[FrenchEducation]
      --,[EnglishOccupation]
     -- ,[SpanishOccupation]
      --,[FrenchOccupation]
      --,[HouseOwnerFlag]
      --,[NumberCarsOwned]
     -- ,[AddressLine1]
      --,[AddressLine2]
      --,[Phone]
      , CUSTOMER.DateFirstPurchase AS [DateFirstPurchase]
     -- ,[CommuteDistance]
	 , GEOGRAPHY.City AS [CustomerCity]

  FROM [AdventureWorksDW2022].[dbo].[DimCustomer] AS CUSTOMER
  LEFT JOIN [AdventureWorksDW2022].[dbo].[DimGeography] AS GEOGRAPHY ON GEOGRAPHY.GeographyKey = CUSTOMER.GeographyKey
  ORDER BY CustomerKey ASC

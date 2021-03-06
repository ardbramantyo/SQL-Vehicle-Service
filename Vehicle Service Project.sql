USE [DSTraining]
GO
/****** Object:  StoredProcedure [dbo].[BLD_WRK_VehicleService]    Script Date: 5/14/2022 12:29:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [dbo].[BLD_WRK_VehicleService]
-- =============================================
-- Author:		Ardian Kris Bramantyo
-- Create date: 20220507
-- Description:	RAW -> WRK
-- MOD DATE:
-- =============================================



AS
BEGIN

-- =============================================
-- DROP TABLE
-- =============================================
IF OBJECT_ID('WRK_VehicleService') IS NOT NULL
DROP TABLE[WRK_VehicleService]

-- =============================================
-- CREATE TABLE BLOCK
-- =============================================

CREATE TABLE [WRK_VehicleService]
(
	  [RowNumber]		INT IDENTITY(1,1)
	  ,[CustomerID]		VARCHAR(100)
      ,[CustomerSince]	DATE
      ,[Vehicle]		VARCHAR(100)
      ,[2014]			FLOAT
      ,[2015]			FLOAT
      ,[2016E]			FLOAT

)

-- =============================================
-- TRUNCATE TABLE
-- =============================================

TRUNCATE TABLE [WRK_VehicleService]


-- =============================================
-- INSERT INTO
-- =============================================

INSERT INTO [WRK_VehicleService]
(
	   [CustomerID]
      ,[CustomerSince]
      ,[Vehicle]
      ,[2014]
      ,[2015]
      ,[2016E]
	  )

SELECT
	  [CustomerID]
      ,[CustomerSince]
      ,[Vehicle]
      ,[2014]
      ,[2015]
      ,[2016E]
FROM [RAW_VehicleService_20220507]
 
--EXCLUSIONS 
 WHERE isnumeric([2015]) = 1 --opposite from QA check
  OR [2015] = ''
-- (1049998 rows affected)

/*
EXCLUDED ROW:
  SELECT *
  FROM [DSTraining].[dbo].[RAW_VehicleService_20220507]
  WHERE isnumeric([2015])=0
  and [2015] <> ''
*/


--ADDITIONAL CHECKS
/*
SELECT [CustomerID], count(*)
FROM [WRK_VehicleService]
GROUP BY [CustomerID]
HAVING COUNT(*) > 1 --CustomerID: 3490750

SELECT *
FROM [WRK_VehicleService]
WHERE[CustomerID] like '3490750'
   CustomerID
-- 955904	   3490750	2006-05-17	2007 Tata Sumo	        349.88	340.62	517.2
-- 955905	   3490750	2006-01-22	2004 Volkswagen Touran	735.77	741.23	314.09

SELECT *
FROM [WRK_VehicleService]
WHERE [CustomerSince] < '1965-01-01'

--Check for maximum value
SELECT MAX([2014])
FROM [WRK_VehicleService] --MAX IS 20000 and is not correct according to all value compared with this value

SELECT AVG([2014])
FROM [WRK_VehicleService]

SELECT *
FROM [WRK_VehicleService]
WHERE[2014] > 800 --800 because average is 800 in 2014

--Check SUM
SELECT SUM([2016E])
FROM [WRK_VehicleService]

*/


END

/*

SELECT *
FROM [WRK_VehicleService]

SELECT *
FROM [dbo].[RAW_VehicleService_20220507]

*/
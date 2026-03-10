CREATE DATABASE Superstore_DB;
--The CREATE DATABASE function was used to create a new database called Superstore_DB, which provides a structured space to store and manage all the related data for the superstore.


USE Superstore_DB
GO;
SELECT *
INTO dbo.superstore
FROM master.dbo.Book1;

SELECT TOP 20 *
FROM dbo.superstore;
--The SELECT TOP 20 * statement was used to retrieve the first 20 records from a table, allowing us to confirm that the data was correctly stored in the database.

SELECT *
FROM dbo.superstore
WHERE [Row ID] IS NULL
OR [Order ID] IS NULL
OR [Order Date] IS NULL
OR [Order Priority] is NULL
OR [Order Quantity] IS NULL
OR Sales IS NULL
OR Discount IS NULL
OR [Ship Mode] IS NULL
OR Profit IS NULL
OR [Unit Price] IS NULL
OR [Shipping Cost] IS NULL
OR [Customer Name] IS NULL
OR Province IS NULL
OR Region IS NULL
OR [Customer Segment] IS NULL
OR [Product Category] IS NULL
OR [Product Sub-Category] IS NULL
OR [Product Name] IS NULL
OR [Product Container] IS NULL
OR [Product Base Margin] IS NULL
OR [Ship Date] IS NULL
OR [Return Status] IS NULL
OR Customer_Name IS NULL
OR Manager IS NULL;
-- The select * from Superstore where columu was used to check for missing value and none was found.

SELECT [Row ID], COUNT(*) AS Duplicate
FROM dbo.superstore
GROUP BY [Row ID]
HAVING COUNT(*) > 1;
-- I check for duplicate using the Row ID which is a primary key and no dupliate was found, which mean the data set is consistent

--CHALLENGE FACED WHEN IMPORTING MY DATASET
--1 The file was saved as xlsx which made it difficut untill i change it to csv
--2 Data type - I ensured the text encoding matched the database’s code page to avoid unsupported characters.
--3 Truncation errors - I increased the size of the target columns (from varchar(50) to varchar(500)) to accommodate longer text.
--4 locale issues - Adjusted the import wizard settings to handle regional formats correctly

-- 4 syntax i used
1 CREATE DATABASE Superstore_DB;

2 USE Superstore_DB;

3 SELECT TOP 20 *
FROM dbo.superstore;

4 SELECT *
FROM dbo.superstore
WHERE [Row ID] IS NULL
   OR [Order ID] IS NULL
   OR ...




-- QUESTION 1 List all suppliers in the UK
SELECT *
FROM Supplier
WHERE Country = 'UK';

-- Optimization Note:
-- Only suppliers from the UK are retrieved. Filtering is done on the Country column, which can be indexed for efficiency.
-- Used an an equlity filter (WHERE Country = 'Uk') to narrow the search for the country                     .

-- Insight Note:
-- Helps identify and manage suppliers based in the UK market.  


-- QUESTION 2 List the first name, last name, and city for all customers. Concatenate the first and last name separated by a space and a comma as a single column
SELECT FirstName + ',' + LastName  AS FullName, City
FROM Customer; 

-- Optimization Note:
-- Concatenation was used (FirstName + ',' + LastName) to create a readable  fullname
-- The aliase fullname made the output more descriptive

-- Insight Note:
-- Provides customer identity and location for personalized engagement.  


-- QUESTION 3 List all customers in Sweden
SELECT *
FROM Customer
WHERE Country = 'Sweden'; 

-- Optimization Note:
-- SELECT was used to retrieve all columu (full details) from the table.
-- FROM was used to specify where to query

-- Insight Note:
-- Focuses on customers in Sweden for country-specific marketing.  


-- QUESTION 4 List all suppliers in alphabetical order
SELECT CompanyName
FROM Supplier
ORDER BY CompanyName ASC;

-- Optimization Note:
-- Retrieved only companyname to streamlined the search and avoild unnecessary retrieval of select *
-- The companyname was order in ascending to make supplier appear in alphabetical order which make the output more readable

-- Insight Note:
-- Alphabetical supplier list makes vendor management easier.  


-- QUESTION 5 List all suppliers with their products
SELECT s.CompanyName, p.ProductName
FROM Supplier s
INNER JOIN Product p
ON s.Id = p.SupplierId;

-- Optimization Note:
-- Only the required columns (CompanyName and ProductName) were selected to avoid unnecessary data retrieval.
-- Table aliases (s, p) were used to simplify query readability.
-- INNER JOIN ensures only suppliers with related products are returned, reducing irrelevant rows.

-- Insight Note:
-- Links suppliers to their products for supply chain tracking.  


--QUESTION 6 List all orders with customers information
SELECT c.FirstName + ',' + c.LastName AS FullName,
       c.City, 
       c.Country, 
       c.Phone, 
       o.OrderDate, 
       o.OrderNumber,
       o.TotalAmount
FROM [Order] o
INNER JOIN Customer c
ON c.Id = o.CustomerId;

-- Optimization Note:
-- Used concatenation to combine first and last name into one field, simplifying output.
-- INNER JOIN ensures each order is linked to its correct customer.

-- Insight Note:
-- Combines order and customer info for better customer service.  


--QUESTION 7 List all orders with product name, quantity, and price, sorted by order number
SELECT o.OrderNumber,
       p.ProductName,
       od.Quantity,
       od.UnitPrice
FROM [Order] o
INNER JOIN OrderItem od
ON od.OrderId = o.Id
INNER JOIN Product p
ON od.ProductId = p.Id
ORDER BY OrderNumber ASC;

-- Optimization Note:
-- Multiple INNER JOINs connect orders, order items, and products effectively.
-- ORDER BY ensures results are organized by OrderNumber for easy tracking.

-- Insight Note:
-- Shows what products are sold, in what quantity, and at what price per order.  

--QUESTION 8 Using a case statement, list all the availability of products. When 0 then not available, else available
SELECT 
    p.ProductName,
    od.Quantity,
CASE 
WHEN Quantity = 0 THEN 'Not Available'
                  ELSE 'Available'
    END AS Availability
FROM OrderItem od
INNER JOIN Product p
ON od.ProductId = P.Id;

-- Optimization Note:
-- CASE statement categorizes product availability without requiring extra queries.
-- Selected only relevant columns (ProductName, Quantity).

-- Insight Note:
-- Tracks product availability to manage inventory effectively.  


--QUESTION 9 Using case statement, list all the suppliers and the language they speak. The language they speak should be their country. E.g., if UK, then English
-- QUESTION 9: List the name of each country and the corresponding language spoken
SELECT DISTINCT Country,
    CASE 
        WHEN Country = 'UK' THEN 'English'
        WHEN Country = 'USA' THEN 'English'
        WHEN Country = 'Germany' THEN 'German'
        WHEN Country = 'France' THEN 'French'
        WHEN Country = 'Sweden' THEN 'Swedish'
        WHEN Country = 'Italy' THEN 'Italian'
        WHEN Country = 'Spain' THEN 'Spanish'
        ELSE 'Other'
    END AS Language
FROM Customer;

-- Optimization Note: 
-- Used DISTINCT to remove duplicates  
-- CASE for dynamic mapping instead of hardcoding multiple queries.-- Insight Note: Helps identify the primary language of customers for better communication and targeted marketing.
-- Reduced redundancy by avoiding extra filtering or multiple queries

-- Insight Note:
-- This helps identify the primary language of customers for better communication and targeted marketing.


--QUESTION 10 List all products that are packaged in Jars
SELECT *
FROM Product
WHERE Package = 'Jars';
SELECT DISTINCT Package
FROM Product;

-- Optimization Note:
-- SELECT * was used first, but DISTINCT Package was run separately to confirm available package types.
-- This approach prevents wasted checks if 'Jars' does not exist in the dataset.

-- Insight Note:
-- Identifies products packaged in jars for packaging-based promotions.


--QUESTION 11 List products name, unit price and packages for products that starts with Ca
SELECT ProductName, UnitPrice, Package
FROM Product
WHERE ProductName LIKE 'Ca%';

-- Optimization Note:
-- Only necessary columns (ProductName, UnitPrice, Package) were retrieved.
-- LIKE operator with 'Ca%' optimizes search to products starting with 'Ca', avoiding full table scan.

-- Insight Note:
-- Filters products starting with 'Ca' for faster catalog lookup.  


--QUESTION 12 List the number of products for each supplier, sorted high to low
SELECT s.CompanyName, COUNT(p.Id) AS NumberOfProducts
FROM Supplier s
INNER JOIN Product p
ON s.Id = p.SupplierId
GROUP BY s.CompanyName
ORDER BY NumberOfProducts DESC;

-- Optimization Note:
-- Used COUNT(p.Id) instead of COUNT(*) for accuracy in counting products per supplier.
-- GROUP BY ensures grouping at supplier level.
-- ORDER BY DESC optimizes readability by listing suppliers with the most products first.

-- Insight Note:
-- Shows which suppliers contribute the most products.  


--QUESTION 13 List the number of customers in each country
SELECT c.Country,COUNT(c.Id) AS NumberOfCustomer
FROM Customer c
GROUP BY c.Country
ORDER BY NumberOfCustomer;

-- Optimization Note:
-- COUNT(c.Id) instead of COUNT(*) ensures rows are counted based on primary key.
-- GROUP BY aggregates customers per country efficiently.
-- ORDER BY organizes results for analysis.

-- Insight Note:
-- To reveals customer distribution by country for market presence.  


--QUESTION 14 List the number of customers in each country, sorted high to low
SELECT  c.Country,COUNT(c.Id) AS NumberOfCustomer
FROM Customer c
GROUP BY c.Country
ORDER BY NumberOfCustomer DESC;

-- Optimization Note:
-- Same as Q13, but sorted in descending order for high-to-low customer distribution.
-- Ensures most significant countries appear first for better insight.

-- Insight Note:
-- Highlights top countries by customer count for expansion focus.  


--QUESTION 15 List the total order amount for each customer, sorted high to low
SELECT FirstName + ' ' + LastName AS FullName, 
       SUM(o.TotalAmount) AS TotalOrderAmount
FROM Customer c
INNER JOIN [Order] o
ON c.Id = o.CustomerId
GROUP BY c.FirstName, c.LastName
ORDER BY TotalOrderAmount DESC;

-- Optimization Note:
-- SUM aggregates order totals per customer, giving concise financial summary.
-- GROUP BY on first and last name ensures unique grouping of customers.
-- ORDER BY DESC highlights highest-spending customers first.

-- Insight Note:
-- This identifies top spending customers for loyalty programs.  


--QUESTION 16 List all countries with more than 2 suppliers
SELECT 
    Country, 
    COUNT(*) AS NumberOfSuppliers
FROM Supplier
GROUP BY Country
HAVING COUNT(*) > 2;

-- Optimization Note:
-- COUNT(*) groups suppliers by country efficiently.
-- HAVING clause filters only countries with more than 2 suppliers, reducing unnecessary results.

-- Insight Note:
-- To finds countries with strong supplier bases for sourcing.  


-- QUESTION 17 List the number of customers in each country. Only include countries with more than 10 customers
SELECT Country, 
       COUNT(*) AS NumberOfCustomers
FROM Customer
GROUP BY Country
HAVING COUNT(*) > 10;

-- Optimization Note:
-- COUNT(*) aggregates customers per country.
-- HAVING > 10 ensures only countries with significant customer bases are included.
-- This reduces clutter in the result set.

-- Insight Note:
-- This will highlights countries with large customer bases for growth opportunities.  


-- QUESTION 18 List the number of customers in each country, except the USA, sorted high to low. Only include countries with 9 or more customers
SELECT 
    Country, 
    COUNT(*) AS NumberOfCustomers
FROM Customer
WHERE Country <> 'USA'
GROUP BY Country
HAVING COUNT(*) >= 9
ORDER BY NumberOfCustomers DESC;

-- Optimization Note:
-- WHERE excludes USA early to reduce scanned rows.
-- GROUP BY and HAVING work together to filter countries with at least 9 customers.
-- ORDER BY DESC ensures results are ranked for better comparison.

-- Insight Note:
-- This excludes USA to focus on other strong international markets.  


-- QUESTION 19 List customer with average orders between $1000 and $1200
SELECT 
    c.FirstName + ' ' + c.LastName AS FullName,
    AVG(o.TotalAmount) AS AverageOrder
FROM Customer c
INNER JOIN [Order] o
    ON c.Id = o.CustomerId
GROUP BY c.FirstName, c.LastName
HAVING AVG(o.TotalAmount) BETWEEN 1000 AND 1200;

-- Optimization Note:
-- AVG calculates mean order amounts efficiently within the grouped dataset.
-- HAVING filters directly on aggregated values, avoiding unnecessary rows.
-- Only customers with average order size between 1000 and 1200 are returned.

-- Insight Note:
-- It identifies customers with mid-range average spending patterns.  


--QUESTION 20 Get the number of orders and total amount sold between Jan 1, 2013 and Jan 31, 2013
SELECT 
    COUNT(*) AS NumberOfOrders,
    SUM(TotalAmount) AS TotalSold
FROM [Order]
WHERE OrderDate BETWEEN '2013-01-01' AND '2013-01-31';

-- Optimization Note:
-- COUNT(*) gives total orders, while SUM aggregates sales for accuracy.
-- WHERE with a date range limits scanned rows to January 2013, improving performance.

-- Insight Note:
-- This measures January 2013 sales performance and volume.  







       

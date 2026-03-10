# Superstore-Database-Analysis
SQL analysis of a superstore relational database using 20 T-SQL queries covering JOINs, aggregations, CASE statements, and filtering to extract customer, supplier, product, and sales insights.

## Overview
This project demonstrates SQL proficiency through 20 structured analytical queries written in T-SQL against a relational superstore database. The analysis covers customers, suppliers, products, and orders — with every query linked to a real business use case and written with performance optimisation in mind.

## Tools & Technologies
- Microsoft SQL Server — Database creation, import, and querying
- T-SQL — Query language used throughout

---

## Database Structure

| Table | Contents |
|-------|----------|
| `Customer` | Customer details — name, city, country, phone |
| `Supplier` | Supplier details — company name, country |
| `Product` | Product details — name, unit price, package |
| `Order` | Order header — number, date, total amount |
| `OrderItem` | Line items — product, quantity, unit price |


## SQL Techniques Demonstrated
`SELECT` · `WHERE` · `ORDER BY` · `INNER JOIN` · `GROUP BY` · `HAVING` · `COUNT / SUM / AVG` · `CASE` · `LIKE` · `DISTINCT` · Concatenation

## Key Business Insights

### Customers
- USA holds the largest customer base — primary market for sales and marketing
- Countries with 9+ customers represent strong international diversification opportunities
- Customers averaging **$1,000–$1,200** per order are a high-potential upsell segment

### Suppliers
- Countries with **2+ suppliers** offer stronger and more competitive sourcing options
- Linking suppliers to products provides full supply chain visibility

### Products
- CASE-based availability categorisation provides a scalable inventory monitoring approach
- Pattern-matching queries enable fast catalog lookups for marketing and pricing reviews

### Orders & Sales
- Top-spending customers identified via total order amounts — valuable for loyalty programme design
- January 2013 data serves as a seasonal performance benchmark

## Challenges & Solutions

| Challenge | Solution |
|-----------|----------|
| File saved as .xlsx — import failed | Converted to .csv before importing |
| Data type mismatches | Matched text encoding to database code page |
| Column truncation errors | Increased column sizes from varchar(50) to varchar(500) |
| Regional/locale format issues | Adjusted import wizard settings |

## Files in This Repository

| File | Description |
|------|-------------|
| `SQL_Capstone_Queries.sql` | All 20 analytical queries with optimisation and insight notes |
| `Database_Setup_and_Cleaning.sql` | Database creation, import, NULL and duplicate checks |
| `SQL_Analysis_Report.docx` | Full structured report with insights and methodology |

## Author
**Odunola Eunice Adams**

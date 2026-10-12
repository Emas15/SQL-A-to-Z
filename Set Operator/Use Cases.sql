-- USE cases for SET operators: --> how we will use SET operators in projects for data analysis or DE

--1️⃣ UNION use Case:

-- Combine similar information before analyzing the data
/*
    📌 Practical Use Case: Why Use SET Operators (UNION, UNION ALL, etc.)

    • Scenario:
      Often we have multiple tables with similar structure (e.g., Customers, Employees).
      If we run separate queries on each table, SQL will give us two separate outputs.
      To "combine later," we’d have to manually stitch those outputs together
      (outside SQL or with extra queries) — which is extra work.

    • How SET operators help:
      - UNION / UNION ALL let SQL itself merge the results into ONE unified output table.
      - This avoids manual combining and makes analysis much simpler.
      - Once merged, we can run a single query on the combined dataset
        to generate reports or perform analytics.

    • Key difference:
      - UNION → keeps only DISTINCT rows (removes duplicates).
      - UNION ALL → keeps ALL rows (including duplicates).

    ✅ Example:
    SELECT CustomerID AS ID, LastName
    FROM Sales.Customers
    UNION
    SELECT EmployeeID, LastName
    FROM Sales.Employees;

    -- Result: One clean table with all distinct IDs and LastNames
    -- from both Customers and Employees, ready for analysis/reporting.
*/

-------------------------------------------------------------------------------------------

/*
    📌 Use Case: Combining Multiple Person Tables

    • Scenario:
      Suppose we have 4 tables: Employees, Customers, Suppliers, and Students.
      Each table stores information about people in the organization. and we want to see the report of their name....

    • Problem:
      If we write separate queries for each table to present a analysis report, we end up with 4 outputs.
      - More queries → more complexity.
      - Risk of inconsistency → if we change logic in one query but forget
        to update the others, reports become unreliable.

    • Solution with SET Operators:
      Use UNION (or UNION ALL) to merge all 4 tables into one unified table (e.g., Persons).
      - All rows from Employees, Customers, Suppliers, and Students are stacked together.
      - Now we have ONE big dataset containing all individuals.

    • How it helps:
      - Only one analysis query is needed on the combined table.
      - ‼️ If Any logic changes we can just remodify one single query and it will apply automatically to all data.
      - Reports stay consistent and easier to maintain.

    ✅ Example:
    SELECT EmployeeID AS ID, Name FROM Employees
    UNION
    SELECT CustomerID, Name FROM Customers
    UNION
    SELECT SupplierID, Name FROM Suppliers
    UNION
    SELECT StudentID, Name FROM Students;

    -- Result: One unified table "Persons" with all distinct individuals
    -- from Employees, Customers, Suppliers, and Students.
*/


---------------------------------------------------------------------------------------------------------------------------------


/*
    📌 Use Case: Combining Yearly Order Tables

    • Scenario:
      Suppose we have separate tables for orders by year:
      Orders2022, Orders2023, etc.
      Each table holds rows of order data for that year. and we want to see the report of all the orders accress previous year

    • Problem:
      If we want to analyze orders over time (e.g., trends, totals),
      we would need to write one query for each table and then
      merge those outputs before reporting.
      - More queries → harder to maintain.
      - Risk of inconsistency → if logic changes in one query but not the others,
        reports become unreliable.

    • Solution with SET Operators:
      Use UNION (or UNION ALL) to stack all yearly tables into one big table
      called Orders. This creates a central dataset with all rows combined.

    • How it helps:
      - Only ONE analysis/reporting query is needed on the combined Orders table.
      - Any logic changes apply automatically to all years.
      - Reports are consistent, cleaner, and easier to maintain.

    ✅ Example:
    SELECT OrderID, OrderDate, Amount FROM Orders2022
    UNION
    SELECT OrderID, OrderDate, Amount FROM Orders2023
    UNION
    SELECT OrderID, OrderDate, Amount FROM Orders2024;

    -- Result: One unified "Orders" dataset with all distinct rows
    -- across years, ready for analysis and reporting.
*/

----------------------------------------------------------------------------------------------------


-- 🤔🤔🤔 Task : Orders are stored in two separate tables ( Orders and OrdersArchive).
               -- Combine all the orders into one reporer without duplicates:


-- ✅Solution:
SELECT
       'Orders' AS SourceTable, --> 😉😉😉😉Explanation given below
       [OrderID] --> right click on the table and click on "select top 1000 rows" to access the column names
      ,[ProductID]
      ,[CustomerID]
      ,[SalesPersonID]
      ,[OrderDate]
      ,[ShipDate]
      ,[OrderStatus]
      ,[ShipAddress]
      ,[BillAddress]
      ,[Quantity]
      ,[Sales]
FROM Sales.Orders

UNION

SELECT 
       'OrdersArchive' AS SourceTable,
       [OrderID]
      ,[ProductID]
      ,[CustomerID]
      ,[SalesPersonID]
      ,[OrderDate]
      ,[ShipDate]
      ,[OrderStatus]
      ,[ShipAddress]
      ,[BillAddress]
      ,[Quantity]
      ,[Sales]
FROM Sales.OrdersArchive
ORDER BY OrderID;
--👇⬇️
---😲😲😲😲😲😲😲:
/*
    📌 Best Practice: Avoid SELECT *

    • Problem:
      When combining data from multiple tables (e.g., Orders and OrdersArchive),
      using SELECT * pulls all columns blindly.
      - If table schemas change (columns renamed, added, or reordered),
        the queries may break or produce incorrect results.
      - Example: If one table has ProductID first and another has OrderID first,
        SELECT * will mismatch columns → wrong data in reports.

    • Why not use *:
      - It hides column order differences.
      - Makes debugging harder when schemas evolve.
      - Can lead to incorrect analysis if columns don’t align.

    • How to identify schema changes (when not using *):
      - By explicitly listing columns, you immediately see if one table
        has a different column order, missing column, or renamed column.
      - The query will fail or show mismatched column names clearly,
        instead of silently producing wrong results.

    • Solution:
      Always list columns explicitly in your SELECT.
      - Ensures correct mapping between tables.
      - Makes schema differences visible immediately.
      - Keeps reports consistent and reliable.

    ✅ Example:
    SELECT OrderID, ProductID, CustomerID, OrderDate
    FROM Sales.Orders
    UNION
    SELECT OrderID, ProductID, CustomerID, OrderDate
    FROM Sales.OrdersArchive;

    -- Result: Columns are clearly aligned, safe from schema changes.
*/
------------------------------------------------------------------------------------------------
/*
    📌 Best Practice: Add Source Column When Combining Tables

    • Scenario:
      When combining data from multiple tables (e.g., Orders and OrdersArchive),
      some rows may look identical and similar/duplicate (same OrderID, ProductID, etc.).
      But they are not duplicates, they are distinct — they come from different tables.

    • Problem:
      Without knowing the source, analysts may think rows are duplicates
      and misinterpret the data.

    • Solution:
      Add a static column in each SELECT to indicate the source table.
      - Example: 'Orders' for Sales.Orders
      - Example: 'OrdersArchive' for Sales.OrdersArchive
      This makes it clear where each record comes from.

    • How it helps:
      - Improves clarity in reports.
      - Prevents confusion about duplicates.
      - Gives analysts context about data origin.

    ✅ Example:
    SELECT 'Orders' AS SourceTable, OrderID, ProductID, CustomerID
    FROM Sales.Orders
    UNION
    SELECT 'OrdersArchive' AS SourceTable, OrderID, ProductID, CustomerID
    FROM Sales.OrdersArchive;

    -- Result: One combined dataset with a SourceTable column
    -- showing whether each row came from Orders or OrdersArchive.
*/



--😜Just my experiment:
SELECT 
    ProductID,
    SUM(Quantity) as toal_orders
FROM Sales.Orders
GROUP BY ProductID

UNION

SELECT
    ProductID,
    SUM(Quantity) as toal_orders
FROM Sales.OrdersArchive
GROUP BY ProductID;
    

-------------------------------------------------------------------------------------------------------------




-- 2️⃣ EXCEPT use cases : Delta detection: 💗💗💗💗 My fev part


/*
    📌 Delta Detection with EXCEPT (Data Engineering Use Case)

    • What EXCEPT does:
      - Compares two result sets.
      - Returns rows from the first query that do NOT exist in the second.
      - Think of it as: "Show me what’s new in A compared to B."

    • Scenario:
      Data engineers build pipelines to LOADD data FROMM source systems
      INTOO a data warehouse or a data lake.

      - Day 1: Source has Customers {1, 2}. → Load into warehouse.
      - Day 2: Source has Customers {1, 3}.
        → Customer 1 already exists, Customer 3 is new.
      - Using EXCEPT, we detect only the new record (Customer 3)
        and insert it into the warehouse.

    • What is a Data Warehouse?
      - A structured storage system.
      - Data is cleaned, organized into tables, and optimized for analysis.
      - Used for reporting, dashboards, and business intelligence.

    • What is a Data Lake?
      - A flexible storage system.
      - Holds raw data in any format (CSV, JSON, logs, images, etc.).
      - Used for large-scale storage and advanced analytics/AI.

    • Does data come daily or real-time?
      - Pipelines can be scheduled daily (batch loads).
      - Or they can run in real-time/near real-time (streaming).
      - Depends on business needs: daily reports vs live dashboards.

    • Solution with EXCEPT:
      Use EXCEPT to compare today’s batch with yesterday’s warehouse snapshot.

      ✅ Example:
      SELECT CustomerID FROM SourceDay2 -->😉😉😉Here order matters so we will get the unique data from sourceDay2 which does not match with prev data in WareHourseDay1.
      EXCEPT
      SELECT CustomerID FROM WarehouseDay1;

      -- Result: Only CustomerID = 3 (the new record).

    • Why this matters for Data Engineers:
      - Efficiency: Avoids reloading duplicates.
      - Accuracy: Reports stay consistent with only fresh data.
      - Automation: Pipelines can run daily or real-time.
      - Scalability: Works even with millions of rows.

    • Summary:
      EXCEPT is powerful for delta detection — it finds what’s new in one dataset
      compared to another, ensuring incremental loads in ETL pipelines.
      Data warehouse = structured analytics-ready storage.
      Data lake = raw flexible storage.
      Data can arrive daily (batch) or in real-time (streaming).
*/



--➡️➡️➡️
/*
    📌 Data Lake vs Data Warehouse (in Delta Detection context)

    • Data Lake:
      - Stores raw data in its natural format (CSV, JSON, logs, images, videos).
      - Flexible, cheap, and scalable.
      - Messy by design → no schema required.
      - Great for AI/ML teams who need huge raw datasets.

    • Data Warehouse:
      - Stores cleaned, structured, and organized data in tables.
      - Optimized for fast SQL queries, dashboards, and reporting.
      - Acts as the "single source of truth" for analytics.

    • Data Arrival:
      - Data can come in daily batches (e.g., every night new files land).
      - Or in real-time streams (e.g., click events, IoT sensors).
      - Pipelines decide: batch for reports, streaming for live dashboards.

    • Delta Detection with EXCEPT:
      - Compare today's batch vs yesterday's warehouse snapshot.
      - Find only the new records (the delta).
      - Load those into the warehouse → efficient, accurate, incremental.

    ✅ Example:
    SELECT CustomerID FROM SourceDay2
    EXCEPT
    SELECT CustomerID FROM WarehouseDay1;

    -- Result: Only new customers (e.g., CustomerID = 3).
*/

-------------------------------------------------------------------------------------------------------------




--3️⃣ Another use case of EXCEPT : Data completeness check:

--> EXCEPT operator can be used to compare [tables] to detect discrepancies/Difference between [databases].

---➡️➡️➡️➡️
/*
    📌 Data Migration Completeness Check with EXCEPT (data quality check)

    • Scenario:
      When migrating data[Tables] from Database A to Database B,
      it’s critical to ensure that all records are moved correctly.
      We want to check data completeness — no missing rows, no extra rows.

    • Problem:
      After migration, we must confirm:
      1. All rows from Database A exist in Database B.
      2. No unexpected rows exist in Database B that are not in Database A.
      If either check fails, the migration is incomplete or incorrect.

    • Solution with EXCEPT:
      Run two EXCEPT queries:
      
      1. Find rows in Database A that are missing in Database B:
         SELECT * FROM DatabaseA.Table
         EXCEPT
         SELECT * FROM DatabaseB.Table;
         -- If result is empty → all rows from A are present in B.

      2. Find rows in Database B that don’t exist in Database A:
         SELECT * FROM DatabaseB.Table
         EXCEPT
         SELECT * FROM DatabaseA.Table;
         -- If result is empty → no extra rows in B.

      ✅ If both results are empty → the two tables are identical,
         meaning migration is complete and data quality is ensured.

    • Why this matters for Data Engineers:
      - Ensures data completeness after migration.
      - Detects missing or extra records quickly.
      - Improves trust in the migration process.
      - Scales well even for large datasets.

    • Extra Context:
      - Data Warehouse: structured, cleaned, analytics-ready storage.
      - Data Lake: raw, flexible, sometimes messy storage.
      - Data arrival: can be daily (batch loads) or real-time (streaming).
      - In migrations, completeness checks are usually batch-based.

    • Summary:
      Using EXCEPT in both directions is a simple but powerful way
      to validate data migrations. Empty results = perfect migration.
      Non-empty results = investigate missing or extra records.
*/


---------------------------------------------------------------------------------------------------------------------------


/*
    📌 Summary of SQL Set Operators

    • Purpose:
      Combine rows from multiple queries/tables into one result set.

    • Types:
      1. UNION → Combines rows, removes duplicates.
      2. UNION ALL → Combines rows, keeps duplicates.
      3. EXCEPT → Shows rows from first query not in second (differences).
      4. INTERSECT → Shows rows common to both queries.

    • Rules:
      - Same number of columns in both queries.
      - Matching data types for corresponding columns.
      - Same column order.
      - First query controls column names/aliases.

    • Use Cases:
      - UNION / UNION ALL → Combine similar tables into one dataset.
      - EXCEPT → Delta detection (new data in pipelines), data completeness checks in migrations.
      - INTERSECT → Find common records between datasets.

    ---------------------------------------------------------------
    📌 Difference Between Joins and Set Operators

    • Joins:
      - Combine tables side by side (columns).
      - Match rows based on a key (e.g., CustomerID).
      - Used when you need related data from multiple tables in one row.
      - Example: Customers JOIN Orders → show customer info with their orders.

    • Set Operators:
      - Stack results vertically (rows).
      - No need for a key; just align columns by position.
      - Used when you want to merge or compare entire result sets.
      - Example: UNION Customers + Employees → one list of all people.

    ---------------------------------------------------------------
    📌 When to Use

    • Use Joins:
      - When you need to combine related data across tables.
      - Example: Show orders with customer names.

    • Use Set Operators:
      - When you need to merge or compare datasets with similar structure.
      - Example: Combine archived and current orders, detect new rows, check completeness.

    ✅ In short:
    - Joins → combine columns (relationships).
    - Set Operators → combine rows (datasets).
*/

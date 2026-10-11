-- combining COLUMNS -> JOIN -> side by side cols of differe tables
-- combining ROWS -> SET OPERATORS ->‼️‼️ table B's rows below table A


-- ! We need a key column to join tables
-- ! we need to have same column to use set operator

-- set operators: union, union all, except, intersect


-- ‼️ Rule1:----------------------------------------------------
/*
    📌 SQL Clauses & Set Operators

    • SET operators (UNION, INTERSECT, EXCEPT) can be used with:
        - WHERE
        - JOIN
        - GROUP BY
        - HAVING

    • ORDER BY is allowed only once,
      and it must appear at the very end of the query.
*/

/*
    📌 Example Structure with UNION

    SELECT 
        FirstName, 
        LastName
    FROM Customers
    [JOIN Clause]
    [WHERE Clause]
    [GROUP BY Clause]
    [HAVING clause]

    UNION<--

    SELECT 
        FirstName, 
        LastName
    FROM Employees
    [JOIN Clause]
    [WHERE Clause]
    [GROUP BY Clause]

    ORDER BY FirstName   -- applies only once, after the final result
*/



-- --->🔹 What UNION Does
-- UNION combines the results of two or more SELECT queries into a single output table.

-- It removes duplicates by default (so if the same row appears in both queries, it will only show once).

-- The column names in the final output always come from the first SELECT query.







-----------------------------------------------------------------------------------


--‼️ Rule 2: --------------------------------------------------------------------------
-- Num of cols in each query must be the same

--ex:
SELECT
    FirstName,
    LastName -- 2 cols
FROM Sales.Customers

UNION

SELECT
    FirstName,
    LastName -- 2 cols
FROM Sales.Employees




-----------------------------------------------------------------------------------


-- ‼️ Rule 3 : -----------------------------------------------------------------------------------
--> Data types of cols in each query must be compatible

-- ex:
SELECT
    CustomerID, --> INT
    LastName 
FROM Sales.Customers ------> this is the main table or table A : so the cols are gonna be same as mentioned in this first query of unions, and then only the rows of 2nd col would be added

UNION

SELECT
    EmployeeID, --> INT
    LastName 
FROM Sales.Employees


-----------------------------------------------------------------------------------


-- ‼️ Rule 4 : -----------------------------------------------------------------------------------
--> The order of cols in each query must be same

--ex:❌
SELECT
    LastName, --> varchar
    CustomerID
    
FROM Sales.Customers

UNION

SELECT
    EmployeeID, --> INT --> the order is not maintained
    LastName 
FROM Sales.Employees

--ex:✅
SELECT
    
    CustomerID,
    LastName
    
FROM Sales.Customers

UNION

SELECT
    EmployeeID,
    LastName 
FROM Sales.Employees


--✨ In short:
--Always keep the same number, order, and compatible types of columns in each SELECT when using UNION/INTERSECT/EXCEPT.

-----------------------------------------------------------------------------------


-- ‼️ Rule 5 : -----------------------------------------------------------------------------------
--> the column names in the result set are determined by the column names specified in the first query
-->👉 The column names in the output table (the result set) are taken from the first query in the set operation (like UNION, EXCEPT, etc.), even if later queries use different names or aliases.

--> even in general... sql always shows the column name from the first query in set operations


--ex:
SELECT ----> first query controls column names
    CustomerID AS ID,
    LastName
FROM Sales.Customers

UNION

SELECT
    EmployeeID,
    LastName 
FROM Sales.Employees




-----------------------------------------------------------------------------------


-- ‼️ Rule 6 : -----------------------------------------------------------------------------------
--> correct columns

-- NOTE #6 | CORRECT COLUMNS
-- Even if your SQL query runs without errors, the result can still be wrong
-- if you select the wrong columns. Syntax correctness ≠ logical correctness.
-- Always double-check that the columns you SELECT are the ones you actually need.

-- Example:
-- Suppose you want to list customer names and their orders.
-- If you accidentally select the wrong column (like EmployeeID instead of CustomerID),
-- the query will run fine but give misleading results.

SELECT 
    FirstName,
    LastName
FROM Sales.Customers

UNION

SELECT
     LastName, --> ‼️😲 this will also give result as both are varchar and same num of cols... but the last name from here will show in the [firtName] column as the column name is same as the first query
     FirstName
FROM Sales.Employees




/*
    📌 SQL SET OPERATORS — Quick Rules Summary

    • JOIN → combines COLUMNS (side by side, across tables).
    • SET OPERATORS → combine ROWS (stacked, one table’s rows below another).
    • Key column needed for JOINs.
    • Same column structure needed for SET operators.

    🔹 Supported SET operators:
        - UNION (removes duplicates)
        - UNION ALL (keeps duplicates)
        - EXCEPT (rows in first query not in second)
        - INTERSECT (rows common to both queries)

    ‼️ RULES:
    1. ORDER BY → allowed only once, at the very end of the whole query.
    2. Same number of columns → each SELECT must return equal column count.
    3. Matching data types → corresponding columns must be compatible.
    4. Same column order → first col aligns with first col, second with second, etc.
    5. First query controls aliases → output column names come from the first SELECT.
    6. Correct columns → query may run fine but give wrong results if wrong columns are chosen.
       (Syntax correctness ≠ logical correctness)

    ✨ Example reminder:
    SELECT CustomerID AS ID, LastName
    FROM Sales.Customers
    UNION
    SELECT EmployeeID, LastName
    FROM Sales.Employees;
    -- Output columns = [ID, LastName] from the first query
*/

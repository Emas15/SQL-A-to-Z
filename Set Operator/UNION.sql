-- UNION
/*
    📌 UNION Operator

    • UNION combines results from two SELECT queries.
    • It returns ALL DISTINCT rows from both tables.
    • Duplicate rows (same values across all columns) are automatically removed.
    • Column names in the final output come from the first SELECT query.

    Example:
    SELECT CustomerName FROM Customers
    UNION
    SELECT EmployeeName FROM Employees;

    -- Output: All unique names from both Customers and Employees.
    -- If "Kevin" exists in both tables, it will appear only once.
*/



-- 🤔Task : combine the data from employess and customers into one table


-- first ask yourself, which info do you need... see both tables and determine based on what you can combine them
-- i see the matching columns are ID, first name, last name...


SELECT
    FirstName,
    LastName
FROM Sales.Customers

UNION

SELECT
    FirstName,
    LastName
FROM Sales.Employees; --> ORDER of the tbale does not matter.


/*
    📌 UNION Mechanism (How it works)

    1. SQL takes all rows from the first SELECT query.
       - Any duplicate rows inside this first set are removed.

    2. Then SQL processes rows from the second SELECT query one by one.
       - Each row is compared against the existing result set.

    3. If a row is already present, it is skipped.
       - If it’s new (distinct), it gets added.

    ✅ Final Output: A single result set containing all DISTINCT rows
       from both queries, with column names defined by the first query.
*/

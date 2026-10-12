-- EXCEPT / MINUS

-- returns all the distinct rows from the first query that are not found in the 2nd query

/*
    📌 EXCEPT Operator (How it works)

    • EXCEPT returns all DISTINCT rows from the first query
      that do NOT appear in the second query.

    • Mechanism:
        1. SQL takes each row from the first SELECT result.
        2. It checks whether that row also exists in the second SELECT result.
        3. If the row is found in the second query → it is excluded.
        4. If the row is NOT found → it is kept in the final output.

    ✅ Final Output: Only unique rows from Query 1 that are absent in Query 2.
    
    Example:
    SELECT CustomerName FROM Customers
    EXCEPT
    SELECT CustomerName FROM Employees;

    -- Result: All customer names that are not also employee names.
*/

-- ‼️ Here order of the query will affect the final result... so order matters


-- 🤔task : find the 1.Employees who are not 2.customers at the same time
SELECT
    FirstName,
    LastName
FROM Sales.Employees

EXCEPT

SELECT
    FirstName,
    LastName
FROM Sales.Customers;

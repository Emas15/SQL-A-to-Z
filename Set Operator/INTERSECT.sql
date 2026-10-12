-- INTERSECT

-- Returns ONLY the rows that are common in both queires... something like INNER JOIN

-- 🤔Task : find the 1.employees who are also 2customers: --> in JOIN we could do it with INNER JOIN or others JOINS

--order does not matter here
SELECT
    FirstName,
    LastName
FROM Sales.Employees

INTERSECT

SELECT
    FirstName,
    LastName
FROM Sales.Customers;


/*
    📌 INTERSECT Operator (How it works)

    • INTERSECT returns all DISTINCT rows that appear in BOTH queries.

    • Mechanism:
        1. SQL takes each row from the first SELECT result.
        2. It checks whether that row also exists in the second SELECT result.
        3. If the row is found in both → it is kept.
        4. If the row is missing from either → it is excluded.

    ✅ Final Output: Only unique rows that are common to both Query 1 and Query 2.

    Example:
    SELECT CustomerName FROM Customers
    INTERSECT
    SELECT EmployeeName FROM Employees;

    -- Result: Names that exist in both Customers and Employees tables.
*/


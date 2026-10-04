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
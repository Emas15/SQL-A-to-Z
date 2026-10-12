-- Union All

-- returns all rows from both requires including duplicates.

-- only set operators that does not remove duplicates

SELECT
    FirstName,
    LastName
FROM Sales.Customers

UNION ALL

SELECT
    FirstName,
    LastName
FROM Sales.Employees;


-- benefits  and use cases : UNION ALL is generally faster than UNION.. it does not process additional steps to remove duplicates
                             -- if you are confident that there is no duplicates, use UNION ALL
                             -- Use union ALL to find duplicates and quality issues


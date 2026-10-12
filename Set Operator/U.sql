-- USE cases for SET operators: --> how we will use SET operators in projects for data analysis or DE


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
      Each table stores information about people in the organization.

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





--joining multiple tables
-- i can use LEFT JOIN do almost anything with the help of WHERE
-- ‼️for left join i pick one master/primary table and join others table with it

-- but if every tables are important i use INNER JOIN


-- 📌 Schema Notes
-- Schema = logical container (like a folder) inside a database
-- Default schema = dbo → if not specified, SQL assumes dbo.tableName
-- Custom schema = user-defined (e.g., Sales, HR) → must write schemaName.tableName
--
-- ✅ Why bother with custom schemas?
--   1. Organization → Group tables by department/project (Sales, HR, Finance)
--   2. Permissions → Grant access only to certain schemas (e.g., Sales team can query Sales.* but not HR.*)
--   3. Avoid conflicts → You can have dbo.Customers and Sales.Customers in the same DB without name clashes
--   4. Clarity → Makes it obvious which part of the business the table belongs to
--
-- Example:
--   SELECT * FROM persons;        -- works because it's dbo.persons
--   SELECT * FROM Sales.Orders;   -- must include schema since it's not dbo



/*Task: Using SalesDB, Retrieve a list of all orders, along with the related customer, product, and employee details. For each order, display:
Order ID, Customer's name, Product name, Sales, Price, Sales person's name */





SELECT
	o.OrderID,
	o.Sales,

	c.FirstName AS CustomerFirstName,
	c.LastName AS CustomerLastName,

	p.Product AS ProductName,
	p.Price,

	e.FirstName AS SalesPersonFirstName,
	e.LastName As SalesPersonLastName

FROM Sales.Orders AS o -----➡️👍This is our master table, we have foreign keys in it to connect with other tables... like productID is a FK to connect with product table, customerID is also a FK to connect with customers table... same goes to salesPersonID to connect with Employess table
LEFT JOIN Sales.Customers AS c
ON o.CustomerID = c.CustomerID
LEFT JOIN Sales.Products as p
ON o.ProductID = p.ProductID --- SO here i am comparing the with the master table each time
LEFT JOIN Sales.Employees as e
ON o.SalesPersonID = e.EmployeeID





SELECT
	o.OrderID,

	c.FirstName || ' ' || c.LastName AS customer_name, --- ‼️‼️‼️If customer_name is a computed column or a concatenation of FirstName + LastName, then Mary’s row becomes NULL because concatenating with NULL results in NULL.

	o.Sales

FROM Sales.Orders AS o
LEFT JOIN Sales.Customers AS c
ON o.CustomerID = c.CustomerID







SELECT * FROM Sales.Customers
SELECT * FROM Sales.Employees
SELECT * FROM Sales.Products
SELECT * FROM Sales.OrdersArchive
SELECT * FROM Sales.Orders

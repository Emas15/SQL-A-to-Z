-- DISTINCT
-- -- DISTINCT removes duplicate rows from the query result.

-- don't use this unless it is too necessary cause it can slow down the query, as there might be millions of rows, and it compares every time if there already exists one or not
-- also there could be a cloumn with all the unique value, so using distinct on top of it will slow it down by comparing 

-- DISTINCT can add processing cost because the database
-- has to eliminate duplicate result rows.
-- The actual implementation depends on the database and query plan.

SELECT DISTINCT country
FROM customers;

-- If multiple columns are selected, DISTINCT considers the combination of all selected columns.

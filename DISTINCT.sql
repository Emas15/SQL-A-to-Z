-- DISTINCT
-- it removes repeated values of a specific column

-- don't use this unless it is too necessary cause it can slow down the query, as there might be millions of rows, and it compares every time if there already exists one or not
-- also there could be a cloumn with all the unique value, so using distinct on top of it will slow it down by comparing 


SELECT DISTINCT country
FROM customers;
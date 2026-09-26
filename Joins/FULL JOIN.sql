--FULL JOIN
--return all rows from both of the tables including the matching and unmatching



-- order of table does not matter

--get all customers and all orders even if there is no matach
SELECT *
FROM customers
FULL JOIN orders
on id = customer_id


--mechanism:
-- 1. take everything from left table and store in result
-- 2. now starting searching for matches in the right table and return the matching rows
-- 3. if there are some unmatching rows in left or right table, sql shows NULL
-- 4. even if the left (from clause) table's rows are finished executing, we still look in the right table if there is any order that is not in the left table, we also show those rows


--use cases:
-- 1. recombine data
-- but not for data enrichment/extra info'
-- 2. can also be used for filtering -> FULL + WHERE
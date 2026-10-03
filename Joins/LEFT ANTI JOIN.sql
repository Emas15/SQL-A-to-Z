--LEFT ANTI JOIN
-- i only keep the unmatching rows of left table
-- the rows that matches with right table, i won't keep them in the result

-- primary -> left
-- from right table, we don't want any data
-- we use right table just to eliminate some rows in the left table that matches with the right table
-- so we use right table just as a FILTER

--SYNTAX
-- select * 
-- from A
-- LEFT JOIN B
-- on A.key = B.key
-- WHERE B.key IS NULL -----> B/right table's row is NULL when we have an unmatched row, so we only want the unmatched rows of left table
-------> 😉 it can be (B.any col name of the right table) as for unmatching rows.... every column is NULL

--ORDER is important...



-- task : Get all customers who did not place any order:

SELECT 
	c.id,
	c.first_name,

	o.order_id,
	o.order_date,
	o.sales

FROM customers AS c
LEFT JOIN orders AS o
ON c.id = o.customer_id
WHERE o.customer_id IS NULL


--Now let's see the orders for which i do not have any customer data available:
SELECT 
	*
FROM orders AS o
LEFT JOIN customers AS c
ON c.id = o.customer_id
WHERE c.id IS NULL 



--use case:
-- using it as a filter to check existence



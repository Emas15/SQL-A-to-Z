-- FULL ANTI JOIN
-- return only the rows that don't match in either table
-- only unmatching rows of left and only unmatching rows of right


-- we use OR operator

--TASK : find customers without orders and orders without customers

SELECT 
	*

FROM customers AS c
FULL JOIN orders AS o
ON c.id = o.customer_id
WHERE (c.id IS NULL) OR (o.customer_id IS NULL)


-- order does not matters

--output:
-- i will get the customer who did not order anything
-- i will also get a order for which i don't have the customer's data


-- use case:
--filtering
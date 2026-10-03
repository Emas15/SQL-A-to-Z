--ADVANCED INNER JOIN


--TASK : get all the customers along with order but ‼️only for customers who have placed an order
-- ‼️‼️‼️ WIhout using inner join

SELECT 
	*

FROM customers AS c
FULL JOIN orders AS o
ON c.id = o.customer_id
WHERE NOT(c.id IS NULL) AND NOT(o.customer_id IS NULL)
-- right join
-- similar reversed logic on left join

--just oRDER stays the same, from left -> join right



--Get all the customers along with orders, including orders without matching customers
-- main table -> orders
-- secondary table -> customers
SELECT 
	
	c.id,
	c.first_name,

	o.order_id,
	o.order_date,
	o.sales

FROM customers AS c --> order stays the same
RIGHT JOIN orders AS o --> right join : get everything from this table‼️‼️‼️
ON c.id = o.customer_id


--ALTERNATIVE OF RIGHT JOIN (Better to use this -> just switch the left table with right table and use LEFT JOIN)
-- now try to get the exact same resul using LEFT join😲: just switch the order😉
SELECT 
	c.id,
	c.first_name,

	o.order_id,
	o.order_date,
	o.sales

FROM orders AS o --> now this is my primary table: get everything from here first
LEFT JOIN customers AS c --> get only the matching data from here and put NULL in the unmatched data
ON c.id = o.customer_id


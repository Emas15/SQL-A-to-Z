--LEFT JOIN
--Return ALL THE ROWS FROM LEFT TABLE, and ONLY MATCHING ROWS FROM RIGHT TABLE(only the matching data that matches with left table)
-- for the unmatching rows in the right table, we show NULL in rows of right table

--match on what????: usually matches on primary key or id, but here because of the syntax i get all the data from left table and the data that has the similar id or primary key of right table



-- here left table -> primary source (all data)
-- right table -> secondary source (additional data)

--Syntax:
--	select * 
--	FROM A -> left table
--	(LEFT) JOIN B -> right table					
--	ON A.key/id = B.key/id

--‼️‼️ ORDER : -> start the LEFT TABLE in the FROM clause -> then join the RIGHT TABLE in the join clause



-- Task : Get all customers along with their orders, including those who did not order :


SELECT 
	c.id,
	c.first_name,

	o.order_id,
	o.order_date,
	o.sales

FROM customers AS c
LEFT JOIN orders AS o --> main difference is in the syntax
ON c.id = o.customer_id


--Behind the scence:
-- 1. immediately put all the rows from left table
-- 2. for the right table : sql is gonna go and check one by one with left's id and right's id -> then keep the result of right table
-- 3. for those rows that don't match -> in the right table's rows as we don't have anything we will put NULL

--use case:
-- recombine data, data enrichment -> extra info
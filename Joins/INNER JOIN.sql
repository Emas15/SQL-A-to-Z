--Inner join
-- return ONLY the matching ROWS from both tables
--should exists in both tables

--select * 
--FROM A
--[Type of the join] JOIN B					-> if i do not specity the type, by deault it will be inner jon
--ON A.key/id = B.key/id							-> ON <condition> -> on how to match ROWS??? -> we need to find a common clolum in both -> usually the common col is keys or ids


-- but best practice : always mention the type, as not everyone will know the deault

--‼️Task : get all {customers along with orders} but {only for customers who have placed an order}->this is the hint that tells, we need to use INNER JOIN

SELECT 
	c.id,
	c.first_name,

	o.order_id,
	o.sales,
	o.order_date

FROM customers AS c
INNER JOIN orders AS o
ON c.id = o.customer_id

--COLUMN AMBIGUITY:
--sometimes multiple tables can have the same column name
--in that case we add table name before the column name
--but writing the table name every time besdie the col name is tough and time consuming
--so we can also set ALIASes for the tables 

--Mechanism:
-- the left table here is customers, so i join on id with customer id... so id 1 compares with ‼️‼️‼️all the ids(1,2,3,6) and return all the matching rows

--so MUST is:
--there must be a MATCH in order to show the row

--use case:
-- recombined data from multiple tables
-- also for checking existence : filtering : checking the existence of rows




--good practice: we do not need to keep all the col except the necessary ones.. like in here id and customer_id both are same data, repition


--Understanding the order of the tables:
--> for inner join : order does not matter








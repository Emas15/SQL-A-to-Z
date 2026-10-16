--UPDATE in already existing rows
-- UPDATE (table name)
--   SET col1 = value1,
	--   col2 = value2
--WHERE <condtion>

--‼‼️‼️ Where condition is necessary if i wanna update SPECIFIC rows, 
-- if  do not mention it, i will unintentionally update all the rows' value of the table



--Task : change the (score) of customer with id = 6 to score = 0

/* SELECT * FROM customers
WHERE id = 6 */
 SELECT * FROM customers
WHERE id = 6


UPDATE customers
SET score = 0  --if i execute here, it will update all the rows score = 0
WHERE id = 6   --<IMPORTANT>
-- output : it will show how many rows are affected


-----------------------------------------------------------------------------------
-- UPDATE without a WHERE clause
-- applies the change to ALL rows in the table.
-- Each row is updated using its own column values.
UPDATE runners
SET kmh = (total_distance * 60) / time_taken_mins;

-- TOP / LIMIT 
-- the number of rows i wanna see in a specfic col/cols

SELECT TOP(3) --based on the row numbers(these row numbers are out of actual table data)
	* 
FROM customers;


--MySQL:
SELECT 
	first_name, 
	country, 
	score
FROM customers
ORDER BY score DESC
LIMIT 3;

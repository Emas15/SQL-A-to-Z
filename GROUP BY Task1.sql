--GROUP BY
-- combines rows with same value
-- aggregates a column by another cloumn ex: total score by country
-- shrink down a massive list of data into a small, simple summary.

--Task : Find the total score for each country

SELECT 
	country,						--category, this is the value that i want to group up the data by
	SUM(score) AS total_score		-- this is the aggregation, i mean how do i group the data up
FROM customers
GROUP BY country; --combine the data using GROUP BY

--!!! important : the column/columns after select should also be mentioned after group by



--sequence: (konta ta k combine korbo aggregate kore? ans : country k... then aggregate function ki? ans: sum().... then group by kake korbo? : again country k...)
/* 
1. from table, retrive the data
2. Group by country, group up the data by the country and aggregate the score for each country
3. sql look for rows sharing the same value, like germany is in 2 different rows
4. now sql gonna combine then and they(germany) will have only one row 
5. now sql will check the AGGREGATE FUNCTION, which is summation of score.. so sql will also combine the rows of score into one row
6. if there is any country which appears only once, it will not aggregate
*/
--GROUP BY
-- combines rows with same value
-- aggregates a column by another cloumn ex: total score by country
-- shrink down a massive list of data into a small, simple summary.

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--😉😉😉GROUP BY only makes sense when at least two rows share the same value in the column(s) you’re grouping by.
--If there are multiple rows with the same value, they get collapsed into one group, and you can apply aggregate functions (COUNT, SUM, AVG, etc.) on that group.
--If there’s only one row with that value, it still forms a group — but it’s just a group of one. The aggregate result will be based on that single row.

/*🔹 Key takeaway
At least one row is enough to form a group.

But GROUP BY is most useful when there are multiple rows with the same value, because that’s when aggregation really shows patterns.

👉 So, if you group by a column where every row is unique (like id), you’ll just get one group per row — which is basically the same as not grouping at all.*/
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------




--Task : Find the total score for each country

SELECT 
	country,						--category, this is the value that i want to group up the data by
	SUM(score) AS total_score		-- I MUST USE SOME SORT OF FUNC HERE... OTHERWISE SQL WON'T UNDERSTAND WHICH SCORE TO USE... this is the aggregation, i mean how do i group the data up
FROM customers
GROUP BY country; --combine the data using GROUP BY

--!!! important : the column/columns after select should also be mentioned after group by -> i mean should be same amount of column/s



--sequence: (konta ta k combine korbo aggregate kore? ans : country k... then aggregate function ki? ans: sum().... then group by kake korbo? : again country k...)
/* 
1. from table, retrive the data
2. Group by country, group up the data by the country and aggregate the score for each country
3. sql look for rows sharing the same value, like germany is in 2 different rows
4. now sql gonna combine then and they(germany) will have only one row 
5. now sql will check the AGGREGATE FUNCTION, which is summation of score.. so sql will also combine the rows of score into one row
6. if there is any country which appears only once, it will not aggregate
*/


/*
Table: employees
+------------+----------+--------+
| department | employee | salary |
+------------+----------+--------+
| HR         | Alice    | 5000   |
| HR         | Bob      | 6000   |
| IT         | Carol    | 7000   |
| IT         | Dave     | 8000   |
| Finance    | Eve      | 9000   |
+------------+----------+--------+

GROUP BY department
↓
Buckets form like this:

HR bucket:     [Alice, Bob]
IT bucket:     [Carol, Dave]
Finance bucket:[Eve]

Then aggregate functions apply inside each bucket:
- HR → AVG(salary) = (5000+6000)/2 = 5500
- IT → AVG(salary) = (7000+8000)/2 = 7500
- Finance → AVG(salary) = 9000 (only one row, but still a group!)
*/



--GROUP BY MULTIPLE COLS:
-- Here’s a clear **example of `GROUP BY` with multiple columns** in MySQL so you can see how it works:

-- ---

-- ### 📊 Example Table: `sales`

-- | id | country  | year | product   | revenue |
-- |----|----------|------|-----------|---------|
-- | 1  | USA      | 2024 | Laptop    | 5000    |
-- | 2  | USA      | 2024 | Phone     | 3000    |
-- | 3  | USA      | 2025 | Laptop    | 7000    |
-- | 4  | Germany  | 2024 | Laptop    | 4000    |
-- | 5  | Germany  | 2025 | Phone     | 2000    |
-- | 6  | UK       | 2024 | Laptop    | 3500    |
-- | 7  | UK       | 2025 | Phone     | 2500    |

-- ---

-- ### 🔹 Query: Group by **country and year**
-- ```sql
-- SELECT 
--     country,
--     year,
--     SUM(revenue) AS total_revenue,
--     COUNT(id) AS total_sales
-- FROM sales
-- GROUP BY country, year;
-- ```

-- ---

-- ### ✅ Output
-- | country | year | total_revenue | total_sales |
-- |---------|------|---------------|-------------|
-- | USA     | 2024 | 8000          | 2           |
-- | USA     | 2025 | 7000          | 1           |
-- | Germany | 2024 | 4000          | 1           |
-- | Germany | 2025 | 2000          | 1           |
-- | UK      | 2024 | 3500          | 1           |
-- | UK      | 2025 | 2500          | 1           |

-- ---

-- 👉 Notice how grouping by **two columns** (`country, year`) gives a breakdown per country *and* per year, instead of just one big total per country.

-- ---


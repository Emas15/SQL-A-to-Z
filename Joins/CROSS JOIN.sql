--Cross Join
-- combines every row from left with every row from right
-- all possible combinations
-- combine everything with everything


-- it is also called the Cartesian join

-- Example:
-- suppose i have 2 row in table A and 3 rows in B
-- combination : 2x3 = 6 possible combinations

--making the DB really busy huh

-- ‼️‼️we do not care if matches or not, so not comparision needed


-- Generate all possible combination of customers and orders
SELECT
	*
FROM customers
CROSS JOIN orders

--WHY TO USE IT:
--for generating some test data like i have table for products and colors and i wanna see the combination of products for all color

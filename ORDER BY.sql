-- This is a comment
/* THIS
IS A MULTILINE
COMMENT */

SELECT 
	first_name,
	country,
	score  -- whatever order i write here, the output will show me in that order

FROM customers
ORDER BY score DESC;

-- can order by a column that isn’t listed in the SELECT clause, and it will work just fine.
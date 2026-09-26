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
-- change score to 0 and country to UK of customer with id  = 8

SELECT * FROM customers
WHERE id = 8


UPDATE customers
SET country = 'UK',
	score = 0
WHERE id = 8
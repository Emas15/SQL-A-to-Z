-- Retrive the top 3 customers with highest score


SELECT TOP(3)
	*
FROM customers
ORDER BY score DESC

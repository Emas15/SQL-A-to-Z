-- get two most rcent orders

SELECT TOP(3) *
FROM orders 
ORDER BY order_date DESC
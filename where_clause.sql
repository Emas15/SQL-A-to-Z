-- retrive customers from not  Germany 

SELECT 
	first_name,
	country
FROM customers
WHERE country != 'Germany'
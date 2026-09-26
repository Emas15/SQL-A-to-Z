--Membership operator
--IN , NOT IN




--reptitive!!!
SELECT * 
FROM customers
WHERE country = 'Germany' OR country='USA'

--IN
SELECT * 
FROM customers
WHERE country IN ('Germany', 'USA')
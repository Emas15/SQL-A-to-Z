--Logical operator AND OR NOT
--AND
SELECT *
FROM customers
WHERE (country = 'USA') AND (score>500)


--OR
SELECT *
FROM customers
WHERE (country = 'USA') OR (score>500)

--lemme do a quick update here first
UPDATE customers
SET score = 0
where id =5


--NOT
SELECT *
FROM customers
WHERE NOT(country = 'USA') 


SELECT *
FROM customers
WHERE NOT(score < 500) 





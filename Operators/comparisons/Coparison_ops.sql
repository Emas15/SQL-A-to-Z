/*
Comparison Operators Notes:

Condition format:
   [Expression] [Operator] [Expression]

Examples:
- Column1 = Column2
- Column1 = Value
- Function = Value
- Expression = Value
- Subquery = Value

Illustrations:
- first_name = last_name
- first_name = 'John'
- UPPER(first_name) = 'JOHN'
- Price * Quantity = 1000
- (SELECT AVG(sales) FROM orders) = 1000
*/



SELECT *
FROM customers
WHERE country = 'Germany'


SELECT *
FROM customers
WHERE country != 'Germany'



SELECT *
FROM customers
WHERE score > 500

SELECT *
FROM customers
WHERE score >= 500


SELECT *
FROM customers
WHERE score < 500


SELECT *
FROM customers
WHERE score <= 500

SELECT *
FROM customers
WHERE UPPER(first_name) = 'MARIA'


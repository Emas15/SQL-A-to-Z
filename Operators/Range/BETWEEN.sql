--Range operator

--BETWEEN (inclusive)

SELECT *
FROM customers
WHERE score BETWEEN 100 AND 500


--or:
SELECT *
FROM customers
WHERE score>=100 AND score<=500
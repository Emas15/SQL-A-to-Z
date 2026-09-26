--HAVING TASK1:

-- Find the average score of each country considering the customers with a score != 0 and return only those countries with an average score greater than 430


--observation : "returin only those countries with..." -> here i can get the hint that i need to group the countries and filter on a condition

SELECT
	country,
	AVG(score) AS average_score

FROM customers
WHERE score!=0
GROUP BY country
HAVING AVG(score) > 430;
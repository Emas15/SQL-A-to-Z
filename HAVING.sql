--HAVING
-- Filters data after aggregation
--!!!!!can be used only with GROUP BY
-- it has a condition with it

--and we mainly use group by where one thing appears more than once

SELECT
	country,
	SUM(score) AS total_score

FROM customers
--WHERE score>400 --> (if we wanted to filter the data before the aggregation then we would use where)
GROUP BY country
HAVING SUM(score) > 800;  --> but if we want to filter the data after tha aggregation then we use HAVING

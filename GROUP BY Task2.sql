-- Find the total score and total number of customers for each country

SELECT 
country,
SUM(score) AS total_score,
COUNT(id) AS total_customers --it does not sum up the value of the country's id But it just counts how many ids the country have... means how many times it appreas
FROM customers
GROUP BY country; --this is the most important line


--so instead of id even if i pass first_name in the county, it will do the same job
-- it just groups by country the aggregate when the country appreas more then once

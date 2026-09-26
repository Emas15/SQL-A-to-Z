-- All at once 
-- execution vs coding order

-- coding order :  1. select distinct top (filtering) -> executes 5th and TOP exectues 7th(last)
				-- 2. columns ->5th
				-- 3. aagregations -> executes with group by
				-- 4. FROM table  -> executes 1st
				-- 5. Where clause (filtering before aggregation) -> executes 2nd
				-- 6. GROUP BY  -> executes 3rd
				-- 7. having clause (filtering after aggregation) -> executes 4th
				-- 8. order by -> 6th 


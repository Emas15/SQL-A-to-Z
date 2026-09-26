--Search
--LIKE
--searching for a pattern in text

/*
SQL Pattern Matching with LIKE

Wildcards:
- %  → Matches 0, 1, or many characters
- _  → Matches exactly 1 character

Examples:
1. M% -> must start with M and then can be anything or empty
   - Matches: Maria, Ma, M
   - Does not match: Emma

2. %in -> must end with in and can be just in
   - Matches: Martin, Vin, in
   - Does not match: Jasmine

3. %r% ->r must be anywhere, start end middle or even just r
   - Matches: Maria, Peter, Rayn, R
   - Does not match: Alice

4. __b% -> the 1st char must be something, then 2nd must be something, then 3rd must be 'b' then there can be anything or just empty
   - Matches: Albert, Rob, Abel
   - Does not match: An_
*/


SELECT * 
FROM customers
WHERE first_name LIKE 'M%'


--first name ends with 'n'
SELECT * 
FROM customers
WHERE first_name LIKE '%n'

--first name contains 'r'
SELECT * 
FROM customers
WHERE first_name LIKE '%r%'

--first name contains 'r' in the 3rd position
SELECT * 
FROM customers
WHERE first_name LIKE '__r%'

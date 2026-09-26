-- update all customers' with a score = 0 to score = 10

UPDATE customers
set score = 10
WHERE score = 0 -- if we werte replacing null = we would do -> score IS NULL


SELECT * FROM persons
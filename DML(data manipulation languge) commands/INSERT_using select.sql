-- INSERT using another table(source table) to a empty or a target table
-- taking data from a source table and inserting that into the target table

-- copy data from 'customers' table and move that into 'persons' table

SELECT * FROM customers -- (id, first_name, country, score) -> source
SELECT * FROM persons -- (id, person_name, birth_date, email) -> target {only the birth_date accepts null)


--target table
INSERT INTO persons (id, person_name, birth_date,email, phone) --(tho mentioning all the cols are not must but good for maintain and read) --but wait, i dropped the phone column earlier, let me add it again using ALTER, look down)
SELECT 
	id,
	first_name, --person name for persons table
	NULL, --birth date(not available in source table)
	'Not available', -- email( not available in the source table) --varchar
	'Not available' -- phone (also not available in the source table) --varchar
FROM customers --source table



--for manual execution:

ALTER TABLE persons
ADD phone VARCHAR(15) NOT NULL --because it is set as varchar, it can have both num and characters,string


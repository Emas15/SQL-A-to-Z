SELECT 
	LEN(TRIM(first_name)) as name_len_without_spaces,
	LEN(first_name) as actual_len
FROM customers;

--Task :  Find the customers whose first name contains leading and trailing spaces:

SELECT
	first_name as name_with_any_sapces
FROM customers
WHERE first_name != TRIM(first_name);


SELECT
	first_name,
    LEN(first_name) len_name,
    LEN(TRIM(first_name)) len_trimmed_name,
    LEN(first_name) - LEN(TRIM(first_name)) flag -- to see which has white spaces as 0 and 1
FROM customers
WHERE LEN(first_name) != LEN(TRIM(first_name));





-- Replacing : REPLACE(value, old value, new value)

UPDATE customers
set first_name = 'M-a-r-i-a'
WHERE first_name = 'Maria';

-- concept:
SELECT 
'123-456-7890',
REPLACE('123-456-7890', '-' ,'');

--apply it on customers:
SELECT
    first_name,
    REPLACE(first_name, '-', '') clean_name
FROM customers;

SELECT
    phone,
    REPLACE(phone, '0', 'ayhay') clean_phone
FROM customers;



--replace file extence from tex to csv:
SELECT
'report.txt' old_file_name,
REPLACE('reporst.txt', '.txt', '.csv') new_file_name;

-------------------------------------------------------------------


ALTER TABLE customers
ADD phone VARCHAR(20);


-- Insert 5 rows with id, phone, email, and person_name
INSERT INTO persons (id, phone, email, person_name)
VALUES
    (1, '01711111111', 'user1@example.com', 'Alice'),
    (2, '01722222222', 'user2@example.com', 'Bob'),
    (3, '01733333333', 'user3@example.com', 'Charlie'),
    (4, '01744444444', 'user4@example.com', 'Diana'),
    (5, '01755555555', 'user5@example.com', 'Emtiaz');




UPDATE c
SET c.phone = p.phone
FROM customers AS c
JOIN persons AS p 
ON c.id = p.id;

SELECT * FROM customers;


-------------------------------------------------------------------------------


-- calculation -> LEN -> how many char :

SELECT
LEN(first_name) len_name
FROM customers;


----------------------------------------------------

-- String extraction:

-- LEFT and RIGHT:

-- left -> (extracts) sepecific number of characters from the start <--
-- right -> (extracts) sepecific number of characters from the end <--


-- LEFT : LEFT( value, no. of chars) <--> same for RIGHT

-- extract first and last 3 char of names
SELECT 
    LEFT(TRIM(first_name) , 3) first_three,
    RIGHT(first_name , 3) last_three
FROM customers;




-------------------------------------------------------------------------------

-- substring -> extract.. a part of a string at a specified postions

-- SUBSTRING ( value, start, length ) --> ‼️‼️‼️ start is inclusive

-- ex: after the 1st character extract 3 characters:

SELECT
    SUBSTRING( first_name, 1, 3) sub_name --> it is like first 3 chars
FROM customers;


-- ex2: after the 1st character extract all chars:

SELECT
    SUBSTRING( TRIM(first_name), 2, LEN(first_name)) sub_name --> trimming is important to have as we might not know about white spaces‼️‼️‼️
FROM customers;








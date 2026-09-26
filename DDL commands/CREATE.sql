/* Create a new table called persons
with columns: id, person_name, birth_date, and phone */

--DDL COMMANDS : defining the structure a database
--ddl commands does not  return data, it changes the structe of my databse

CREATE TABLE persons (
	
	id INT NOT NULL, --(col name) (data type) (constraint)
	person_name VARCHAR(50) NOT NULL, -- varchar can contain anything in string format , we need to specify the length it and if we don't it will set a default one
	birth_date DATE,
	phone VARCHAR(15) NOT NULL,

	-- primary key : -> to make sure the table has a integrity and connectable to other tables
	CONSTRAINT pk_person PRIMARY KEY (id) --> here pk_person is just a name of the primary key, it can be anything


	/*
CONSTRAINT = Must!!!!
PRIMARY KEY is a rule (constraint).
It means the column must be:
- Unique (no duplicates)
- Not NULL (cannot be empty)
- Used to identify each row.

Here, 'id' is the unique identifier.
If needed, you can make a composite key
by listing multiple columns, e.g. (id, phone).
*/

-- ‼️‼️⚡ What’s happening in your code
-- Right now, your table definition:
	
	-- id INT NOT NULL,
	-- CONSTRAINT pk_person PRIMARY KEY (id)

-- MEANS:
-- id must be unique and not null.

-- But you must manually insert values (e.g., INSERT INTO persons VALUES (1, 'John', '2000-01-01', '12345')). -- which is exactly what i did during INSERT

-- If you want the database to automatically assign id = 1, 2, 3…, you need to add the ‼️‼️auto‑increment/identity keyword depending on your ‼️‼️SQL dialect(). --> ‼️‼️For meaning of dialent watch below

‼️‼️
-- A SQL dialect is basically the "flavor" or variation of SQL that a particular database system uses.

-- SQL is a standard language, but each database (MySQL, PostgreSQL, SQL Server, Oracle, SQLite, etc.) adds its own extensions, keywords, and behaviors. That’s why the same command might look slightly different depending on which system you’re using.


-- ‼️‼️Yes — SQL Server is a relational database management system (RDBMS) developed by Microsoft.

-- 🔎 What that means:
-- Relational → It organizes data into tables (rows and columns), and relationships between those tables are defined using primary keys and foreign keys.

-- Database Management System (DBMS) → It’s software that lets you store, query, update, and manage data efficiently.
)




/*
A primary key is like the unique ID card for each row in a table.

It makes sure every row can be identified without confusion.

No two rows can share the same primary key value, and it can’t be empty (NULL).

Think of it like student roll numbers in a class: even if two students have the same name, their roll number is unique.

📌 Why do we need it?
- Uniqueness → Prevents duplicate records.
  Example: Two people named “John” can exist, but their IDs will be different.

- Easy Search → Helps the database quickly find the exact row.
  Example: Instead of searching by name (which could be repeated), you search by ID.

- Relationships → Used to connect tables together.
  Example: If you have a persons table and an orders table, the person’s ID (primary key) can link to their orders.

👉 In short:
A primary key is the anchor of a table. Without it, the database wouldn’t know how to uniquely identify or connect rows.
*/




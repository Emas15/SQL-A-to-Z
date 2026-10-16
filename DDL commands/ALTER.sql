-- ADD a new column called 'email' to the persons table ( already existing created table )

--UNCOMMENT ITTTTTT -> cannot run twice as after adding it cannot add another cloumn with same name
--ALTER TABLE persons
--ADD email VARCHAR(50) NOT NULL 

-- by defatule it will always to at the end of the table
-- but to insert it at any other certain positions, you have to drop the entire table and create again

--deleting a specific column:

ALTER TABLE persons
DROP COLUMN phone


/*
Rule for ALTER TABLE in SQL Server:

- Each ALTER TABLE statement applies to one table.
- You can ADD multiple columns in one statement:
    ALTER TABLE persons ADD email VARCHAR(50), address VARCHAR(100);

- You can DROP multiple columns in one statement:
    ALTER TABLE persons DROP COLUMN phone, birth_date;

- But if you mix operations (ADD + DROP + MODIFY), 
  you must write separate ALTER TABLE statements for each.
*/


/*
===========================================
SQL Server ALTER TABLE Cheat Sheet
===========================================

-- 1. ADD COLUMN
-- Add a new column to the table.
ALTER TABLE runners
ADD age INT;

-- 2. DROP COLUMN
-- Remove an existing column from the table.
ALTER TABLE runners
DROP COLUMN email;

-- 3. ALTER COLUMN
-- Change the data type, size, or nullability of a column.
ALTER TABLE runners
ALTER COLUMN student_name NVARCHAR(200) NOT NULL;

-- 4. ADD CONSTRAINT
-- Add rules to enforce data integrity.
--   Primary Key
ALTER TABLE runners
ADD CONSTRAINT PK_runners PRIMARY KEY (student_id);

--   Foreign Key
-- Ensures values in runners.school_id must exist in schools.id
-- (referential integrity between tables).
ALTER TABLE runners
ADD CONSTRAINT FK_runners_school FOREIGN KEY (school_id) REFERENCES schools(id); --> schools is another table

--   Unique
-- Ensures all values in a column are distinct.
ALTER TABLE runners
ADD CONSTRAINT UQ_runners_email UNIQUE (email);

--   Check
-- Enforces a condition on values in a column.
ALTER TABLE runners
ADD CONSTRAINT CK_runners_distance CHECK (distance_covered > 0);

-- 5. DROP CONSTRAINT
-- Remove an existing constraint.
ALTER TABLE runners
DROP CONSTRAINT CK_runners_distance;

-- 6. ENABLE/DISABLE CONSTRAINT
-- Temporarily disable or re-enable a constraint.
ALTER TABLE runners
NOCHECK CONSTRAINT FK_runners_school;

ALTER TABLE runners
CHECK CONSTRAINT FK_runners_school;

-- 7. SWITCH PARTITION (Advanced)
-- Move data between partitions or tables.
ALTER TABLE runners
SWITCH PARTITION 1 TO runners_archive PARTITION 1;

-- 8. RENAME COLUMN (Note!)
-- ALTER TABLE cannot rename columns directly.
-- Use sp_rename instead:
EXEC sp_rename 'runners.student_name', 'full_name', 'COLUMN';

===========================================
Summary:
- ALTER TABLE = structural changes (columns, constraints, partitions).
- sp_rename   = metadata changes (names).
- REFERENCES schools(id) = links runners.school_id to schools.id,
  enforcing referential integrity (only valid school IDs allowed).
===========================================
*/



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


-- In **MySQL**, the `ALTER TABLE` statement lets you change an existing table — add, drop, or modify columns, and even set constraints like primary keys. Here are the most common patterns:

-- ---

-- ### 🔹 Add a New Column
-- ```sql
-- ALTER TABLE students
-- ADD COLUMN email VARCHAR(100);
-- ```

-- ---

-- ### 🔹 Drop a Column
-- ```sql
-- ALTER TABLE students
-- DROP COLUMN age;
-- ```

-- ---

-- ### 🔹 Modify a Column (change type, size, or constraints)
-- ```sql
-- ALTER TABLE students
-- MODIFY COLUMN name VARCHAR(200) NOT NULL;
-- ```

-- ---

-- ### 🔹 Add a Primary Key
-- ```sql
-- ALTER TABLE students
-- ADD PRIMARY KEY (student_id);
-- ```

-- ---

-- ### 🔹 Add Auto Increment to a Column
-- ```sql
-- ALTER TABLE students
-- MODIFY COLUMN student_id INT AUTO_INCREMENT PRIMARY KEY;
-- ```
-- 👉 This makes `student_id` automatically increase with each new row.

-- ---

-- ### 🔹 Rename a Column
-- ```sql
-- ALTER TABLE students
-- CHANGE COLUMN name full_name VARCHAR(100);
-- ```

-- ---

-- ### 🔹 Rename the Table
-- ```sql
-- ALTER TABLE students
-- RENAME TO learners;
-- ```

-- ---

-- 📌 **Tips:**
-- - Always back up your table before altering it — changes are permanent.  
-- - Use `DESCRIBE table_name;` to check the structure after altering.  
-- - If you’re adding `AUTO_INCREMENT`, the column must be indexed (usually as a primary key).  

-- ---


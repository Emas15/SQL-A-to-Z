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

/*
INSERT:

- INSERT INTO table_name (column1, column2, column3, ...)
  VALUES (value1, value2, value3, ...);

- If no columns are specified:
  → SQL expects values for ALL columns in the table.
  -> so mentioning columns isn't a must -> but it is always better to mention for clarity and maintainiablity

- Multiple inserts can be done in one statement:
  VALUES (value1, value2, value3, ...),
         (value1, value2, value3, ...);

- Rule:
  → The number of columns must match the number of values.
*/

-- NOTE:
-- When inserting into a table, you can specify only certain columns.
-- For columns you skip:
--   • If they allow NULLs → SQL Server inserts NULL.
--   • If they have a DEFAULT → SQL Server uses that default value.
--   • If they are NOT NULL with no default → the INSERT will fail.
-- Best practice: always list the columns you want to insert into,
-- ‼️‼️and make sure skipped columns are either nullable or have defaults.


INSERT INTO customers (id, first_name, country, score)
VALUES 
    (6, 'Anna', 'USA',NULL),
    (7, 'SAM', NULL, 100) -- but some columns are not allowed to be null because of the constraints that was set while creating the table

-- output of this will show how many rows are affected


INSERT INTO customers (id, first_name)
VALUES (8, 'Andreas')

 

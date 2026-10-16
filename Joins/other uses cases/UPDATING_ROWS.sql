-- NOTE:
-- JOIN by itself does not change any data.
-- It is used to recombine, enrich, or filter rows across tables.
-- UPDATE is the command that actually modifies data in a table.
-- When UPDATE is combined with JOIN, the JOIN acts as a mapping tool
-- to decide which rows should be updated with values from another table.

-- Example 1: Using JOIN just to view combined data
SELECT 
    c.id,
    c.first_name,
    o.order_id,
    o.order_date,
    o.sales
FROM customers AS c
LEFT JOIN orders AS o
    ON c.id = o.customer_id;

-- ‼️‼️here we used join to see those selected columns in a joined version
-- This SELECT shows combined data from customers and orders,
-- but does not change anything in either table.


----------------------------------------------------------------------------------------------------------------------------------------



-- Example 2: Using UPDATE with JOIN to copy values
UPDATE c
SET c.phone = p.phone

FROM customers c
JOIN persons p
    ON c.id = p.id;

-- JOIN: finds/matches rows between tables (mapping).
-- UPDATE: changes values in a table.
-- UPDATE + JOIN: means "update those rows in one table
-- using values from the rows they are mapped to in another table."
-- JOIN says which rows correspond, and UPDATE sets those values in those mapped rows


-- "Mapping rows" = matching rows between tables by a key (like id).
-- JOIN creates the mapping (pairs of rows).
-- UPDATE uses that mapping to decide which values to copy or change.


-- ‼️‼️this here we are updating the data of the rows  by copying from another table where the data matches on a id or keye
-- This UPDATE changes customers.phone by copying from persons.phone
-- where the rows match on id. The JOIN itself does not change data,
-- it only provides the matching pairs for the UPDATE to act on.

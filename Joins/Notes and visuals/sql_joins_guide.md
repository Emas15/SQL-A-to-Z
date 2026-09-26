# When to Use JOINs

### 1. Recombine Data (Big Picture)
* You have related tables split apart (e.g., `Customers`, `Orders`, `Products`).
* **JOINs** stitch them back together so you can see the full story in one result set.
  * **Example:** `Customers` JOIN `Orders` $\rightarrow$ *"Which customer placed which order?"*

---

### 2. Data Enrichment (Extra Info)
* Sometimes your main table has the basics, but you need extra details from another table.
* **JOINs** add those extra columns.
  * **Example:** `Orders` JOIN `Products` $\rightarrow$ *"What's the product name and price for each order?"*

---

### 3. Check Existence (Filtering)
* **JOINs** can be used to filter rows based on whether a match exists in another table.
  * **Example:** `LEFT JOIN` + `WHERE other_table.id IS NULL` $\rightarrow$ *"Which customers have never placed an order?"*

---

### 💡 Summary

> **Use JOINs when you need to combine, enrich, or filter data across tables.**  
> They are the glue that makes relational databases useful—without JOINs, each table is just an isolated island.


# SQL JOINs: Complete Guide

In SQL, a **JOIN** is used to combine rows from two or more tables based on a related column between them—typically linking a **Primary Key (PK)** in one table to a **Foreign Key (FK)** in another.

---

## 1. High-Level Concept: What & Why

Relational databases normalize data into separate tables to avoid duplication. Without JOINs, each table is an isolated island. JOINs act as the glue that reconnects those pieces to answer full-picture questions.

* **Primary Key (PK):** The anchor of the main table; uniquely identifies each row.
* **Foreign Key (FK):** The connector in the related table; points back to the Primary Key.
* **Column Qualification (`table_name.column_name`):** Explicitly naming the table (or using short aliases like `s.name`) prevents ambiguity errors when multiple tables share the same column names (e.g., `id`, `name`) and makes queries easier to read.

---


## 2. When & Why to Use JOINs: The 3 Core Scenarios

### Scenario 1: Recombine Data (The Big Picture)
**Goal:** Stitch related tables back together so you can see the complete record in one result set.

#### Base Tables

**`Students` Table**
| student_id | name |
| :--- | :--- |
| 1 | Alice |
| 2 | Bob |

**`Enrollments` Table**
| enrollment_id | student_id | course |
| :--- | :--- | :--- |
| 101 | 1 | Math |
| 102 | 2 | Physics |

#### SQL Query
```sql
SELECT 
    Students.name, 
    Enrollments.course
FROM Students
JOIN Enrollments 
    ON Students.student_id = Enrollments.student_id;
```

#### Query Result
| name | course |
| :--- | :--- |
| Alice | Math |
| Bob | Physics |

---

### Scenario 2: Data Enrichment (Adding Extra Details)
**Goal:** Take a main table with basic IDs and attach descriptive metadata (like names or prices) from lookup tables.

#### Base Tables

**`Orders` Table**
| order_id | student_id | product_id |
| :--- | :--- | :--- |
| 201 | 1 | 501 |
| 202 | 2 | 502 |

**`Products` Table**
| product_id | product_name | price |
| :--- | :--- | :--- |
| 501 | Notebook | $5.00 |
| 502 | Pen | $2.00 |

#### SQL Query
```sql
SELECT 
    o.order_id, 
    s.name AS student_name, 
    p.product_name, 
    p.price
FROM Orders o
JOIN Students s 
    ON o.student_id = s.student_id
JOIN Products p 
    ON o.product_id = p.product_id;
```

#### Query Result
| order_id | student_name | product_name | price |
| :--- | :--- | :--- | :--- |
| 201 | Alice | Notebook | $5.00 |
| 202 | Bob | Pen | $2.00 |

---

### Scenario 3: Check Existence / Filtering (Anti-Joins)
**Goal:** Pair a `LEFT JOIN` with a `WHERE ... IS NULL` clause to identify records in the main table that have **no matching record** in the related table.

#### Base Tables

**`Students` Table**
| student_id | name |
| :--- | :--- |
| 1 | Alice |
| 2 | Bob |
| 3 | Charlie |

**`Enrollments` Table**
| enrollment_id | student_id | course |
| :--- | :--- | :--- |
| 101 | 1 | Math |
| 102 | 2 | Physics |

#### SQL Query
```sql
-- Find students who have NOT enrolled in any course
SELECT 
    s.student_id, 
    s.name
FROM Students s
LEFT JOIN Enrollments e 
    ON s.student_id = e.student_id
WHERE e.student_id IS NULL;
```

#### Query Result
| student_id | name |
| :--- | :--- |
| 3 | Charlie |

---

## 3. Types of SQL JOINs & Sample Dataset

To compare how all JOIN types behave, consider these two tables:

**`Employees` Table**
| emp_id | emp_name | dept_id |
| :--- | :--- | :--- |
| 101 | Aarti | 1 |
| 102 | Bhaskar | 1 |
| 103 | Chitra | 2 |
| 104 | Devan | 2 |
| 105 | Esha | NULL |

**`Departments` Table**
| dept_id | dept_name |
| :--- | :--- |
| 1 | Engineering |
| 2 | Sales |
| 3 | Marketing |

---

### A. INNER JOIN
Returns **only rows with matching values** in both tables.

```sql
SELECT e.emp_name, d.dept_name
FROM Employees e
INNER JOIN Departments d 
    ON e.dept_id = d.dept_id;
```

#### Result
| emp_name | dept_name |
| :--- | :--- |
| Aarti | Engineering |
| Bhaskar | Engineering |
| Chitra | Sales |
| Devan | Sales |

*(Esha is omitted because `dept_id` is NULL; Marketing is omitted because no employees belong to it.)*

---

### B. LEFT JOIN (or LEFT OUTER JOIN)
Returns **all rows from the left table**, plus matching rows from the right table. Unmatched right-side columns display as `NULL`.

```sql
SELECT e.emp_name, d.dept_name
FROM Employees e
LEFT JOIN Departments d 
    ON e.dept_id = d.dept_id;
```

#### Result
| emp_name | dept_name |
| :--- | :--- |
| Aarti | Engineering |
| Bhaskar | Engineering |
| Chitra | Sales |
| Devan | Sales |
| Esha | NULL |

---

### C. RIGHT JOIN (or RIGHT OUTER JOIN)
Returns **all rows from the right table**, plus matching rows from the left table. Unmatched left-side columns display as `NULL`.

```sql
SELECT e.emp_name, d.dept_name
FROM Employees e
RIGHT JOIN Departments d 
    ON e.dept_id = d.dept_id;
```

#### Result
| emp_name | dept_name |
| :--- | :--- |
| Aarti | Engineering |
| Bhaskar | Engineering |
| Chitra | Sales |
| Devan | Sales |
| NULL | Marketing |

---

### D. FULL OUTER JOIN
Returns **all rows from both tables**, filling in `NULL` on whichever side lacks a match.

```sql
SELECT e.emp_name, d.dept_name
FROM Employees e
FULL OUTER JOIN Departments d 
    ON e.dept_id = d.dept_id;
```

#### Result
| emp_name | dept_name |
| :--- | :--- |
| Aarti | Engineering |
| Bhaskar | Engineering |
| Chitra | Sales |
| Devan | Sales |
| Esha | NULL |
| NULL | Marketing |

---

### E. CROSS JOIN
Returns the **Cartesian product** (every possible combination of rows from both tables).

```sql
SELECT e.emp_name, d.dept_name
FROM Employees e
CROSS JOIN Departments d;
```

#### Result
Generates **15 rows** (5 employees × 3 departments).

---

### F. SELF JOIN
Joins a table to **itself** to query hierarchical or related relationships within the same dataset.

```sql
-- Finding employee-manager pairs within an Employees table containing manager_id
SELECT 
    e.emp_name AS Employee, 
    m.emp_name AS Manager
FROM Employees e
LEFT JOIN Employees m 
    ON e.manager_id = m.emp_id;
```

---

## 4. Quick Reference Matrix

| JOIN Type | Output Behavior | Primary Purpose |
| :--- | :--- | :--- |
| **`INNER JOIN`** | Strict intersection (matches only) | Recombining valid relational data |
| **`LEFT JOIN`** | All left rows + matching right rows | Data enrichment while retaining all primary records |
| **`RIGHT JOIN`** | All right rows + matching left rows | Mirror of `LEFT JOIN` (rarely used in practice) |
| **`FULL OUTER JOIN`** | All records from both sides | Reconciling and auditing unmatched datasets |
| **`CROSS JOIN`** | Cartesian product ($N \times M$ combinations) | Generating test grids, schedules, or combinations |
| **`SELF JOIN`** | Unifies a single table against itself | Querying hierarchies (e.g., manager/employee structures) |
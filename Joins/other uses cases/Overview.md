# SQL JOIN Use Cases

## 1. Recombine Data

Merge related tables into one result set.

```sql
SELECT
    c.id,
    c.first_name,
    o.order_id,
    o.order_date,
    o.sales
FROM customers AS c
LEFT JOIN orders AS o
    ON c.id = o.customer_id;
```

_This `SELECT` shows combined data from customers and orders, but does not change anything in either table._

---

## 2. Data Enrichment

Add extra details from another table.

```sql
SELECT
    c.id,
    c.first_name,
    p.email
FROM customers AS c
JOIN persons AS p
    ON c.id = p.id;
```

_This `SELECT` enriches customers with email data from persons._

---

## 3. Check Existence / Filtering

Find rows with or without matches.

```sql
SELECT
    c.id,
    c.first_name
FROM customers AS c
LEFT JOIN orders AS o
    ON c.id = o.customer_id
WHERE o.order_id IS NULL;
```

_This finds customers who have no orders._

---

## 4. Data Synchronization / Data Transfer

Copy values from one table into another using JOIN as a mapping tool.

```sql
UPDATE c
SET c.phone = p.phone
FROM customers c
JOIN persons p
    ON c.id = p.id;
```

_This `UPDATE` changes `customers.phone` by copying from `persons.phone` where the rows match on `id`. The `JOIN` itself does not change data; it only provides the matching pairs for the `UPDATE` to act on._

_->‼️‼️if you don’t have another table to map rows against, then you can’t rely on a JOIN to line things up. In that case, you fall back to using a WHERE condition manually to target the rows you want to update._

---

## ✨ Summary

- **`JOIN` alone** → Recombines, enriches, or filters data.
- **`UPDATE` + `JOIN`** → A fourth use case: Data Synchronization, where `JOIN` maps rows by key, and `UPDATE` applies the changes.

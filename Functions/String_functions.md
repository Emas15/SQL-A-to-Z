# 📘 SQL String Functions — Detailed Notes

## 📊 Quick Reference Table

| Function        | Purpose                            | Example Query                                                                  | Output Example                                               |
| :-------------- | :--------------------------------- | :----------------------------------------------------------------------------- | :----------------------------------------------------------- |
| **`CONCAT`**    | Combine multiple strings into one  | `SELECT CONCAT(first_name, ' ', country) AS name_country FROM customers;`      | `Maria Germany`                                              |
| **`UPPER`**     | Convert text to uppercase          | `SELECT UPPER(first_name) AS upper_name FROM customers;`                       | `MARIA`                                                      |
| **`LOWER`**     | Convert text to lowercase          | `SELECT LOWER(first_name) AS lower_name FROM customers;`                       | `maria`                                                      |
| **`TRIM`**      | Remove leading/trailing spaces     | `SELECT TRIM(first_name) AS clean_name FROM customers;`                        | `" John "` $\rightarrow$ `John`                              |
| **`REPLACE`**   | Replace or remove characters       | `SELECT REPLACE('123-456-7890','-','') AS clean_phone;`                        | `1234567890`                                                 |
| **`LEN`**       | Count number of characters         | `SELECT LEN(first_name) AS len_name FROM customers;`                           | `Maria` $\rightarrow$ `5`                                    |
| **`LEFT`**      | Extract characters from start      | `SELECT LEFT(first_name, 3) AS first_three FROM customers;`                    | `Maria` $\rightarrow$ `Mar`                                  |
| **`RIGHT`**     | Extract characters from end        | `SELECT RIGHT(first_name, 3) AS last_three FROM customers;`                    | `Maria` $\rightarrow$ `ria`                                  |
| **`SUBSTRING`** | Extract part of string at position | `SELECT SUBSTRING(first_name, 2, LEN(first_name)) AS sub_name FROM customers;` | `Maria` $\rightarrow$ `aria`, `Martin` $\rightarrow$ `artin` |

---

## 🔹 1. Concatenation (`CONCAT`)

- **Purpose:** Combine multiple string values into a single string.

- **Key Details:** Useful for joining fields (e.g., first and last name, address components). Separators such as spaces, dashes, or underscores can be added manually.

### Example

```sql
SELECT CONCAT(first_name, ' ', country) AS name_country
FROM customers;
```

- **Output:** `"Maria Germany"`, `"John USA"`

## 🔹 2. Case Conversion (`UPPER`, `LOWER`)

- **Purpose:** Transform text case to either uppercase or lowercase.

- **Key Details:** Essential for standardizing text data before performing comparisons or searches.

### Examples

```sql
SELECT LOWER(first_name) AS lower_name,
       UPPER(first_name) AS upper_name
FROM customers;
```

- **Output:**
  - `Maria` $\rightarrow$ `maria` (lowercase)

  - `Maria` $\rightarrow$ `MARIA` (uppercase)

## 🔹 3. Trimming Spaces (`TRIM`)

- **Purpose:** Remove leading and trailing whitespace characters from a string.

- **Key Details:** Helps clean messy data entries and identify strings contaminated with trailing/leading spaces.

### Examples

**Detect names containing spaces:**

```sql
SELECT first_name
FROM customers
WHERE first_name != TRIM(first_name);
```

**Compare string lengths to flag extra spaces:**

```sql
SELECT first_name,
       LEN(first_name) AS len_name,
       LEN(TRIM(first_name)) AS len_trimmed,
       LEN(first_name) - LEN(TRIM(first_name)) AS flag
FROM customers;
```

- **Note:** If `flag > 0`, the `first_name` contains extra spaces.

## 🔹 4. String Replacement (`REPLACE`)

- **Purpose:** Replace specified character sequences with new characters, or remove them entirely.

- **Key Details:** Frequently used to reformat phone numbers, IDs, or file extensions.

### Examples

```sql
-- Remove dashes from a phone number
SELECT REPLACE('123-456-7890', '-', '') AS clean_phone;

-- Replace a file extension
SELECT REPLACE('report.txt', '.txt', '.csv') AS new_file;
```

- **Output:** `"1234567890"`, `"report.csv"`

## 🔹 5. String Length (`LEN` / `LENGTH`)

- **Purpose:** Count total number of characters within a string.

- **Key Details:** Useful for validating input lengths (e.g., phone numbers, zip codes, or passwords).

### Example

```sql
SELECT LEN(first_name) AS len_name
FROM customers;
```

- **Output:** `"Maria"` $\rightarrow$ `5`

## 🔹 6. Extracting Characters (`LEFT`, `RIGHT`)

- **Purpose:** Extract a fixed number of characters starting from the far left (beginning) or far right (end) of a string.

### Examples

```sql
SELECT LEFT(TRIM(first_name), 3) AS first_three,
       RIGHT(first_name, 3) AS last_three
FROM customers;
```

- **Output for "Maria":**
  - First 3: `"Mar"`

  - Last 3: `"ria"`

## 🔹 7. Substring (`SUBSTRING` / `SUBSTR`)

- **Purpose:** Extract a specific portion of a string based on a starting index and specified length.

- **Syntax:** `SUBSTRING(string_value, start_position, length)`

### Examples

**Extract first 3 characters:**

```sql
SELECT SUBSTRING(first_name, 1, 3) AS sub_name
FROM customers;
```

**Extract all characters after the first character dynamically:**

```sql
SELECT SUBSTRING(TRIM(first_name), 2, LEN(first_name)) AS sub_name
FROM customers;
```

- **Output:**
  - `"Maria"` $\rightarrow$ `"aria"`

  - `"Martin"` $\rightarrow$ `"artin"`

## 🧩 Combining Nested Functions

Functions can be nested together inside a single statement to handle complex string manipulation tasks.

### Example

```sql
SELECT SUBSTRING(TRIM(first_name), 2, LEN(first_name)) AS clean_sub
FROM customers;
```

- **Process:** First trims extra whitespace, then extracts the dynamic substring starting from character 2 to the end.

## ⚡ Summary of Real-World Use Cases

| Function              | Common Application                                                                          |
| :-------------------- | :------------------------------------------------------------------------------------------ |
| **`CONCAT`**          | Generating full names, complete mailing addresses, combined product labels.                 |
| **`UPPER` / `LOWER`** | Case-insensitive comparisons and standardizing search inputs.                               |
| **`TRIM`**            | Data cleansing after user input or data migration.                                          |
| **`REPLACE`**         | Cleaning formatting characters from phone numbers, SSNs, or updating file paths/extensions. |
| **`LEN`**             | Validating field lengths (e.g., postal codes, account numbers).                             |
| **`LEFT` / `RIGHT`**  | Extracting area codes, country codes, system prefixes, or date suffixes.                    |
| **`SUBSTRING`**       | Parsing out specific internal data (e.g., email domains, transaction codes).                |

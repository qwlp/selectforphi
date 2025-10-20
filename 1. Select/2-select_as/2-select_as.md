```sql
DROP TABLE customers;
CREATE TABLE transactions (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    user_id INT UNSIGNED NOT NULL,
    recipient_id INT UNSIGNED NULL,
    sender_id INT UNSIGNED NULL,
    note TEXT,
    amount DECIMAL(10, 2) NOT NULL,
    was_successful BOOLEAN,
    PRIMARY KEY (id)
);

INSERT INTO transactions (user_id, sender_id, note, amount, was_successful)
VALUES
    (2, 10, 'Happy Birthday! Gramma loves you!', 20.00, TRUE),
    (2, 10, 'Happy Birthday from Gramma!', 20.00, TRUE),
    (2, 2, 'Car problems', 256.21, TRUE);
```

The **`AS` clause** is a powerful feature in SQL that allows you to temporarily rename a column or an expression in the result set of a query. This temporary name is called an **alias**.

## 1\. Why Use `AS`?

  * **Clarity:** Make cryptic or technical column names (like `cust_id` or `ts_c_1`) more readable in your application (e.g., rename them to `Customer ID` or `Transaction Status`).
  * **Conciseness:** Shorten long column names for easier reference in applications or reports (as in the example below).
  * **Calculations:** Give a name to the result of a mathematical expression (e.g., `(price * quantity) AS total_cost`).

## 2\. Syntax

The basic syntax for aliasing a column is:

```sql
SELECT column_name AS alias_name
FROM table_name;
```

## 3\. Tos lets try out a problem

In our scenario, we are querying the `transactions` table. We want the column `note` to appear as `birthday_message` in our results.

**Goal:** Find the `amount` and the `note` (aliased as `birthday_message`) for transactions where the `sender_id` is **10** (Grandma).


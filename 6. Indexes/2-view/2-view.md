# Views

A **view** is a virtual table based on a SQL query. Each time you query a view, MySQL reruns the underlying query and returns the latest results.

**Use views to:**
- Simplify complex queries
- Hide sensitive columns
- Provide custom data views

## Creating a View

```sql
-- View for US users only
CREATE VIEW v_users_us AS
SELECT id, name, age, username
FROM users
WHERE country_code = 'US';

-- Query it like a table
SELECT * FROM v_users_us;
```

Results:
```
id   name      age   username
---- --------- ----- -----------
1    David     34    DavidDev
5    Hunter    30    Hdev92
6    Allan     27    Alires
```

The view is always up-to-date with the latest data from the `users` table.

## Hiding Sensitive Data

Create views that hide certain columns:

```sql
-- Public view - hides password and is_admin
CREATE VIEW v_user_transactions_public AS
SELECT
    u.id,
    u.name,
    u.username,
    COUNT(t.id) AS transaction_count,
    SUM(t.amount) AS total_amount
FROM users u
LEFT JOIN transactions t ON u.id = t.user_id
GROUP BY u.id, u.name, u.username;

-- Query the public view
SELECT * FROM v_user_transactions_public;
```

## Using Views

Use views like regular tables:

```sql
-- Filter a view
SELECT * FROM v_user_transactions_public WHERE transaction_count > 2;

-- Join views to tables
SELECT v.name, c.name AS country
FROM v_users_us v
JOIN countries c ON v.country_code = c.country_code;
```

## Updating Through Views

Simple views can be updated:

```sql
-- Works for simple views
UPDATE v_users_us SET age = 35 WHERE username = 'DavidDev';
```

Complex views (with JOINs, GROUP BY, aggregates) **cannot** be updated:

```sql
-- This fails
UPDATE v_user_transactions_public SET transaction_count = 5;
-- Error: The target table is not updatable
```

**Best Practice:** Update tables directly, not views.

## Dropping a View

```sql
DROP VIEW v_users_us;
```

The underlying table remains unchanged.

## Quick Tips

✅ Simplify complex queries with views
✅ Hide sensitive data
✅ Views always show latest data
❌ Don't update through views
❌ Can't add indexes to views (but MySQL uses table indexes)

## Assignment

Using TheSeanApp database:

Create a view `v_transactions_successful` showing only successful transactions (where `was_successful` = true). Include: `id`, `user_id`, `amount`, `note`.

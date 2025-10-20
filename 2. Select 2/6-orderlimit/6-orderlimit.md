# Order By and Limit

When using both `ORDER BY` and `LIMIT`, the `ORDER BY` clause must come *first*.

## Assignment

Pich was mad and got into the system where we store all the queries and tried to update one herself.

Fix the bug in the SQL query.

```sql
SELECT * from transactions
WHERE amount BETWEEN 10 and 80
LIMIT 4
ORDER BY amount desc;
```

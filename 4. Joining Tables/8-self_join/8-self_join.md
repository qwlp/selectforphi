# Self Join
A SELF JOIN connects a table to itself. This is useful when you need to combine rows from the same table, for example, to find relationships within the data.

* Since a table is referenced twice in the same query, you must use table aliases (temporary names) to distinguish between the two instances and avoid an error.

Suppose we have a table named “table1" that is going to be used twice in the single query. To aliases the student table, we can write it as:

```sql
SELECT column_name(s)
FROM table1 T1, table1 T2
WHERE condition;
```

Or we can inner join them on the same table:

```sql
SELECT
    *
FROM
    users AS u1
INNER JOIN
    users AS u2
ON
    condition;
```

## Assignment

PP wants to find some new friends in his area who are of the same age as him. Identify users in *TheSeanApp* who are contemporaries(rous nv the same region) from the same region. Write a query that joins the `users` table to itself (aliased as `u1` and `u2`) to find pairs of `users` who share the same `age` and are from the same `country`.

* Remember that `u1.id < u2.id`, otherwise we are gonna get the same people.

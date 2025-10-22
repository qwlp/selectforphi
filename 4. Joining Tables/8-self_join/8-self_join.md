# Self Join

A SELF JOIN is a join that is used to join a table with itself. In the previous sections, we have learned about the joining of the table with the other tables using different JOINS, such as INNER, LEFT, RIGHT, and CROSS JOIN. However, there is a need to combine data with other data in the same table itself. In that case, we use Self Join.

We can perform Self Join using table aliases. The table aliases allow us not to use the same table name twice with a single statement. If we use the same table name more than one time in a single query without table aliases, it will throw an error

The table aliases enable us to use the temporary name of the table that we are going to use in the query. Let us understand the table aliases with thefollowing explanation.

Suppose we have a table named “table1" that is going to use twice in the single query. To aliases the student table, we can write it as:

```sql
SELECT column_name(s)
FROM table1 T1, table1 T2
WHERE condition;
```

## Assignment
Write a query that joins the `users` table to itself (aliased as u1 and u2) to find pairs of users who share the same age and are from the same country.

Select the name and age of the two users in the pair. Ensure the result does not list a user paired with themselves and avoids duplicate pairs (e.g., if you list Alice and Bob, don't also list Bob and Alice).

Goal: Identify users in *TheSeanApp* who are contemporaries from the same region. Write a query that joins the `users` table to itself (aliased as `u1` and `u2`) to find pairs of `users` who share the same `age` and are from the same `country`.

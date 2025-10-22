# Cross Join

A CROSS JOIN in MySQL creates the Cartesian product of the two tables, meaning every row from the first table is combined with every row from the second table. This is often used for generating combinations or permutations.

* Cartesian product gives you every possible combination between them.

Example:
```sql
SELECT
    a.name AS album_name,
    s.name AS song_name
FROM
    album AS a
CROSS JOIN
    songs AS s;
```

## Assignment

Everyone wants to be *Mr. Worldwide* in *TheSeanApp*. Write a query that performs a CROSS JOIN between the `users` table and the `countries` table. Select the `name` of the user and the `name` of the country.


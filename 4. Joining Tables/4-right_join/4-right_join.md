# Right Join

A `RIGHT JOIN` is, as you may expect, the opposite of a `LEFT JOIN`. It returns all records from `table_b` regardless of matches, and all matching records between the two tables.

![right-join](https://i.imgur.com/LG6Y43j.png)

## Assignment

Sean wants to know what country a user belongs to, but he doesn't want all the details of the user. Write a query that performs a RIGHT JOIN on the `countries` table (right) and the `users` table (left) using the `country_code` columns.

Your query should select the `name` of the country from the `countries` table and the `name` of the user from the `users` table.

Goal: List every country and any users associated with them. Countries with no listed users will still appear, showing a `NULL` value for the user's name.

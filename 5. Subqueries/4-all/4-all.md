# `ALL`

The `ALL` keyword helps you compare a value to **every single value** in a list from a subquery.

Think of it like asking a question about a whole group. For example, "Is Lane older than `ALL` the users in Canada?"

## How It Works

The comparison you use (`>`, `<`, `=`, etc.) must be true for **every item** in the subquery's result for the whole condition to be `TRUE`.

**Example:** Find users who are older than **every single user** from Canada.

```sql
SELECT name, age FROM users
WHERE age > ALL (
  -- This subquery first gets a list of ages for all users in Canada
  SELECT age FROM users WHERE country_code = 'CA'
);
```

**What happens:**
1.  The inner query runs first and finds the ages of all users in Canada. Let's say it returns a list of `(39, 15)`.
2.  The outer query then checks each user one by one. For a user to be selected, their age must be greater than 39 **AND** greater than 15.
3.  In our data, only Albert (age 55) and Ram (age 42) would be selected.

## The Most Common Use: `NOT IN`

You will most often see `ALL` used as its alias, `NOT IN`.

`NOT IN` is just a more readable way of saying **`<> ALL`** (Not Equal To All).

**Example:** Find all users who are **not** from the United States or Canada.

This statement:
```sql
SELECT name FROM users
WHERE country_code NOT IN ('US', 'CA');```
Is the same as this statement:
```sql
SELECT name FROM users
WHERE country_code <> ALL ('US', 'CA');
```

They both do the same thing, but `NOT IN` is much easier to read!

## Important Things to Remember

1.  **Empty Results:** If the subquery returns no rows, the `ALL` condition will surprisingly return `TRUE`.
2.  **NULL Values:** If the list from the subquery contains a `NULL`, your `ALL` condition might not work as you expect. It's best to filter out `NULL`s if you can.

## Assignment

TheSeanApp's marketing team wants to run a campaign targeting a younger demographic. To help them, they need a list of all users who are younger than **every single user** located in Brazil.

Use a subquery with the `ALL` keyword to find the `name`, `age`, and `username` for every user who is younger than all users with the country code 'BR'.

# Subqueries with `ALL`

The `ALL` keyword in SQL is a powerful tool used in conjunction with comparison operators in subqueries. It allows you to compare a single value to every value in a result set returned by a subquery.

## The Basic Syntax

The general structure for using `ALL` in a subquery is as follows:

```sql
operand comparison_operator ALL (subquery)
```

Here, the `comparison_operator` can be any of the standard operators such as `=`, `!=`, `<`, `>`, `<=`, or `>=`.

## How `ALL` Works

The `ALL` condition evaluates to `TRUE` only if the comparison is true for *every single value* returned by the subquery. Let's consider an example:

```sql
SELECT s1 FROM t1 WHERE s1 > ALL (SELECT s1 FROM t2);
```

In this query, a row from table `t1` will be selected only if its `s1` value is greater than *all* the `s1` values present in table `t2`.

**Here's how the outcome can vary:**

*   **TRUE:** If `t1` has a row with `s1 = 10` and `t2` contains `(-5, 0, 5)`, the condition is `TRUE` because 10 is greater than every value in `t2`.
*   **FALSE:** If `t2` contains `(12, 6, -100)`, the condition becomes `FALSE` because 10 is not greater than 12.
*   **UNKNOWN (NULL):** If `t2` contains `(0, NULL, 1)`, the result is `UNKNOWN` (treated as `NULL`). This is because the comparison with `NULL` is always unknown.

## "Edge Cases" to Keep in Mind

When working with subqueries, it's important to consider two special scenarios:

1.  **Empty Tables:** If the subquery returns an empty set, the `ALL` condition will surprisingly evaluate to `TRUE`.
    *   `SELECT * FROM t1 WHERE 1 > ALL (SELECT s1 FROM t2);` is `TRUE` if `t2` is empty.
    *   However, `SELECT * FROM t1 WHERE 1 > (SELECT s1 FROM t2);` will be `NULL` if `t2` is empty.

2.  **NULL Values:** As seen in the example above, the presence of `NULL` in the subquery's result set can lead to an `UNKNOWN` outcome.

## The `NOT IN` Alias

An important and more commonly used alias for `<> ALL` is `NOT IN`. These two expressions are functionally identical.

The following two statements will produce the same result:

```sql
SELECT s1 FROM t1 WHERE s1 <> ALL (SELECT s1 FROM t2);
```

```sql
SELECT s1 FROM t1 WHERE s1 NOT IN (SELECT s1 FROM t2);
```

While they are equivalent, `NOT IN` is often preferred for its readability.

## Using `TABLE` with `ALL`

If your subquery simply selects from a table with a single column, you can use the `TABLE` keyword as a shorthand:

```sql
SELECT s1 FROM t1 WHERE s1 <> ALL (TABLE t2);
```

This is equivalent to:

```sql
SELECT s1 FROM t1 WHERE s1 <> ALL (SELECT * FROM t2);
```

However, this syntax cannot be used if the subquery involves a column expression, like an aggregate function. For instance, `SELECT * FROM t1 WHERE 1 > ALL (SELECT MAX(s1) FROM t2);` cannot be rewritten with `TABLE t2`.

## Assignment

TheSeanApp's marketing team wants to run a campaign targeting a younger demographic. To help them, they need a list of all users who are younger than **every single user** located in Brazil.

Use a subquery with the `ALL` keyword to find the `name`, `age`, and `username` for every user who is younger than all users with the country code 'BR'.

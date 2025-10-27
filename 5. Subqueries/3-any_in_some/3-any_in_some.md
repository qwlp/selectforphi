# ANY, IN, and SOME

These keywords are used with subqueries to check if a comparison is true for values in a result set.

## The `ANY` and `SOME` Keywords

`ANY` and its alias `SOME` return `TRUE` if a comparison is true for **at least one** value returned by the subquery.

**Syntax:**
`operand comparison_operator ANY (subquery)`

**Example:**
This query finds products with a price higher than the lowest-priced product in another table.
```sql
SELECT ProductName FROM Products
WHERE Price > ANY
(SELECT Price FROM OtherProducts);
```

## The `IN` Keyword

`IN` is an alias for `= ANY`. It checks if a value exists within the set of values returned by the subquery.

**Syntax:**
`operand IN (subquery)`

**Example:**
These two queries are identical and find products that are also listed in the `OrderItems` table.
```sql
SELECT ProductName FROM Products
WHERE ProductID IN (SELECT ProductID FROM OrderItems);

SELECT ProductName FROM Products
WHERE ProductID = ANY
(SELECT ProductID FROM OrderItems);
```

**Key Points:**
*   `SOME` is a synonym for `ANY`.
*   `IN` is a synonym for `= ANY` when used with a subquery.
*   `NOT IN` is an alias for `<> ALL`, not `<> ANY`.

## Assignment: :

TheSeanApp's fraud department wants to review the users who have *received* large payments. They need a list of all users who have been the recipient of any transaction with an amount of $50.00 or more.

Use a subquery with `ANY` to get the `name` and `username` of all users who have received a transaction of at least $50.

# Indexes

In a database, an index is a data structure that helps the database locate and retrieve rows faster. In contrast to a full table scan, the database simply checks the key values of the index to quickly find the desired rows.

Think of a book's index. It allows you to quickly find the specific key terms and topics from the book without having to read every page.

# Where can indexes be useful?

Indexes are usually used to speed up queries with `WHERE`, `JOIN`, `ORER BY` and `GROUP BY` clauses.

# How to create

```SQL
CREATE INDEX idx_users_name ON users(name);
```

Format: CREATE INDEX index_name ON table_name(column_name);
Format (for multiple columns): CREATE INDEX index_name ON table_name(column_name1, column_name2, column_name3, ...);

# How to drop

```SQL
DROP INDEX idx_users_name ON users;
```

Format: DROP INDEX index_name ON table_name;
// There is no need to mention the column name, since the database already recognises the unique name of the index. //

# Types of indexes

1. Clustered indexes
   - created automatically when a primary key is created
   - a table can only have one clustered index
   - defines the physical order of records of a database table
2. Non-clustered indexes
   - created by the user
   - a table can have multiple non-clustered indexes
   - useful for queries that filter or sort
   - keeps the order of the table records that don't match the physical order of the actual data on the disk
3. Multilevel indexes
   - created by the user that combines two or more columns
4. Unique indexes
   - created by the user using a `UNIQUE` constraint to prevent duplicate values in the indexed column
   - can be clustered or non-clustered

## Assignment

The Techconnect event had around 130 total participants.
Write a query to find all participants whose last name starts with 'S'. The `Participants` table has the following fields: `email`, `first_name`, and `last_name`. Then, create an index on the `last_name` column to speed up the query. Observe the difference in response time between the query with and without the index.

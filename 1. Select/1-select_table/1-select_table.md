```sql
CREATE TABLE customers (
    customer_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    PRIMARY KEY (customer_id)
);
```

We can use the select statement to get data from table:

```sql
SELECT * FROM customers;
```

* The * in this query means we are gonna select all the **columns/attributes** yep
* Customers is the table we are selecting from

Give it a try!!!!! 

Now then how would we select **only the customer_id** column.

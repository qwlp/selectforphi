```sql
DROP TABLE users;
CREATE TABLE users (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    name TEXT NOT NULL,
    age INTEGER NOT NULL,
    country_code TEXT NOT NULL,
    username VARCHAR(100) UNIQUE,
    password TEXT NOT NULL,
    is_admin BOOLEAN
);

INSERT INTO users(id, name, age, country_code, username, password, is_admin)
VALUES (1, 'David', 34, 'US', 'DavidDev', 'insertPractice', false);

INSERT INTO users(id, name, age, country_code, username, password, is_admin)
VALUES (2, 'Samantha', 29, 'BR', 'Sammy93', 'addingRecords!', false);

INSERT INTO users(id, name, age, country_code, username, password, is_admin)
VALUES (3, 'John', 39, 'CA', 'Jjdev21', 'welovebootdev', false);

INSERT INTO users(id, name, age, country_code, username, password, is_admin)
VALUES (4, 'Ram', 42, 'IN', 'Ram11c', 'thisSQLcourserocks', false);

INSERT INTO users(id, name, age, country_code, username, password, is_admin)
VALUES (5, 'Rain', 14, 'IN', 'Ram11c76', 'loveThePass', false);

INSERT INTO users(id, name, age, country_code, username, password, is_admin)
VALUES (6, 'Hunter', 17, 'US', 'Hdev92', 'backendDev', false);

INSERT INTO users(id, name, age, country_code, username, password, is_admin)
VALUES (7, 'Allan', 27, 'US', 'Alires', 'iLoveB00tdev', true);

INSERT INTO users(name, age, country_code, username, password, is_admin)
VALUES ('Lance', 20, 'US', 'LanChr', 'b00tdevisbest', false);

INSERT INTO users(name, age, country_code, username, password, is_admin)
VALUES ('Tiffany', 15, 'US', 'Tifferoon', 'autoincrement', true);

INSERT INTO users(name, age, country_code, username, password, is_admin)
VALUES ('Lane', 27, 'US', 'wagslane', 'update_me', true);

INSERT INTO users(name, age, country_code, username, password, is_admin)
VALUES ('Darren', 15, 'CA', 'Dshan', 'found_me', false);
```

# OR

As you've probably guessed, if the logical `AND` operator is supported, the `OR` operator is probably supported as well.

```SQL
SELECT product_name, quantity, shipment_status
    FROM products
    WHERE shipment_status = 'out of stock'
    OR quantity BETWEEN 10 and 100;
```

This query retrieves records where *either* the shipment_status `condition` *OR* the `quantity` condition are met.

## Order of operations

You can group logical operations with parentheses to specify the [order of operations](https://www.mathsisfun.com/operation-order-pemdas.html).

```sql
(this AND that) OR the_other
```

## Assignment

The laws have changed again! Now we need to see how many affected users meet this criteria:

> Users who are from the United States or Canada, and are under 18

Write a query that retrieves the *count* of every user that matches the conditions above.

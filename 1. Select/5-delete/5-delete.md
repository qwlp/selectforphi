```sql
DROP TABLE transactions;

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
VALUES (2, 'Pich', 29, 'KH', 'Pich', 'addingRecords!', false);

INSERT INTO users(id, name, age, country_code, username, password, is_admin)
VALUES (3, 'John', 39, 'CA', 'Jjdev21', 'welovebootdev', false);

INSERT INTO users(id, name, age, country_code, username, password, is_admin)
VALUES (4, 'Ram', 42, 'IN', 'Ram11c', 'thisSQLcourserocks', false);

INSERT INTO users(id, name, age, country_code, username, password, is_admin)
VALUES (5, 'Hunter', 30, 'US', 'Hdev92', 'backendDev', false);

INSERT INTO users(id, name, age, country_code, username, password, is_admin)
VALUES (6, 'Allan', 27, 'US', 'Alires', 'iLoveB00tdev', true);

INSERT INTO users(name, age, country_code, username, password, is_admin)
VALUES ('Lance', 20, 'US', 'LanChr', 'b00tdevisbest', false);

INSERT INTO users(name, age, country_code, username, password, is_admin)
VALUES ('Tiffany', 28, 'US', 'Tifferoon', 'autoincrement', true);

INSERT INTO users(name, age, country_code, username, password, is_admin)
VALUES ('Lane', 27, 'US', 'wagslane', 'update_me', false);
```

# DELETE

When a user deletes their account on Twitter, or deletes a comment on a YouTube video, that data needs to be removed from its respective database.

## DELETE statement

A `DELETE` statement removes a record from a table that match the `WHERE` clause. As an example:

```SQL
DELETE from employees
    WHERE id = 251;
```

This `DELETE` statement removes all records from the `employees` table that have an id of `251`!

## Assignment

Pich keeps ragebaiting me please delete him from this database hehe.

Delete Pich's record from the user table.

### Current state of the `users` table

| ID  | NAME     | AGE | country_code | USERNAME  | PASSWORD           | is_admin |
| --- | -------- | --- | ------------ | --------- | ------------------ | -------- |
| 1   | David    | 34  | US           | DavidDev  | **************     | 0        |
| 2   | Pich     | 29  | KH           | Pich      | **************     | 0        |
| 3   | John     | 39  | CA           | Jjdev21   | **************     | 0        |
| 4   | Ram      | 42  | IN           | Ram11c    | **************     | 0        |
| 5   | Hunter   | 30  | US           | Hdev92    | **************     | 0        |
| 6   | Allan    | 27  | US           | Alires    | **************     | 1        |
| 7   | Lance    | 20  | US           | LanChr    | **************     | 0        |
| 8   | Tiffany  | 28  | US           | Tifferoon | **************     | 1        |
| 9   | Lane     | 27  | US           | wagslane  | **************     | 0        |

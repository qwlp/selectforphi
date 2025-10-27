Copy paste and deang:
```sql
DROP TABLE transactions;
DROP TABLE users;
CREATE TABLE users (
  id INTEGER AUTO_INCREMENT PRIMARY KEY,
  name TEXT NOT NULL,
  age_in_days INTEGER NOT NULL,
  country_code TEXT NOT NULL,
  username VARCHAR(100) UNIQUE,
  password TEXT NOT NULL,
  is_admin BOOLEAN
);

INSERT INTO users(name, age_in_days, country_code, username, password, is_admin)
VALUES ('David', 14560, 'US', 'DavidDev', 'insertPractice', false);

INSERT INTO users(name, age_in_days, country_code, username, password, is_admin)
VALUES ('Samantha', 15560, 'BR', 'Sammy93', 'addingRecords!', false);

INSERT INTO users(name, age_in_days, country_code, username, password, is_admin)
VALUES ('John', 10560, 'CA', 'Jjdev21', 'welovebootdev', false);

INSERT INTO users(name, age_in_days, country_code, username, password, is_admin)
VALUES ('Ram', 4560, 'IN', 'Ram11c', 'thisSQLcourserocks', false);

INSERT INTO users(name, age_in_days, country_code, username, password, is_admin)
VALUES ('Hunter', 20560, 'US', 'Hdev92', 'backendDev', false);

INSERT INTO users(name, age_in_days, country_code, username, password, is_admin)
VALUES ('Allan', 560, 'US', 'Alires', 'iLoveB00tdev', true);

INSERT INTO users(name, age_in_days, country_code, username, password, is_admin)
VALUES ('Lance', 17560, 'US', 'LanChr', 'b00tdevisbest', false);

INSERT INTO users(name, age_in_days, country_code, username, password, is_admin)
VALUES ('Tiffany', 18560, 'US', 'Tifferoon', 'autoincrement', true);

INSERT INTO users(name, age_in_days, country_code, username, password, is_admin)
VALUES ('Lane', 9560, 'US', 'wagslane', 'update_me', false);
```

# No Tables

When working on a back-end application, this doesn't come up often, but it's important to remember that **SQL is a full programming language**. We usually use it to interact with data stored in tables, but it's quite flexible and powerful.

For example, you can `SELECT` information that's simply calculated, with no tables necessary.

```SQL
SELECT 5 + 10 as sum;
```

## Assignment

Finance has found that people who have lived longer than `40` years need to start thinking about retirement. Write a query that returns all the `users` who are more than `40` years old. Unfortunately, this table awkwardly stores age in *days* in the `age_in_days` field.

Use a subquery to convert `years` -> `days` and filter on that. Assume every year has `365` days.


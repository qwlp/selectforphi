```sql
DROP TABLE users;
DROP TABLE countries;
CREATE TABLE countries (
  id INTEGER AUTO_INCREMENT PRIMARY KEY,
  country_code VARCHAR(100) UNIQUE,
  name TEXT
);

INSERT INTO countries(country_code, name)
VALUES ('US', 'United States');

INSERT INTO countries(country_code, name)
VALUES ('CA', 'Canada');

INSERT INTO countries(country_code, name)
VALUES ('IN', 'India');

INSERT INTO countries(country_code, name)
VALUES ('JP', 'Japan');

INSERT INTO countries(country_code, name)
VALUES ('BR', 'Brazil');

CREATE TABLE users (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    name TEXT NOT NULL,
    age INTEGER NOT NULL,
    country_code VARCHAR(100) NOT NULL,
    username VARCHAR(100) UNIQUE,
    password TEXT NOT NULL,
    is_admin BOOLEAN,
	FOREIGN KEY (country_code)
	REFERENCES countries(country_code)
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
VALUES (5, 'Hunter', 30, 'US', 'Hdev92', 'backendDev', false);

INSERT INTO users(id, name, age, country_code, username, password, is_admin)
VALUES (6, 'Allan', 27, 'US', 'Alires', 'iLoveB00tdev', true);

INSERT INTO users(name, age, country_code, username, password, is_admin)
VALUES ('Lance', 20, 'US', 'LanChr', 'b00tdevisbest', false);

INSERT INTO users(name, age, country_code, username, password, is_admin)
VALUES ('Tiffany', 28, 'US', 'Tifferoon', 'autoincrement', true);

INSERT INTO users(name, age, country_code, username, password, is_admin)
VALUES ('Lane', 27, 'US', 'wagslane', 'update_me', false);

INSERT INTO users(name, age, country_code, username, password, is_admin)
VALUES ('Darren', 15, 'CA', 'Dshan', 'found_me', false);

INSERT INTO users(name, age, country_code, username, password, is_admin)
VALUES ('Albert', 55, 'BR', 'BertDev', 'one_al_name', false);

INSERT INTO users(name, age, country_code, username, password, is_admin)
VALUES ('Alvin', 27, 'US', 'AlvinA27', 'easter_egg', false);

INSERT INTO users(name, age, country_code, username, password, is_admin)
VALUES ('Al', 39, 'JP', 'quickCoder', 'snake_case', false);
```
# Namespacing on Tables

When working with multiple tables, you can specify which table a field exists on using a `.`. For example:

> table_name.column_name

```SQL
SELECT students.name, classes.name
FROM students
INNER JOIN classes on classes.class_id = students.class_id;
```

The above query returns the `name` field from the `students` table and the `name` field from the `classes` table.

## Assignment

```sql
SELECT *
FROM users
INNER JOIN countries on countries.country_code = users.country_code;
```

My bro PP decided to mess with the database of the *TheSeanApp* (Stop selecting all PP, it's really bad for us). Adjust the query above to:

* Return the `name`, and `age` fields from the `users` table.
* Return the `name` field from the `countries` table and rename it to `country_name`.
* Sort by the `country_name` in ascending order.

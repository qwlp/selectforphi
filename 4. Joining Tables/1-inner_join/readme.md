```sql
DROP TABLE users;
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
    id INTEGER AUTO_INCREMENT PRIMARY KEY ,
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

# Joins

Joins are one of the most important features that SQL offers. Joins allow us to make use of the relationships we have set up between our tables. In short, joins allow us to query multiple tables at the *same time.*

## Inner Join

The simplest and most common type of join in SQL is the `INNER JOIN`. By default, a `JOIN` command is an `INNER JOIN`. An `INNER JOIN` returns all of the records in `table_a` that have matching records in `table_b` as demonstrated by the following Venn diagram.

![inner join](https://i.imgur.com/wgxAmhA.png)

## On

In order to perform a join, we need to tell the database which fields should be "matched up". The  `ON` clause is used to specify these columns to join.

```SQL
SELECT *
FROM employees
INNER JOIN departments
ON employees.department_id = departments.id;
```

The query above returns *all* the fields from *both* tables. The `INNER` keyword doesn't have anything to do with the number of *columns* returned - it only affects the number of *rows* returned.

## Assignment

Our CEO, Sean, has decided to let our frontend team work on a profile page and has commanded them to display a user's country *name* instead of just the country's two-letter *code* (Cause maybe we want to know what *KR* stands for hehe). Let's start by writing a simple join between the `users` table and `countries` table. We will expand on this query more in the next exercise.

* Write an `INNER JOIN` between `users` and `countries`
* Return *all* fields from both tables

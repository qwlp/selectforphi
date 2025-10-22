```sql
DROP TABLE users;
DROP TABLE countries;
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

CREATE TABLE countries (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  country_code TEXT,
  name TEXT,
  FOREIGN KEY (country_code)
  REFERENCES users (id)
);

-- Don't touch below this line --


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

CREATE TABLE transactions (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  user_id INTEGER NOT NULL,
  recipient_id INTEGER,
  sender_id INTEGER,
  note TEXT,
  amount INTEGER,
  was_successful BOOLEAN
);

INSERT INTO transactions (user_id, sender_id, note, amount, was_successful)
VALUES (9, 4, "Testing transaction!", 10.50, true);

INSERT INTO transactions (user_id, recipient_id, note, amount, was_successful)
VALUES (5, 10, "Thanks for lunch!", 9.56, true);

INSERT INTO transactions (user_id, sender_id, note, amount, was_successful)
VALUES (6, 2, "Car problems", 256.21, false);

INSERT INTO transactions (user_id, recipient_id, note, amount, was_successful)
VALUES (7, 8, "Happy birthday!!", 50, true);

INSERT INTO transactions (user_id, sender_id, note, amount, was_successful)
VALUES (9, 11, "MTG Draft", 50, false);

INSERT INTO transactions (user_id, recipient_id, note, amount, was_successful)
VALUES (6, 4, "lunch with the friends", 12.56, true);

INSERT INTO transactions (user_id, sender_id, note, amount, was_successful)
VALUES (6, 12, "paying ya back for lunch", 12.22, false);

INSERT INTO transactions (user_id, recipient_id, note, amount, was_successful)
VALUES (9, 6, "lunch break", 24.89, true);

INSERT INTO transactions (user_id, sender_id, note, amount, was_successful)
VALUES (1, 23, "thanks for lunch yesterday", 10.00, true);

INSERT INTO transactions (user_id, recipient_id, note, amount, was_successful)
VALUES (6, 14, "5 buck pizza for lunch", 5.00, true);

INSERT INTO transactions (user_id, sender_id, note, amount, was_successful)
VALUES (8, 2, "lunch was goooood thanks, man!", 47.42, true);

INSERT INTO transactions (user_id, recipient_id, note, amount, was_successful)
VALUES (23, 4, "lunch meetup, lets get together again soon.", 16.91, false);

INSERT INTO transactions (user_id, sender_id, note, amount, was_successful)
VALUES (6, 14, "not sure how much lunch was, heres 20", 20.00, true);

INSERT INTO transactions (user_id, recipient_id, note, amount, was_successful)
VALUES (2, 13, "Happy birthday, sis! Lets get lunch soon.", 100.00, true);
```

# Left Join

A `LEFT JOIN` will return every record from `table_a` regardless of whether or not any of those records have a match in `table_b`. A left join will *also* return any matching records from `table_b`. Here is a Venn diagram to help visualize the effect of a `LEFT JOIN`.

![left-join](https://i.imgur.com/mNbhWfM.png)

A small trick you can do to make writing the SQL query easier is define an [alias](https://en.wikipedia.org/wiki/Alias_(SQL)) for each table. Here's an example:

```SQL
SELECT e.name, d.name
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.id;
```

Notice the simple alias declarations `e` and `d` for `employees` and `departments` respectively.

Some developers do this to make their queries less verbose. That said, I personally *hate it* because single-letter variables are harder to understand the meaning of.

## Assignment

The *TheSeanApp* team needs a report on all the transactions a user has made. Join the `users` and `transactions` tables on `users.id` and `transactions.user_id`.

Your query should return 3 fields:

1. A user's `name` as `name`
2. The sum of all of their transaction `amount`s as `sum`
3. The count of all of their transactions as `count`

* Be sure to order the data by the `sum` field in descending order.
* Be sure to still return user records of users who have no transactions.

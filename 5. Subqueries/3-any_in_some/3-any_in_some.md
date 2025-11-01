Copy paste and deang the following:
```sql
DROP TABLE users;

CREATE TABLE users (
  id INTEGER AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  age INTEGER NOT NULL,
  country_code TEXT NOT NULL,
  username VARCHAR(100) UNIQUE,
  password TEXT NOT NULL,
  is_admin BOOLEAN
);

INSERT INTO users(name, age, country_code, username, password, is_admin)
VALUES ('David', 34, 'US', 'DavidDev', 'insertPractice', false);

INSERT INTO users(name, age, country_code, username, password, is_admin)
VALUES ('Samantha', 29, 'BR', 'Sammy93', 'addingRecords!', false);

INSERT INTO users(name, age, country_code, username, password, is_admin)
VALUES ('John', 39, 'CA', 'Jjdev21', 'welovebootdev', false);

INSERT INTO users(name, age, country_code, username, password, is_admin)
VALUES ('Ram', 42, 'IN', 'Ram11c', 'thisSQLcourserocks', false);

INSERT INTO users(name, age, country_code, username, password, is_admin)
VALUES ('Hunter', 30, 'US', 'Hdev92', 'backendDev', false);

INSERT INTO users(name, age, country_code, username, password, is_admin)
VALUES ('Allan', 27, 'US', 'Alires', 'iLoveB00tdev', true);

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

CREATE TABLE transactions (
  id INTEGER AUTO_INCREMENT PRIMARY KEY,
  user_id INTEGER NOT NULL,
  recipient_id INTEGER,
  sender_id INTEGER,
  note TEXT,
  amount INTEGER,
  was_successful BOOLEAN
);

INSERT INTO transactions (user_id, sender_id, note, amount, was_successful)
VALUES (1, 4, "Testing transaction!", 10.50, true);

INSERT INTO transactions (user_id, recipient_id, note, amount, was_successful)
VALUES (1, 10, "Thanks for lunch!", 9.56, true);

INSERT INTO transactions (user_id, sender_id, note, amount, was_successful)
VALUES (1, 2, "Car problems", 256.21, false);

INSERT INTO transactions (user_id, recipient_id, note, amount, was_successful)
VALUES (1, 8, "Happy birthday!!", 50, true);

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

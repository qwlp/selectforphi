Copy paste and deang the following:
```sql
DROP TABLE users;
DROP TABLE countries;
DROP TABLE transactions;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  age INTEGER NOT NULL,
  country_code TEXT NOT NULL,
  username TEXT UNIQUE,
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
  id INTEGER PRIMARY KEY,
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

# Subqueries

Sometimes a single query is not enough to retrieve the specific records we need.

It is possible to run a query on the *result set* of another query - a query within a query! This is called "query-ception"... erm... I mean a "subquery".

Subqueries can be very useful in a number of situations when trying to retrieve specific data that wouldn't be accessible by simply querying a single table.

## Retrieving data from multiple tables

Here is an example of a subquery:

```SQL
SELECT id, song_name, artist_id
FROM songs
WHERE artist_id IN (
    SELECT id
    FROM artists
    WHERE artist_name LIKE 'Rick%'
);
```

In this hypothetical database, the query above selects all of the `song_id`s, `song_name`s, and `artist_id`s from the `songs` table that are written by artists whose name starts with "Rick". Notice that the subquery allows us to use information from a different table - in this case the `artists` table.

## Subquery syntax

The only syntax unique to a subquery is the parentheses surrounding the nested query. The `IN` operator could be different, for example, we could use the `=` operator if we expect a single value to be returned.

## Assignment

One of TheSeanApp's customer service representatives needs us to pull all the transactions for a specific user. Trouble is, they only know the user's `name`, not their `id`.

Use a subquery to get all of "David"s transactions.

### Transactions Table Schema

| id  | user_id | recipient_id | sender_id | note | amount | was_successful |
| --- | ------- | ------------ | --------- | ---- | ------ | -------------- |

### Users Table Schema

| id  | name | age | country_code | username | password | is_admin |
| --- | ---- | --- | ------------ | -------- | -------- | -------- |


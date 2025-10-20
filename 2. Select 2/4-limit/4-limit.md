```sql
DROP TABLE users;

CREATE TABLE transactions (
    id INTEGER PRIMARY KEY AUTO_INCREMENT, 
    recipient_id INTEGER, 
    sender_id INTEGER, 
    note TEXT, 
    amount INTEGER,
  was_successful BOOLEAN
    );

INSERT INTO transactions (id, recipient_id, sender_id, note, amount, was_successful)
VALUES (1, 9, 4, "Testing transaction!", 10.50, true);

INSERT INTO transactions (id, recipient_id, sender_id, note, amount, was_successful)
VALUES (2, 5, 10, "Thanks for lunch!", 9.56, true);

INSERT INTO transactions (id, recipient_id, sender_id, note, amount, was_successful)
VALUES (3, 6, 2, "Car problems", 256.21, true);

INSERT INTO transactions (id, recipient_id, sender_id, note, amount, was_successful)
VALUES (4, 7, 8, "Happy birthday!!", 50, true);

INSERT INTO transactions (id, recipient_id, sender_id, note, amount, was_successful)
VALUES (5, 9, 11, "MTG Draft", 50, false);

INSERT INTO transactions (recipient_id, sender_id, note, amount, was_successful)
VALUES (6, 4, "lunch with the friends", 12.56, true);

INSERT INTO transactions (recipient_id, sender_id, note, amount, was_successful)
VALUES (6, 12, "paying ya back for lunch", 12.22, true);

INSERT INTO transactions (recipient_id, sender_id, note, amount, was_successful)
VALUES (9, 6, "lunch break", 24.89, true);

INSERT INTO transactions (recipient_id, sender_id, note, amount, was_successful)
VALUES (1, 23, "thanks for lunch yesterday", 10.00, true);

INSERT INTO transactions (recipient_id, sender_id, note, amount, was_successful)
VALUES (7, 14, "5 buck pizza for lunch", 5.00, true);

INSERT INTO transactions (recipient_id, sender_id, note, amount, was_successful)
VALUES (8, 2, "lunch was goooood thanks, man!", 47.42, true);

INSERT INTO transactions (recipient_id, sender_id, note, amount, was_successful)
VALUES (23, 4, "lunch meetup, lets get together again soon.", 16.91, true);

INSERT INTO transactions (recipient_id, sender_id, note, amount, was_successful)
VALUES (6, 14, "not sure how much lunch was, heres 20", 20.00, true);

INSERT INTO transactions (recipient_id, sender_id, note, amount, was_successful)
VALUES (2, 13, "Happy birthday, sis! Lets get lunch soon.", 100.00, true);
```

# LIMIT

Sometimes we don't want to retrieve *every* record from a table. For example, it's common for a production database table to have millions of rows, and `SELECT`ing all of them might crash your system! *The `LIMIT` keyword has entered the chat.*

The `LIMIT` keyword can be used at the end of a select statement to reduce the number of records returned.

```SQL
SELECT * FROM products
    WHERE product_name LIKE '%berry%'
    LIMIT 50;
```

The query above retrieves all the records from the `products` table where the name contains the word *berry*. If we ran this query on the Facebook database, it would almost certainly return a *lot* of records. 

The `LIMIT` statement only allows the database to return *up to* 50 records matching the query. This means that if there aren't that many records matching the query, the `LIMIT` statement will not have an effect.

## Assignment

A lot of our users have been using *TheSeanApp* to pay other users for lunch. Let's take a look at a *sample* of that data.

Write a query that returns all rows and fields from the `transactions` table:

* Any record where the `note` field has the word *lunch* in it.
* The query should return at most `5` records.

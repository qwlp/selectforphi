```sql
DROP TABLE transactions;
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

# What are aggregations?

An "aggregation" is a *single* value that's derived by combining *several* other values. We performed an aggregation earlier when we used the `count` statement to count the number of records in a table..

## Why aggregations?

Data stored in a database should generally be stored [raw](https://wagslane.dev/posts/keep-your-data-raw-at-rest/). When we need to calculate some additional data from the raw data, we can use an *aggregation*.

Take the following `count` aggregation as an example:

```SQL
SELECT COUNT(*)
FROM products
WHERE quantity = 0;
```

This query returns the number of products that have a `quantity` of `0`. We *could* store a count of the products in a separate database table, and increment/decrement it whenever we make changes to the `products` table - but that would be *redundant*. 

It's *much simpler* to store the products in a single place (we call this a [single source of truth](https://en.wikipedia.org/wiki/Single_source_of_truth)) and run an aggregation when we need to derive additional information from the raw data.

## Assignment

The front-end team is building a dashboard page in *TheSeanApp*. We need to be able to provide them the number of successful transactions for a given user.

Return the number of `transactions` where the `user_id` is `6`, and `was_successful` is `true`. 

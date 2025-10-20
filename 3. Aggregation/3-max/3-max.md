```sql
DROP TABLE transactions;
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
VALUES (9, 4, "Testing transaction!", 10.50, true);

INSERT INTO transactions (user_id, recipient_id, note, amount, was_successful)
VALUES (5, 10, "Thanks for lunch!", -9.56, true);

INSERT INTO transactions (user_id, sender_id, note, amount, was_successful)
VALUES (6, 2, "Car problems", 256.21, false);

INSERT INTO transactions (user_id, recipient_id, note, amount, was_successful)
VALUES (4, 8, "Happy birthday!!", -50, true);

INSERT INTO transactions (user_id, sender_id, note, amount, was_successful)
VALUES (4, 11, "MTG Draft", 50, false);

INSERT INTO transactions (user_id, recipient_id, note, amount, was_successful)
VALUES (4, 4, "lunch with the friends", -12.56, true);

INSERT INTO transactions (user_id, sender_id, note, amount, was_successful)
VALUES (4, 12, "paying ya back for lunch", 12.22, false);

INSERT INTO transactions (user_id, recipient_id, note, amount, was_successful)
VALUES (9, 6, "lunch break", -24.89, true);

INSERT INTO transactions (user_id, sender_id, note, amount, was_successful)
VALUES (1, 23, "thanks for lunch yesterday", 10.00, true);

INSERT INTO transactions (user_id, recipient_id, note, amount, was_successful)
VALUES (4, 14, "5 buck pizza for lunch", -5.00, true);

INSERT INTO transactions (user_id, sender_id, note, amount, was_successful)
VALUES (4, 2, "lunch was goooood thanks, man!", 47.42, true);

INSERT INTO transactions (user_id, recipient_id, note, amount, was_successful)
VALUES (23, 4, "lunch meetup, lets get together again soon.", -16.91, false);

INSERT INTO transactions (user_id, sender_id, note, amount, was_successful)
VALUES (6, 14, "not sure how much lunch was, heres 20", 20.00, true);

INSERT INTO transactions (user_id, recipient_id, note, amount, was_successful)
VALUES (2, 13, "Happy birthday, sis! Lets get lunch soon.", -100.00, true);
```

# MAX

As you may expect, the `max` function retrieves the *largest* value from a set of values. For example:

```SQL
SELECT max(price)
FROM products
```

This query looks through all of the prices in the `products` table and returns the price with the largest price value. Remember it only returns the `price`, not the rest of the record! You always need to specify each field you want a query to return.

## Assignment

Use a `max` aggregation to find the largest amount of money *received* by a Jill (`user_id` of 4). Return her `user_id` and that amount.

Table name: `transactions`

Column names:

* `id`
* `user_id`
* `recipient_id`
* `sender_id`
* `note`
* `amount`
* `was_successful`

## A note on schema

* The `sender_id` will be present for any transactions where the user in question (`user_id`) is *receiving* money (from the sender).
* The `recipient_id` will be present for any transactions where the user in question (`user_id`) is *sending* money (to the recipient).

In other words, a transaction can only have a `sender_id` *or* a `recipient_id` - not *both*. The presence of one or the other indicates whether money is going *into* or *out of* the user's account.

This `user_id`, `recipient_id`, `sender_id` schema we've designed is only *one* way to design a transactions database - there are other valid ways to do it! It's the one we're using, and later we'll talk more about the tradeoffs in different database design options.

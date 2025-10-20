```sql
DROP TABLE users;

CREATE TABLE transactions (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    user_id INTEGER,
    recipient_id INTEGER,
    sender_id INTEGER,
    amount INTEGER
);

INSERT INTO transactions(user_id, recipient_id, sender_id, amount)
    VALUES (1, 2, NULL, -10);
INSERT INTO transactions(user_id, recipient_id, sender_id, amount)
    VALUES (1, NULL, 2, 25);
INSERT INTO transactions(user_id, recipient_id, sender_id, amount)
    VALUES (1, 5, NULL, -20);
INSERT INTO transactions(user_id, recipient_id, sender_id, amount)
    VALUES (1, NULL, 3, 10);
```

# Finding NULL values

You can use a `WHERE` clause to filter values by whether or not they're `NULL`.

## IS NULL

```SQL
SELECT name FROM users WHERE first_name IS NULL;
```

## IS NOT NULL

```SQL
SELECT name FROM users WHERE first_name IS NOT NULL;
```

## Assignment

The way we store transactions at TheSeanApp is interesting. We store a `user_id` field on the `transactions` table. That user is the "owner" of the transaction, and a `user_id` is never null.

Whenever the owner of the transaction *receives* money, the `sender_id` will not be null - it will be the user id of the sender. The `recipient_id` will be null.

Whenever the owner of the transaction *sends* money, the `recipient_id` will not be null - it will be the user id of the recipient. The `sender_id` will be null.

**Select all the rows from the transactions table where the owner of the transactions is receiving money.**

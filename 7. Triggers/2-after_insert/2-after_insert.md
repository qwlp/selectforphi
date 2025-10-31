### Lesson 2: AFTER INSERT — Log new rows right after they’re saved

What it does
- An AFTER INSERT trigger runs automatically after a new row is added to a table.
- It’s perfect for keeping an audit trail (who did what and when).
- In an AFTER trigger, you can read the inserted values with NEW, but you cannot change them.

What you can access in this trigger
- INSERT: NEW.column (the data that was just inserted)

When to use it at TheSeanApp
- Record a “New user registered” entry in a users audit table
- Record a “New transaction created” entry in a transaction audit table

Quick pattern
1) Create an audit table (timestamp, user, message)
2) Create the AFTER INSERT trigger on the source table
3) Inside the trigger, write one row to the audit table using NEW values

Example: Audit new users
- Tables involved: users (source), users_audit (audit log)
- Goal: Every time a user is created, log a clear message


```sql
-- 1) Create the audit table (run once)

CREATE TABLE IF NOT EXISTS users_audit (

    audit_id INT AUTO_INCREMENT PRIMARY KEY,

    audit_datetime DATETIME NOT NULL,

    audit_user VARCHAR(100) NOT NULL,

    audit_change VARCHAR(500) NOT NULL

);

-- 2) Create the AFTER INSERT trigger on `users`

DELIMITER //
DROP TRIGGER IF EXISTS tr_users_ai//
CREATE TRIGGER tr_users_ai

AFTER INSERT ON users

FOR EACH ROW
BEGIN
    INSERT INTO users_audit (

        audit_datetime,

        audit_user,

        audit_change

    )
    VALUES (
        NOW(),
        USER(),
        CONCAT(
            'New user registered with id ', NEW.id,

            '. Name: ', NEW.name,

            '. Username: ', NEW.username

        )
    );

END//
DELIMITER ;
```

```sql
-- 3) (Optional) Quick test
-- INSERT INTO users (name, age, country_code, username, password, is_admin)

-- VALUES ('Sam', 22, 'US', 'sam_w', 'secret', false);

-- SELECT * FROM users_audit ORDER BY audit_id DESC LIMIT 1;
```


Why this is useful
- AFTER INSERT triggers give you a reliable, consistent log of new records.
- They’re simple, fast, and don’t change the data—just record what happened.

Common gotchas
- AFTER triggers can’t modify data (use BEFORE triggers if you need to fix values).
- Use IFNULL/COALESCE in messages if a column might be NULL.
- Keep messages short but clear (include the id and a couple of key fields).

Assignment
- Create an audit table named users_audit with columns:
  - audit_datetime (DATETIME)
  - audit_user (VARCHAR(100))
  - audit_change (VARCHAR(500))

- Write an AFTER INSERT trigger named tr_users_ai that logs:
  - “New user registered” plus the new user’s id, name, and username

Stretch goal
- Do the same for transactions:
  - Create transaction_audit (same 3 columns as above)
  - Create tr_transactions_ai that logs the new transaction’s id, user_id, amount, and note (use IFNULL for note).
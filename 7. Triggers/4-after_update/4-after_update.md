### Lesson 4: AFTER UPDATE — Track what changed

What it does
- An AFTER UPDATE trigger runs automatically right after a row is updated.
- It’s perfect for creating an audit trail: “what changed, from what, to what, and when.”
- In an AFTER trigger you can read the values, but you cannot modify them.

What you can access in this trigger
- OLD.column — the value before the update
- NEW.column — the value after the update

When to use it at TheSeanApp
- Record user changes (e.g., name, username, age) in `users_audit`
- Record transaction changes (e.g., amount, success status) in `transaction_audit`


A simple 3‑step pattern
1) Create an audit table with: timestamp, user, message
2) Create the AFTER UPDATE trigger on the source table
3) In the trigger, build a clear message that lists only the fields that changed, then insert it into the audit table


Focused example: Audit updates to transactions
Goal: Whenever a transaction changes, log the specifics of what changed (amount and/or was_successful).

```sql
-- 1) Create the audit table (run once)
CREATE TABLE IF NOT EXISTS transaction_audit (
  audit_id INT AUTO_INCREMENT PRIMARY KEY,
  audit_datetime DATETIME NOT NULL,
  audit_user VARCHAR(100) NOT NULL,
  audit_change VARCHAR(500) NOT NULL
);

-- 2) Create the AFTER UPDATE trigger on `transactions`
DELIMITER //
DROP TRIGGER IF EXISTS tr_transactions_au//
CREATE TRIGGER tr_transactions_au
AFTER UPDATE ON transactions
FOR EACH ROW
BEGIN
  -- Start message with the record identifier
  SET @msg = CONCAT('Updated transaction ', OLD.id);

  -- Append only the fields that actually changed
  IF (OLD.amount <> NEW.amount) THEN
    SET @msg = CONCAT(@msg, '. Amount: ', OLD.amount, ' -> ', NEW.amount);
  END IF;

  IF (OLD.was_successful <> NEW.was_successful) THEN
    SET @msg = CONCAT(
      @msg,
      '. Status: ',
      IF(OLD.was_successful, 'true', 'false'),
      ' -> ',
      IF(NEW.was_successful, 'true', 'false')
    );
  END IF;

  -- Write one row to the audit log
  INSERT INTO transaction_audit (audit_datetime, audit_user, audit_change)
  VALUES (NOW(), USER(), @msg);
END//
DELIMITER ;
```

Quick test (optional)
```sql
-- See a few transactions
SELECT id, amount, was_successful FROM transactions ORDER BY id LIMIT 5;

-- Change amount only
UPDATE transactions SET amount = amount + 5.00 WHERE id = 1;

-- Change status only
UPDATE transactions SET was_successful = NOT was_successful WHERE id = 2;

-- Change both at once
UPDATE transactions SET amount = amount + 10.00, was_successful = true WHERE id = 3;

-- Verify audit rows
SELECT * FROM transaction_audit ORDER BY audit_id DESC LIMIT 5;
```


Checklists

Before you start
- Do I have an audit table? (`transaction_audit` or `users_audit`)
- Do I know which columns I care about?
- Will any values be NULL in messages (use IFNULL/COALESCE if needed)?

Writing the trigger
- Use AFTER UPDATE (for auditing) so you can log final values
- Compare fields with `OLD.col <> NEW.col` before logging them
- Keep messages short and clear (always include the id)
- Insert exactly one audit row per update

Testing the trigger
- Update one field at a time (verify message)
- Update multiple fields at once (verify both are logged)
- Try a no-op update (no columns changed) to see your message still makes sense
- Check the audit table for correct time, user, and message content

Common mistakes to avoid
- Trying to modify data in an AFTER trigger (you can’t—use BEFORE for that)
- Logging fields that didn’t change (always compare OLD vs NEW)
- Forgetting the custom delimiter during trigger creation
- Building messages that break when a value is NULL (wrap with IFNULL if needed)


Assignment

Write an AFTER UPDATE trigger named `tr_users_au` for the `users` table that:
- Logs changes to `name`, `username`, and `age` into `users_audit`
- Uses one message per update, starting with: “Updated user <id>”
- Includes only the fields that actually changed (old -> new)

Hints
- Create `users_audit` if it doesn’t exist (`audit_datetime`, `audit_user`, `audit_change`)
- Use the same “build a message, then INSERT to audit” pattern shown above
- For readability, append changes in this format:
  - “. Name: OLD -> NEW”
  - “. Username: OLD -> NEW”
  - “. Age: OLD -> NEW”
# AFTER UPDATE Trigger

Runs automatically **after** a row is updated. Perfect for tracking what changed.

## What You Can Access

- **OLD** - values before the update
- **NEW** - values after the update

## Use Case

Log transaction changes at TheSeanApp (amount or success status).

## Example

```sql
-- 1) Create audit table
CREATE TABLE IF NOT EXISTS transaction_audit (
    audit_id INT AUTO_INCREMENT PRIMARY KEY,
    audit_datetime DATETIME NOT NULL,
    audit_user VARCHAR(100) NOT NULL,
    audit_change VARCHAR(500) NOT NULL
);

-- 2) Create trigger
DELIMITER //
DROP TRIGGER IF EXISTS tr_transactions_au//
CREATE TRIGGER tr_transactions_au
AFTER UPDATE ON transactions
FOR EACH ROW
BEGIN
    -- Build message starting with transaction ID
    SET @msg = CONCAT('Updated transaction ', OLD.id);
    
    -- Log only fields that changed
    IF (OLD.amount <> NEW.amount) THEN
        SET @msg = CONCAT(@msg, '. Amount: ', OLD.amount, ' -> ', NEW.amount);
    END IF;
    
    IF (OLD.was_successful <> NEW.was_successful) THEN
        SET @msg = CONCAT(@msg, '. Status: ', 
                         IF(OLD.was_successful, 'true', 'false'), ' -> ',
                         IF(NEW.was_successful, 'true', 'false'));
    END IF;
    
    -- Write to audit log
    INSERT INTO transaction_audit (audit_datetime, audit_user, audit_change)
    VALUES (NOW(), USER(), @msg);
END//
DELIMITER ;
```

## Test It

```sql
-- See transactions
SELECT id, amount, was_successful FROM transactions ORDER BY id LIMIT 5;

-- Change amount only
UPDATE transactions SET amount = 15.75 WHERE id = 1;

-- Change status only
UPDATE transactions SET was_successful = true WHERE id = 2;

-- Change both
UPDATE transactions SET amount = 25.00, was_successful = false WHERE id = 3;

-- Check audit log
SELECT * FROM transaction_audit ORDER BY audit_id DESC LIMIT 5;
```

## Quick Tips

✅ Compare OLD vs NEW to log only what changed  
✅ Build one message per update  
✅ Always include the record ID  
❌ Don't log fields that didn't change

## Assignment

Write an AFTER UPDATE trigger named `tr_users_au` for the `users` table that:

1. Logs changes to `name`, `username`, and `age`
2. Message format: "Updated user <id>. Name: old -> new. Age: old -> new"
3. Only include fields that actually changed

**Hint:** Use the same IF pattern as the example above.

## Stretch Goal

Add a check in your trigger:
- If the age changed by more than 50 years in one update, log a warning message: "Suspicious age change detected"
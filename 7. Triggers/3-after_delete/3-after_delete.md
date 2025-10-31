# AFTER DELETE Trigger

Runs automatically **after** a row is deleted. Perfect for keeping a history of what was removed.

## What You Can Access

- **OLD** - the row that was just deleted

## Use Case

Track when users are deleted from TheSeanApp (for audit and compliance).

## Example

```sql
-- 1) Create audit table
CREATE TABLE IF NOT EXISTS users_audit (
    audit_id INT AUTO_INCREMENT PRIMARY KEY,
    audit_datetime DATETIME NOT NULL,
    audit_user VARCHAR(100) NOT NULL,
    audit_change VARCHAR(500) NOT NULL
);

-- 2) Create trigger
DELIMITER //
DROP TRIGGER IF EXISTS tr_users_ad//
CREATE TRIGGER tr_users_ad
AFTER DELETE ON users
FOR EACH ROW
BEGIN
    INSERT INTO users_audit (audit_datetime, audit_user, audit_change)
    VALUES (
        NOW(),
        USER(),
        CONCAT('Deleted user with id ', OLD.id,
               '. Name: ', OLD.name,
               '. Username: ', OLD.username)
    );
END//
DELIMITER ;
```

## Test It

```sql
-- See non-admin users
SELECT id, name, username, is_admin FROM users WHERE is_admin = false LIMIT 5;

-- Delete one (adjust the id)
DELETE FROM users WHERE id = 1;

-- Check the audit log
SELECT * FROM users_audit WHERE audit_change LIKE 'Deleted user%' ORDER BY audit_id DESC LIMIT 1;
```

## Quick Tips

✅ Use AFTER DELETE to track deletions  
✅ Access deleted values with OLD  
✅ Log who deleted what and when  
❌ Can't stop the deletion (use BEFORE DELETE for that)

## Assignment

1. Make sure `users_audit` table exists
2. Write an AFTER DELETE trigger named `tr_users_ad` that logs:
   - "Deleted user"
   - User's id, name, and username

## Stretch Goal

Do the same for transactions:
- Create `tr_transactions_ad` trigger
- Log deleted transaction's id, user_id, and amount into `transaction_audit`

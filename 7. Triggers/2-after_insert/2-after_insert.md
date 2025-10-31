# AFTER INSERT Trigger

Runs automatically **after** a new row is inserted. Perfect for logging.

## What You Can Access

- **NEW** - the row that was just inserted

## Use Case

Log when new users register at TheSeanApp.

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
DROP TRIGGER IF EXISTS tr_users_ai//
CREATE TRIGGER tr_users_ai
AFTER INSERT ON users
FOR EACH ROW
BEGIN
    INSERT INTO users_audit (audit_datetime, audit_user, audit_change)
    VALUES (
        NOW(),
        USER(),
        CONCAT('New user registered with id ', NEW.id, 
               '. Name: ', NEW.name, 
               '. Username: ', NEW.username)
    );
END//
DELIMITER ;
```

## Test It

```sql
-- Insert a new user
INSERT INTO users (name, age, country_code, username, password, is_admin)
VALUES ('Sam', 22, 'US', 'sam_w', 'secret', false);

-- Check the audit log
SELECT * FROM users_audit ORDER BY audit_id DESC LIMIT 1;
```

## Quick Tips

✅ Use AFTER triggers for audit logs  
✅ Keep messages clear and concise  
✅ Include the ID and key fields only  
❌ Don't try to modify data in AFTER triggers

## Assignment

1. Create the `users_audit` table if it doesn't exist
2. Write an AFTER INSERT trigger named `tr_users_ai` that logs:
   - "New user registered"
   - User's id, name, and username

## Stretch Goal

Do the same for transactions:
- Create `transaction_audit` table
- Create `tr_transactions_ai` trigger
- Log new transaction's id, user_id, amount, and note (use IFNULL for note)
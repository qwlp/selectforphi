# BEFORE UPDATE Trigger

Runs automatically **before** a row is updated. Perfect for validating and fixing incoming changes.

## What You Can Access

- **OLD** - values before the update
- **NEW** - values after the update (you can modify it!)

## Use Case

Keep user ages valid at TheSeanApp: between 13 (COPPA compliance) and 120 (data quality).

## Example

```sql
-- Create trigger
DELIMITER //
DROP TRIGGER IF EXISTS tr_users_bu//
CREATE TRIGGER tr_users_bu
BEFORE UPDATE ON users
FOR EACH ROW
BEGIN
    -- Enforce minimum: 13 years old
    IF (NEW.age < 13) THEN
        SET NEW.age = 13;
    END IF;
    
    -- Enforce maximum: 120 years old
    IF (NEW.age > 120) THEN
        SET NEW.age = 120;
    END IF;
END//
DELIMITER ;
```

## Test It

```sql
-- See current ages
SELECT id, name, age FROM users WHERE id IN (1, 2, 3) ORDER BY id;

-- Try invalid updates
UPDATE users SET age = 8 WHERE id = 1;     -- becomes 13
UPDATE users SET age = 150 WHERE id = 2;   -- becomes 120
UPDATE users SET age = 35 WHERE id = 3;    -- stays 35

-- Verify results
SELECT id, name, age FROM users WHERE id IN (1, 2, 3) ORDER BY id;
```

## Quick Tips

✅ Use BEFORE UPDATE to fix invalid changes  
✅ Modify NEW values with SET  
✅ Can access both OLD and NEW  
❌ Don't use AFTER UPDATE (too late to change values)

## Assignment

Create a BEFORE UPDATE trigger named `tr_users_bu` on `users` that:

1. Sets `NEW.age` to **13** if it's less than 13
2. Sets `NEW.age` to **120** if it's greater than 120
3. Test with updates like 8, 150, and 35

## Stretch Goal

Do the same for the `transactions` table:
- Create `tr_transactions_bu` (BEFORE UPDATE)
- Enforce: minimum amount = 0.01, maximum amount = 10000
- Test by updating transactions to -100 and 50000
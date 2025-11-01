# BEFORE INSERT Trigger

Runs automatically **before** a new row is saved. Perfect for validating and fixing data.

## What You Can Access

- **NEW** - the row about to be inserted (you can modify it!)

## Use Case

Enforce business rules: keep transaction amounts between $0.01 and $10,000 at TheSeanApp.

## Example

```sql
-- Create trigger
DELIMITER //
DROP TRIGGER IF EXISTS tr_transactions_bi//
CREATE TRIGGER tr_transactions_bi
BEFORE INSERT ON transactions
FOR EACH ROW
BEGIN
    -- Enforce minimum: $0.01
    IF (NEW.amount < 0.01) THEN
        SET NEW.amount = 0.01;
    END IF;
    
    -- Enforce maximum: $10,000
    IF (NEW.amount > 10000) THEN
        SET NEW.amount = 10000;
    END IF;
END//
DELIMITER ;
```

## Test It

```sql
-- Try to insert invalid amounts
INSERT INTO transactions (user_id, recipient_id, note, amount, was_successful)
VALUES (1, 2, 'Too low', -50.00, true);

INSERT INTO transactions (user_id, sender_id, note, amount, was_successful)
VALUES (3, 4, 'Too high', 50000.00, true);

-- Check that amounts were corrected
SELECT id, user_id, note, amount FROM transactions ORDER BY id DESC LIMIT 2;
-- Expected: 0.01 and 10000.00
```

## Quick Tips

✅ Use BEFORE INSERT to fix invalid data  
✅ Modify NEW values directly with SET  
✅ Keep validation logic simple and fast  
❌ Don't use AFTER INSERT (too late to change values)

## Assignment

Create a BEFORE INSERT trigger named `tr_transactions_bi` on `transactions` that:

1. Sets `NEW.amount` to **0.01** if it's less than 0.01
2. Sets `NEW.amount` to **10000** if it's greater than 10000
3. Test with invalid amounts and verify they're corrected

## Stretch Goal

Do the same for the `users` table:
- Create `tr_users_bi` (BEFORE INSERT)
- Enforce: minimum age = 13, maximum age = 120
- Test with ages like 5 and 200

Hint:
Use `SIGNAL SQLSTATE '45000'`: this is for raising an error.
```sql
    -- Check if age is less than 13
    IF NEW.age < 13 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'ERROR: User age must be at least 13 years old.';
    END IF;
```

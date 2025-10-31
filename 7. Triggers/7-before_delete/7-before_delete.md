# BEFORE DELETE Trigger

Runs automatically **before** a row is deleted. Perfect for preventing unsafe deletions.

## What You Can Access

- **OLD** - the row about to be deleted (read-only)

## Use Case

Protect critical data at TheSeanApp: prevent deletion of admin users and important transactions.

## Example 1: Protect Admin Users

```sql
-- Create trigger
DELIMITER //
DROP TRIGGER IF EXISTS tr_users_bd//
CREATE TRIGGER tr_users_bd
BEFORE DELETE ON users
FOR EACH ROW
BEGIN
    IF (OLD.is_admin = true) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete admin users from TheSeanApp';
    END IF;
END//
DELIMITER ;
```

## Example 2: Protect Important Transactions

```sql
-- Create trigger
DELIMITER //
DROP TRIGGER IF EXISTS tr_transactions_bd//
CREATE TRIGGER tr_transactions_bd
BEFORE DELETE ON transactions
FOR EACH ROW
BEGIN
    IF (OLD.was_successful = true AND OLD.amount > 100) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete successful transactions over $100 for compliance reasons';
    END IF;
END//
DELIMITER ;
```

## Test It

```sql
-- See admin users
SELECT id, name, is_admin FROM users WHERE is_admin = true LIMIT 2;

-- Try to delete an admin (will fail with error message)
-- DELETE FROM users WHERE id = <admin_id>;

-- Try to delete a non-admin (will succeed)
-- DELETE FROM users WHERE id = <non_admin_id>;

-- Verify admin user still exists
SELECT id, name, is_admin FROM users WHERE id = <admin_id>;
```

## Quick Tips

✅ Use SIGNAL SQLSTATE '45000' to stop the deletion  
✅ Provide clear error messages explaining why  
✅ Good for protecting critical records  
❌ Don't use AFTER DELETE (too late to stop it)

## Assignment

Create a BEFORE DELETE trigger named `tr_transactions_bd` on `transactions` that:

1. Blocks deletion when `was_successful` is true AND `amount` > 100
2. Returns error: "Cannot delete successful transactions over $100 for compliance reasons"
3. Test by trying to delete a protected transaction

## Stretch Goal

Create a BEFORE DELETE trigger on `users` named `tr_users_bd` that:
- Blocks deletion when `is_admin` = true
- Returns error: "Cannot delete admin users from TheSeanApp"
- Test with both admin and non-admin users
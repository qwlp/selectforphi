### Lesson 7: BEFORE DELETE — Stop deletes that should not happen

What it does
- A BEFORE DELETE trigger runs right before a row is deleted.
- It’s your chance to prevent unsafe or forbidden deletions.
- You can read the row being deleted with OLD.column and, if needed, stop the delete using SIGNAL.

What you can access
- DELETE: OLD.column (the values in the row that’s about to be removed)

When to use it at TheSeanApp
- Protect admin accounts from being deleted.
- Block deletion of important transactions (e.g., successful transactions over $100).
- Enforce business rules and compliance requirements at the database layer.

Quick pattern (3 steps)
1) Decide the rule (what must never be deleted)
2) Create a BEFORE DELETE trigger on that table
3) Inside the trigger, check OLD values and use SIGNAL to stop invalid deletes

Friendly example: Protect admin users
- Goal: If the row being deleted is an admin user (is_admin = true), cancel the delete with a clear error message.



```sql
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


Another example: Protect successful transactions over $100
- Goal: If a transaction is successful and its amount is greater than 100, cancel the delete.



```sql
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


Quick test (optional)
```sql
-- 1) Try to delete something protected (expect an error)
-- DELETE FROM users WHERE id = <admin_id>;

-- 2) Try to delete something allowed (should succeed)
-- DELETE FROM users WHERE id = <non_admin_id>;

-- 3) Verify the protected record is still present
-- SELECT * FROM users WHERE id = <admin_id>;
```

Why this is useful
- You protect critical data even if someone runs a direct DELETE.
- You provide a clear, consistent error message explaining why it’s blocked.
- You enforce compliance and business rules at the database layer.

Checklists

Before you start
- Do I know the exact condition that must block deletion?
- Which table/columns hold the values I need to check?
- What error message will be most helpful to the user?

Writing the trigger
- Use BEFORE DELETE (so you can stop the operation).
- Use OLD.column to check the row about to be deleted.
- Use SIGNAL SQLSTATE '45000' with a clear MESSAGE_TEXT.

Testing the trigger
- Try deleting a row that should be blocked (verify the error and message).
- Try deleting a row that should be allowed (verify it succeeds).
- Confirm the protected row still exists after the failed delete.

Common mistakes to avoid
- Using AFTER DELETE (too late to stop the deletion).
- Forgetting to use SIGNAL (your trigger will not stop the operation).
- Missing the custom DELIMITER when creating the trigger.
- Writing vague error messages that don’t explain the reason.

Assignment
- Create a BEFORE DELETE trigger on the transactions table named tr_transactions_bd that:
  - Blocks deletion when was_successful is true AND amount > 100
  - Returns this error: "Cannot delete successful transactions over $100 for compliance reasons"

Stretch goal
- Create a BEFORE DELETE trigger on users named tr_users_bd that:
  - Blocks deletion when is_admin = true
  - Returns this error: "Cannot delete admin users from TheSeanApp"
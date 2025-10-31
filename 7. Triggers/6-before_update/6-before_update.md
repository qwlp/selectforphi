### Lesson 6: BEFORE UPDATE — Keep updates clean and within rules

What it does
- Runs automatically right before an existing row is saved with new values.
- Lets you validate and fix incoming updates.
- You can read OLD.column and NEW.column, and you can modify NEW.column.

What you can access
- UPDATE: OLD.column (before the change) and NEW.column (after the change, about to be saved)

When to use it at TheSeanApp
- Enforce rules on updates (e.g., user ages must be reasonable)
- Normalize or correct values before they hit the table
- Prevent invalid data from being saved without blocking the whole update

Quick pattern (3 steps)
1) Define the rules for what’s valid
2) Create a BEFORE UPDATE trigger on the target table
3) In the trigger, adjust NEW values that violate the rules

Example: Validate user age on updates (TheSeanApp)
Goal: Keep user age between 13 and 120 (inclusive)
- If age < 13 → set to 13
- If age > 120 → set to 120

```sql
-- BEFORE UPDATE: Fix out-of-range user ages
DELIMITER //

CREATE TRIGGER tr_users_bu
BEFORE UPDATE ON users
FOR EACH ROW
BEGIN
  -- Minimum: 13 (COPPA compliance)
  IF (NEW.age < 13) THEN
    SET NEW.age = 13;
  END IF;

  -- Maximum: 120 (data quality)
  IF (NEW.age > 120) THEN
    SET NEW.age = 120;
  END IF;
END//

DELIMITER ;
```

Quick test (optional)
```sql
-- See current ages for a few users
SELECT id, name, age FROM users WHERE id IN (1, 2, 3) ORDER BY id;

-- Try invalid updates
UPDATE users SET age = 8   WHERE id = 1;   -- should end up as 13
UPDATE users SET age = 150 WHERE id = 2;   -- should end up as 120
UPDATE users SET age = 35  WHERE id = 3;   -- valid, should stay 35

-- Verify results
SELECT id, name, age FROM users WHERE id IN (1, 2, 3) ORDER BY id;
```

Checklists

Before you start
- Do I know the exact rules I want to enforce?
- Am I updating the correct table and columns?
- Do I need to handle NULLs?

Writing the trigger
- Use BEFORE UPDATE so you can modify NEW values
- Keep logic simple and fast
- Only change what you must

Testing the trigger
- Test values below the minimum and above the maximum
- Test valid values to ensure they don’t change
- Verify results with a simple SELECT

Common mistakes to avoid
- Using AFTER UPDATE (too late to change values)
- Forgetting the custom DELIMITER when creating the trigger
- Overwriting values that are already valid

Assignment
- Create the BEFORE UPDATE trigger tr_users_bu on users that:
  - Sets NEW.age to 13 if it’s less than 13
  - Sets NEW.age to 120 if it’s greater than 120
- Test with a few UPDATE statements and confirm the results with SELECT.

Stretch goal
- Do the same for the transactions table:
  - Create tr_transactions_bu (BEFORE UPDATE) that enforces:
    - Minimum amount = 0.01
    - Maximum amount = 10000
  - Test by updating transactions to invalid amounts and verify they are corrected.
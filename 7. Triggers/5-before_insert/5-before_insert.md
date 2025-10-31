### Lesson 5: BEFORE INSERT — Check and fix data before it’s saved

What it does
- Runs automatically right before a new row is written to a table.
- Lets you validate and correct the incoming values.
- You can read and change NEW.column values here.

What you can access
- INSERT: NEW.column (the data being inserted)

When to use it at TheSeanApp
- Enforce business rules on incoming data (e.g., valid transaction amounts).
- Clean up or normalize values before they hit the table.

Concrete rule we’ll use in this lesson
- For transactions, the amount must be between $0.01 and $10,000.
  - If amount < 0.01 → set it to 0.01
  - If amount > 10000 → set it to 10000


Quick pattern (3 steps)
1) Decide on the rules (what’s allowed vs not allowed)
2) Create a BEFORE INSERT trigger on the target table
3) In the trigger, adjust NEW values that violate the rules


Example: Validate transaction amounts (TheSeanApp)
- Table: transactions
- Goal: Make sure the amount is always between 0.01 and 10000

```sql
-- BEFORE INSERT: Fix out-of-range amounts
DELIMITER //
DROP TRIGGER IF EXISTS tr_transactions_bi//
CREATE TRIGGER tr_transactions_bi
BEFORE INSERT ON transactions
FOR EACH ROW
BEGIN
  -- Minimum: $0.01
  IF (NEW.amount < 0.01) THEN
    SET NEW.amount = 0.01;
  END IF;

  -- Maximum: $10,000
  IF (NEW.amount > 10000) THEN
    SET NEW.amount = 10000;
  END IF;
END//

DELIMITER ;
```

Quick test (optional)
```sql
-- 1) Try to insert invalid amounts
INSERT INTO transactions (user_id, recipient_id, note, amount, was_successful)
VALUES (1, 2, 'Too low', -50.00, true);

INSERT INTO transactions (user_id, sender_id, note, amount, was_successful)
VALUES (3, 4, 'Too high', 50000.00, true);

-- 2) Verify the amounts were corrected
SELECT id, user_id, note, amount
FROM transactions
ORDER BY id DESC
LIMIT 2;
-- Expect: 0.01 for the first, 10000.00 for the second
```

Common mistakes
- Using AFTER INSERT (too late to change values) — use BEFORE INSERT instead.
- Forgetting to handle both ends of the range (min and max).
- Missing the custom delimiter when creating the trigger.


Assignment
- Create the BEFORE INSERT trigger `tr_transactions_bi` on `transactions` that:
  - Sets NEW.amount to 0.01 if it’s less than 0.01
  - Sets NEW.amount to 10000 if it’s greater than 10000
- Test by inserting a few rows that break the rules, then SELECT to confirm they were fixed.

Stretch goal
- Do the same for the `users` table:
  - Create `tr_users_bi` (BEFORE INSERT) that enforces:
    - Minimum age = 13
    - Maximum age = 120
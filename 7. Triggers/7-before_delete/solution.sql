-- Solution for Lesson 7: BEFORE DELETE Trigger on transactions table

-- Create the BEFORE DELETE trigger
DELIMITER //

CREATE TRIGGER tr_transactions_bd
BEFORE DELETE ON transactions
FOR EACH ROW
BEGIN
    -- Prevent deletion of successful transactions over $100
    IF (OLD.was_successful = true AND OLD.amount > 100) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete successful transactions over $100 for compliance reasons';
    END IF;
END//

DELIMITER ;

-- Test the trigger with various scenarios

-- First, let's see what transactions we have
SELECT id, user_id, amount, was_successful, note
FROM transactions
WHERE amount > 100 OR amount < 10
ORDER BY amount;

-- Test 1: Try to delete a successful transaction over $100 (should FAIL)
-- This should trigger an error
-- DELETE FROM transactions WHERE id = 3 AND was_successful = true AND amount > 100;

-- Test 2: Delete an unsuccessful transaction over $100 (should SUCCEED)
-- This should work because was_successful = false
-- DELETE FROM transactions WHERE id = 5 AND was_successful = false AND amount > 100;

-- Test 3: Delete a successful transaction under $100 (should SUCCEED)
-- This should work because amount is under $100
-- DELETE FROM transactions WHERE id = 1 AND was_successful = true AND amount < 100;

-- Test 4: Delete an unsuccessful transaction under $100 (should SUCCEED)
-- This should work because it doesn't meet the protection criteria
-- DELETE FROM transactions WHERE id = 2 AND was_successful = false;

-- Note: Uncomment the DELETE statements above one at a time to test each scenario

-- Expected behavior:
-- Test 1: ERROR - "Cannot delete successful transactions over $100 for compliance reasons"
-- Test 2: SUCCESS - Record deleted (unsuccessful transaction)
-- Test 3: SUCCESS - Record deleted (amount under $100)
-- Test 4: SUCCESS - Record deleted (unsuccessful transaction)

-- To verify which transactions are protected:
SELECT id, user_id, amount, was_successful, note
FROM transactions
WHERE was_successful = true AND amount > 100;

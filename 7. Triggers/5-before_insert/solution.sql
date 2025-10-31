-- Solution for Lesson 5: BEFORE INSERT Trigger on transactions table

-- Create the BEFORE INSERT trigger
DELIMITER //

CREATE TRIGGER tr_transactions_bi
BEFORE INSERT ON transactions
FOR EACH ROW
BEGIN
    -- Ensure minimum transaction amount is $0.01
    IF (NEW.amount < 0.01) THEN
        SET NEW.amount = 0.01;
    END IF;

    -- Ensure maximum transaction amount is $10,000
    IF (NEW.amount > 10000) THEN
        SET NEW.amount = 10000;
    END IF;
END//

DELIMITER ;

-- Test the trigger with various scenarios

-- Test 1: Insert a transaction with negative amount (should be corrected to 0.01)
INSERT INTO transactions (user_id, recipient_id, note, amount, was_successful)
VALUES (1, 2, 'Test negative amount', -50.00, true);

-- Test 2: Insert a transaction with zero amount (should be corrected to 0.01)
INSERT INTO transactions (user_id, sender_id, note, amount, was_successful)
VALUES (3, 4, 'Test zero amount', 0.00, true);

-- Test 3: Insert a transaction with amount over $10,000 (should be corrected to 10000)
INSERT INTO transactions (user_id, recipient_id, note, amount, was_successful)
VALUES (5, 6, 'Test excessive amount', 50000.00, true);

-- Test 4: Insert a valid transaction (should not be modified)
INSERT INTO transactions (user_id, sender_id, note, amount, was_successful)
VALUES (7, 8, 'Valid transaction', 125.50, true);

-- Verify the results
SELECT id, user_id, note, amount, was_successful
FROM transactions
ORDER BY id DESC
LIMIT 4;

-- Expected output:
-- The first transaction should have amount = 0.01 (not -50.00)
-- The second transaction should have amount = 0.01 (not 0.00)
-- The third transaction should have amount = 10000.00 (not 50000.00)
-- The fourth transaction should have amount = 125.50 (unchanged)

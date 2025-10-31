-- Solution for Lesson 4: AFTER UPDATE Trigger on transactions table

-- Create the AFTER UPDATE trigger
DELIMITER //

CREATE TRIGGER tr_transactions_au
AFTER UPDATE ON transactions
FOR EACH ROW
BEGIN
    SET @change_msg = CONCAT('Updated transaction ', OLD.id);

    IF (OLD.amount != NEW.amount) THEN
        SET @change_msg = CONCAT(@change_msg, '. Amount changed from ', OLD.amount, ' to ', NEW.amount);
    END IF;

    IF (OLD.was_successful != NEW.was_successful) THEN
        SET @change_msg = CONCAT(@change_msg, '. Status changed from ', OLD.was_successful, ' to ', NEW.was_successful);
    END IF;

    INSERT INTO transaction_audit (audit_datetime, audit_user, audit_change)
    VALUES (NOW(), USER(), @change_msg);
END//

DELIMITER ;

-- Test the trigger by updating a transaction
-- First, let's see what transactions exist
SELECT id, amount, was_successful FROM transactions LIMIT 5;

-- Update a transaction's amount
UPDATE transactions
SET amount = 15.75
WHERE id = 1;

-- Update a transaction's status
UPDATE transactions
SET was_successful = true
WHERE id = 5;

-- Update both fields at once
UPDATE transactions
SET amount = 25.00, was_successful = false
WHERE id = 2;

-- Verify the audit log was created
SELECT * FROM transaction_audit;

-- Expected output: Three audit records showing each update with specific changes logged

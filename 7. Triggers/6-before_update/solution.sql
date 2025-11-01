DELIMITER //

CREATE TRIGGER tr_transactions_bu
BEFORE UPDATE ON transactions
FOR EACH ROW
BEGIN
    -- Check if amount is less than 0.01
    IF NEW.amount < 0.01 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'ERROR: Transaction amount must be at least 0.01.';
    END IF;

    -- Check if amount is greater than 10000
    IF NEW.amount > 10000 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'ERROR: Transaction amount cannot exceed 10000.';
    END IF;
END//

DELIMITER ;

INSERT INTO transactions (user_id, recipient_id, sender_id, amount, was_successful) VALUES (105, 205, 305, 50.00, 1);

UPDATE transactions SET amount = -100 WHERE id = 1;
UPDATE transactions SET amount = 50000 WHERE id = 1;
UPDATE transactions SET amount = 5.00 WHERE id = 1;

SELECT id, amount FROM transactions WHERE id = 1;

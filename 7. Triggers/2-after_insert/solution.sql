-- solution
CREATE TABLE transaction_audit (
    id INT AUTO_INCREMENT PRIMARY KEY,
    transaction_id INT NOT NULL,
    user_id INT NOT NULL,
    amount INT NOT NULL,
    note VARCHAR(255) NOT NULL,
    change_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //

CREATE TRIGGER tr_transactions_ai
AFTER INSERT ON transactions
FOR EACH ROW
BEGIN
    INSERT INTO transaction_audit (transaction_id, user_id, amount, note)
    VALUES (
        NEW.id,
        NEW.user_id,
        NEW.amount,
        IFNULL(NEW.note, 'No note provided')
    );
END//

DELIMITER ;


-- test it
-- with note

INSERT INTO transactions (user_id, recipient_id, sender_id, note, amount, was_successful) VALUES (101, 201, 301, 'Payment for services', 500, 1);

-- with no note

INSERT INTO transactions (user_id, recipient_id, sender_id, amount, was_successful) VALUES (102, 202, 302, 75, 1);

-- verify 

SELECT transaction_id, user_id, amount, note FROM transaction_audit;

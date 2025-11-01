DELIMITER //

CREATE TRIGGER tr_transactions_ad
AFTER DELETE ON transactions
FOR EACH ROW
BEGIN
    INSERT INTO transaction_audit (transaction_id, user_id, amount, note)
    VALUES (
        OLD.id,
        OLD.user_id,
        OLD.amount,
        'Transaction deleted'
    );
END//

DELIMITER ;

DELETE FROM transactions WHERE id = 1;
SELECT transaction_id, user_id, amount, note FROM transaction_audit WHERE note = 'Transaction deleted';

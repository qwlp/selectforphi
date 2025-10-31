CREATE VIEW v_transactions_successful AS
SELECT id, user_id, amount, note
FROM transactions
WHERE was_successful = true;

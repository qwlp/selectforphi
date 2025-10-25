-- Select all users and their matching transactions (LEFT JOIN part)
SELECT
    u.name AS user_name,
    t.id AS transaction_id,
    t.amount AS transaction_amount
FROM
    users u
LEFT JOIN
    transactions t ON u.id = t.user_id

UNION

-- Select all transactions and their matching users, ensuring transactions without a user are included (RIGHT JOIN part)
SELECT
    u.name AS user_name,
    t.id AS transaction_id,
    t.amount AS transaction_amount
FROM
    users u
RIGHT JOIN
    transactions t ON u.id = t.user_id
-- The WHERE clause is crucial: it filters out the rows that were already included by the LEFT JOIN,
-- keeping only the unmatched rows from the 'transactions' table (where u.name IS NULL).
WHERE
    u.name IS NULL;

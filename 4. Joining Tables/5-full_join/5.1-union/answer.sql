SELECT
    u.name AS user_name,
    t.id AS transaction_id,
    t.amount AS transaction_amount
FROM
    users u
LEFT JOIN
    transactions t ON u.id = t.user_id

UNION

SELECT
    u.name AS user_name,
    t.id AS transaction_id,
    t.amount AS transaction_amount
FROM
    users u
RIGHT JOIN
    transactions t ON u.id = t.user_id
WHERE
    u.name IS NULL;

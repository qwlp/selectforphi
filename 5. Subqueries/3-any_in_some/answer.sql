SELECT name, username
FROM users
WHERE id = ANY (
  SELECT recipient_id
  FROM transactions
  WHERE amount >= 50
);

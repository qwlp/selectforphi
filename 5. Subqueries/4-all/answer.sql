SELECT name, age, username
FROM users
WHERE age < ALL (
  SELECT age
  FROM users
  WHERE country_code = 'BR'
);

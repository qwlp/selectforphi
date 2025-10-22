SELECT
    u1.name AS User1Name,
    u2.name AS User2Name,
    u1.age
FROM
    users AS u1
INNER JOIN
    users AS u2
ON
    u1.age = u2.age AND
    u1.country_code = u2.country_code AND
    u1.id < u2.id;

SELECT
    u.name AS UserName,
    c.name AS CountryName
FROM
    users AS u
CROSS JOIN
    countries AS c;

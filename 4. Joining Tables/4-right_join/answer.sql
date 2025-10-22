SELECT
    c.name AS CountryName,
    u.name AS UserName
FROM
    users AS u
RIGHT JOIN
    countries AS c
ON
    u.country_code = c.country_code;

SELECT COUNT(bweek) FROM
(SELECT DAYOFWEEK(CONCAT(YEAR(NOW()), DATE_FORMAT(birth_date, '-%m-%d'))) as bweek FROM users) as tmp
GROUP BY bweek;
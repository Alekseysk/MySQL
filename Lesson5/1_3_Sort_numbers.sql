SELECT `value` FROM
(SELECT `value`, `value` = 0 AS `zerocomp` FROM storehouses_products
ORDER BY `zerocomp`, `value` ASC) AS tmp;
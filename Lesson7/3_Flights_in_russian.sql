SELECT id AS 'Номер рейса',
	(SELECT `name` FROM cities WHERE flights.`from` = cities.label) AS 'Вылет',
	(SELECT `name` FROM cities WHERE flights.`to` = cities.label) AS 'Прилёт'
FROM flights;
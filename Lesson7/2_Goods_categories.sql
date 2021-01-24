SELECT id, `name`,
	(SELECT `name` FROM catalogs WHERE products.catalog_id = catalogs.id) AS category
FROM products;
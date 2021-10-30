# 1. Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.
SELECT `id`, `name` FROM `users` WHERE `id` IN (SELECT DISTINCT `user_id` FROM `orders`);

# 2. Выведите список товаров products и разделов catalogs, который соответствует товару.
SELECT `pr`.id, `pr`.name, `pr`.price, `c`.name FROM `products` `pr` LEFT JOIN `catalogs` `c` ON `pr`.catalog_id = `c`.id;

# 3. (по желанию) Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). Поля from, to и label 
# содержат английские названия городов, поле name — русское. Выведите список рейсов flights с русскими названиями городов.
SELECT `flights`.id, `cities_from`.name AS `city_departure`, `cities_to`.name AS `city_arrival` FROM `flights` LEFT JOIN 
`cities` AS `cities_from` ON `flights`.from = `cities_from`.label LEFT JOIN `cities` AS `cities_to` ON `flights`.to = `cities_to`.label;
# Транзакции, переменные, представления
# 1. В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных. 
# Переместите запись id = 1 из таблицы shop.users в таблицу sample.users. Используйте транзакции.
START TRANSACTION;
INSERT INTO `sample`.users SELECT * FROM `shop`.users WHERE `id` = 1;
COMMIT;

# 2. Создайте представление, которое выводит название name товарной позиции из таблицы products и 
# соответствующее название каталога name из таблицы catalogs.
CREATE VIEW `products_catalog` AS SELECT `products`.name AS `product_name`, `catalogs`.name AS `catalog_name`
FROM `products` INNER JOIN `catalogs` ON `products`.catalog_id = `catalogs`.id;


# Администрирование MySQL
# 1. Создайте двух пользователей которые имеют доступ к базе данных shop. Первому пользователю shop_read должны быть доступны только запросы 
# на чтение данных, второму пользователю shop — любые операции в пределах базы данных shop.
CREATE USER "shop_reader"@"localhost" IDENTIFIED WITH sha256_password BY "password";
GRANT SELECT ON `shop`.* TO "shop_reader"@"localhost";

CREATE USER "shop"@"localhost" IDENTIFIED WITH sha256_password BY "password";
GRANT ALL ON `shop`.* TO "shop"@"localhost";
GRANT GRANT OPTION ON `shop`.* TO "shop"@"localhost";

# 2. (по желанию) Пусть имеется таблица accounts содержащая три столбца id, name, password, содержащие первичный ключ, имя пользователя и 
# его пароль. Создайте представление username таблицы accounts, предоставляющий доступ к столбца id и name. Создайте пользователя user_read, 
# который бы не имел доступа к таблице accounts, однако, мог бы извлекать записи из представления username.
CREATE VIEW `username` AS SELECT `id` AS `user_id`, `name` AS `usr_name` FROM `accounts`;
DROP USER IF EXISTS "user_read"@"localhost";
CREATE USER "user_read"@"localhost" IDENTIFIED WITH sha256_password BY "password";
GRANT SELECT ON `shop`.`username` TO "user_read"@"localhost";


# Хранимые процедуры и функции, триггеры
# 1. Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от текущего времени суток. 
# С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", с 12:00 до 18:00 функция должна возвращать фразу "Добрый день", 
# с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".
DELIMITER //
CREATE FUNCTION hello()
RETURNS VARCHAR(255) DETERMINISTIC
BEGIN
	IF CURTIME() BETWEEN "00:00:00" AND "06:00:00" THEN
		RETURN "Доброй ночи";
	ELSEIF  CURTIME() BETWEEN "05:59:59" AND "12:00:00" THEN
		RETURN "Доброе утро";
	ELSEIF  CURTIME() BETWEEN "11:59:59" AND "18:00:00" THEN
		RETURN "Добрый день";
	ELSEIF  CURTIME() BETWEEN "17:59:59" AND "00:00:01" THEN
		RETURN "Добрый вечер";
	END IF;
END//
DELIMITER ;

# 2. В таблице products есть два текстовых поля: name с названием товара и description с его описанием. Допустимо присутствие обоих полей 
# или одно из них. Ситуация, когда оба поля принимают неопределенное значение NULL неприемлема. Используя триггеры, добейтесь того, чтобы 
# одно из этих полей или оба поля были заполнены. При попытке присвоить полям NULL-значение необходимо отменить операцию.
DELIMITER //
CREATE TRIGGER `nullTrigger` BEFORE INSERT ON `products`
FOR EACH ROW
BEGIN
	IF(ISNULL(NEW.name) AND ISNULL(NEW.description)) THEN
		SIGNAL SQLSTATE "45000" SET MESSAGE_TEXT = "Trigger Warning! NULL в обоих полях!";
	END IF;
END //
DELIMITER ;
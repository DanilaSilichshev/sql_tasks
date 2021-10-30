# 1. Пусть задан некоторый пользователь. Из всех пользователей соц. сети найдите человека, который 
# больше всех общался с выбранным пользователем (написал ему сообщений).
SET @current_user_id := 1;
SELECT CONCAT(`lastname`," ",`firstname`) AS `User Full name`, `from_user_id`, COUNT(*) AS `Messages quantity` FROM `messages` 
JOIN `users` ON `messages`.from_user_id = `users`.id WHERE `to_user_id` = @current_user_id GROUP BY `from_user_id` 
ORDER BY `Messages quantity` DESC LIMIT 1;

# 2. Подсчитать общее количество лайков, которые получили пользователи младше 10 лет.
SELECT COUNT(*) AS `Total likes` FROM `likes` `l` JOIN `media` `m` ON `l`.media_id = `m`.id JOIN
`profiles` `pr` ON  `m`.user_id = `pr`.user_id WHERE YEAR(NOW())-YEAR(`birthday`) < 10;

# 3. Определить кто больше поставил лайков (всего): мужчины или женщины.
SELECT IF(`gender` = 'm','мужской',IF(`gender` = 'f','женский','x')) AS `gender`, COUNT(*) AS `Gender likes` FROM `likes` 
JOIN `profiles` ON `likes`.user_id = `profiles`.user_id GROUP BY `gender` ORDER BY `Gender likes` DESC LIMIT 1;

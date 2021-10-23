# 1. Пусть задан некоторый пользователь. Из всех пользователей соц. сети найдите человека, который 
# больше всех общался с выбранным пользователем (написал ему сообщений).
SET @current_user_id := 1;
SELECT (SELECT CONCAT(`lastname`," ",`firstname`) FROM `users` WHERE `users`.id = `from_user_id`) AS `User Full name`, `from_user_id`, 
COUNT(*) AS `Messages quantity` FROM `messages` WHERE `to_user_id` = @current_user_id GROUP BY `from_user_id` 
ORDER BY `Messages quantity` DESC LIMIT 1;

# 2. Подсчитать общее количество лайков, которые получили пользователи младше 10 лет.
SELECT COUNT(*) AS `Total likes` FROM `likes` WHERE `media_id` IN (SELECT `id` FROM `media` WHERE `user_id` IN 
(SELECT `user_id` FROM `profiles` WHERE (YEAR(NOW())-YEAR(`birthday`)) < 10));

# 3. Определить кто больше поставил лайков (всего): мужчины или женщины.
 SELECT (SELECT IF(`gender` = 'm','мужской',IF(`gender` = 'f','женский','x')) FROM `profiles` WHERE `user_id` = `likes`.user_id) AS `gender`, 
 COUNT(*) AS `Gender likes` FROM `likes` GROUP BY `gender` ORDER BY `Gender likes` DESC LIMIT 1;

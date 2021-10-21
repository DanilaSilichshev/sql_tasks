# i. Заполнить все таблицы БД vk данными (по 10-20 записей в каждой таблице)
# ii. Написать скрипт, возвращающий список имен (только firstname) пользователей без повторений в алфавитном порядке
# iii. Написать скрипт, отмечающий несовершеннолетних пользователей как неактивных (поле is_active = false). Предварительно добавить такое поле в таблицу profiles со значением по умолчанию = true (или 1)
# iv. Написать скрипт, удаляющий сообщения «из будущего» (дата больше сегодняшней)
# v. Написать название темы курсового проекта (в комментарии)

# Task 1
INSERT INTO `users` VALUES (DEFAULT,'Evalyn','Kessler','aufderhar.angie@example.com','2229243a3b603e83481c9d22699b5bcebadf15e7',520485),
(DEFAULT,'Patricia','Beier','johnpaul98@example.net','14e7867a416ccb8ab4acaa58e6c66343a19dd864',
501917),(DEFAULT,'Augustus','Simonis','barton.murray@example.org',
'73c5adc86d0d5e66264a5c4b2641a97b36129db7',331951),(DEFAULT,'Imelda','Ferry','lind.obie@example.com',
'11b6c492e812aa5788ff2ca9b140aeff4ae5bac0',944520),(DEFAULT,'Destany','Mosciski','acrooks@example.net',
'08ff2f330d4b2ce94b276820f6e881cd52451eac',505329),(DEFAULT,'Nicholaus','Schuppe',
'lisandro31@example.org','fbe6030da2bd2ff6dc26b73470ebf8a796498e0f',504255),(DEFAULT,'Abagail','Howe',
'matteo39@example.net','273e220cadded2d031afa989cbf493a0f682c4d1',101756),(DEFAULT,'Derick','Hane',
'nico21@example.com','61bb4c75acc184e3a3c8cabd08681ff6c9fb4bab',278281),(DEFAULT,'Teagan','Glover',
'klein.kristoffer@example.net','cfb2f19d19eefe9f746013dd1bcc67cfc9ede970',628442),(DEFAULT,'Ward',
'Gaylord','renner.waylon@example.net','c4b6ae0c746c22f7e2e705ae326369883e2b8d6e',525066),
(DEFAULT,'Maiya','Hackett','hilton35@example.org','904fd9c442c350e458c9524ec3eb3cfe2ef9ebc6',947287),
(DEFAULT,'Agustin','Schuppe','dejah.bartoletti@example.com','ae80f3afe73481fe907ef9418c9edca2654fbef5',138722),
(DEFAULT,'Leif','Halvorson','katharina.dietrich@example.net','3242963059547b21ed1fe0e78ae3efc8dbc74a30',671623);

INSERT INTO `media_types` VALUES (DEFAULT, "audio", DEFAULT, DEFAULT), (DEFAULT, "video", DEFAULT, DEFAULT), (DEFAULT, "photo", DEFAULT, DEFAULT);

SET FOREIGN_KEY_CHECKS=0;
INSERT INTO `messages` (`from_user_id`, `to_user_id`, `body`, `created_at`) VALUES (8,7,"Привет, мир!", DEFAULT), 
(1,3,"Как дела?","2020-11-13 15:31:10"), (11,2,"Lorem Ipsum is simply dummy text of the printing and typesetting industry.", "2111-12-07 16:16:27"),
(5,4,"Я из будущего!", "2022-11-13 15:06:20"), (7,8,"Хай","2021-01-07 16:16:27"), (3,2,"Понятно","2021-02-07 16:16:27"), (11,2,"Я из будущего!","2021-03-07 16:16:27"),
(12,6,"?!", "2021-04-07 16:16:27"), (2,13,"Рад знакомству","2021-05-07 16:16:27"), (4,9,"Ура","2021-06-07 16:16:27"), 
(10,2,"Hello!","2021-07-07 16:16:27"), (1,3,"Почему ты не ответил?","2021-12-07 16:16:27"), 
(7,10,"Да","2021-08-07 16:16:27"), (8,9,"Пока","2021-09-07 16:16:27"), (5,6,"Во сколько?","2021-10-07 16:16:27");

INSERT INTO `photo_albums` (`name`, `user_id`) VALUES ("Коллекция",10), ("Мои фото",9), ("Путешествия",8), ("Природа",7),
("Семья",6), ("Друзья",5), ("Мой кот",4), ("Осень 2021",3), ("2020",2), ("Галерея",1);

INSERT INTO `communities` (`name`,`admin_user_id`) VALUES ("Школа 32",3), ("Выпуск 2016",6),("Основы SQL",9), ("Пайтонисты",10), 
("Победа",6), ("Сlassic music",2), ("Lost",3),  ("Piano club",6), ("Всё о дайвинге",7),  ("Django 3",1);

INSERT INTO `users_communities` VALUES (13,1),(12,4), (11,2), (9,8), (8,5), (7,2), (6,9), (5,10), (4,3), (3,2), 
(2,6), (1,8), (5,1), (3,9), (8,3), (12,7), (1,4), (7,8);

INSERT INTO `friend_requests` VALUES (1,2,"requested","2021-09-07 16:16:27", DEFAULT),
(5,9,"approved","2021-08-07 16:16:27",DEFAULT), (9,8,"declined","2021-08-07 16:16:27","2021-09-07 17:16:27"),
(1,6,"unfriended","2021-05-07 16:16:27",DEFAULT),(2,11,"approved","2021-04-07 16:16:27","2021-09-07 16:20:27"), 
(8,10,"requested","2021-06-07 16:16:27",DEFAULT), (10,13,"approved","2021-03-07 16:16:30",DEFAULT),
(3,4,"declined","2021-05-07 16:16:27",DEFAULT), (4, 11,"unfriended","2021-02-07 16:16:27","2021-09-10 16:16:27"), 
(13,5,"requested","2021-02-07 16:16:27",DEFAULT);

INSERT INTO `media` VALUES (DEFAULT,3,1, "Описание фото","file1.png",2, NULL,"2020-01-03 15:00:00",DEFAULT),
(DEFAULT,3,2, "Описание фото","file2.png",2, NULL,"2020-01-03 15:00:00",DEFAULT),
(DEFAULT,3,3, "Описание фото","file3.png",3, NULL,"2020-01-03 16:00:00",DEFAULT),
(DEFAULT,3,4, "Описание фото","file4.png",4, NULL,"2020-01-03 17:00:00",DEFAULT),
(DEFAULT,3,5, "Описание фото","file5.png",5, NULL,"2020-01-03 12:00:00",DEFAULT),
(DEFAULT,3,6, "Описание фото","file6.png",2, NULL,"2020-01-03 11:00:00",DEFAULT),
(DEFAULT,3,7, "Описание фото","file7.png",2, NULL,"2020-01-03 09:00:00",DEFAULT),
(DEFAULT,3,8, "Описание фото","file8.png",9, NULL,"2020-01-03 20:00:00",DEFAULT),
(DEFAULT,3,9, "Описание фото","file9.png",2, NULL,"2020-01-03 23:00:00",DEFAULT),
(DEFAULT,3,10, "Описание фото","file10.png",3, NULL,"2020-01-03 07:00:00",DEFAULT),
(DEFAULT,3,11, "Описание фото","file11.png",1, NULL,"2020-01-03 02:00:00",DEFAULT),
(DEFAULT,3,12, "Описание фото","file12.png",2, NULL,"2020-01-03 01:00:00",DEFAULT),
(DEFAULT,3,13, "Описание фото","file13.png",4, NULL,"2020-01-03 05:00:00",DEFAULT);

INSERT INTO `profiles` VALUES (1, "f", "2000-04-03", 1, "2020-01-03 15:00:00","Los-Angeles"),
(2, "f", "2000-08-08", 2, "2020-01-03 15:00:00","Washington"),
(3, "m", "1997-05-23", 3, "2020-01-03 16:00:00","Saint-Petersburg"),
(4, "f", "2001-01-14", 4, "2020-01-03 17:00:00","London"),
(5, "m", "2002-10-18", 5, "2020-01-03 13:00:00","Los-Angeles"),
(6, "m", "2001-04-26", 6, "2020-01-03 11:00:00","Saint-Petersburg"),
(7, "m", "2003-08-19", 7, "2020-01-03 09:00:00","London"),
(8, "m", "2002-12-05", 8, "2020-01-03 20:00:00","Los-Angeles"),
(9, "m", "1999-02-01", 9, "2020-01-03 23:00:00","Washington"),
(10, "m", "2005-11-09", 10, "2020-01-03 07:00:00","Saint-Petersburg"),
(11, "f", "2006-06-08", 11, "2020-01-03 02:00:00","Singapore"),
(12, "m", "1998-05-11", 12, "2020-01-03 01:00:00","Moscow"),
(13, "m", "2000-03-29", 13, "2020-01-03 05:00:00","London");

INSERT INTO `likes` (`user_id`, `media_id`, `created_at`) VALUES (1,1,"2021-01-03 15:00:00"),
(2,6,"2021-01-04 15:00:00"), (3,3,"2021-02-03 15:00:00"), (5,4,"2021-01-03 19:00:00"),
(7,6,"2021-10-03 15:00:00"), (9,8,"2021-01-25 15:00:00"), (10,10,"2021-01-03 08:00:00"),
(11,13,"2021-09-03 15:00:00"), (12,6,"2021-01-04 15:00:00"), (13,2,"2021-11-11 15:00:00");

INSERT INTO `photos` (`album_id`, `media_id`) VALUES (2,1), (11,7), (13,2),
(5,8), (2,3), (3,4), (8,6), (12,5), (4,9), (10,10);

# Task 2
SELECT DISTINCT `firstname` FROM `users` ORDER BY `firstname`; 

# Task 3
ALTER TABLE `profiles` ADD COLUMN `is_active` TINYINT(1) DEFAULT 1;
SET SQL_SAFE_UPDATES = 0;
UPDATE `profiles` SET `is_active` = 0 WHERE TIMESTAMPDIFF(YEAR, `birthday`, NOW()) < 18;

# Task 4
DELETE FROM `messages` WHERE `created_at` > NOW();

# Task 5
# Тема курсового проекта "Описание модели хранения данных онлайн-площадки для 
# размещения и поиска краткосрочной аренды частного жилья по всему миру Airbnb"


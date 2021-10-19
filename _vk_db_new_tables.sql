# Таблица parents, которая содержит информацию о родственных связях пользователей соц. сети 
# (по сути добавление к таблице profiles - связь "один к одному")
CREATE TABLE IF NOT EXISTS `parents`(
	`for_whom_user_id` BIGINT UNSIGNED NOT NULL COMMENT 'Чей родственник',
    `parent_user_id` BIGINT UNSIGNED NOT NULL,
    `parent_status` ENUM('Дедушка/Бабушка', 'Отец/Мать', 'Брат/Сестра', 'Сын/Дочь', 'Внук/Внучка'),
    PRIMARY KEY (`for_whom_user_id`, `parent_user_id`), 
    FOREIGN KEY (`for_whom_user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY (`parent_user_id`) REFERENCES `users`(`id`)
); # родственники

# Таблица conversations, которая содержит общую информацию о беседах в соц. сети
CREATE TABLE IF NOT EXISTS `conversations`(
	`id` SERIAL PRIMARY KEY,
    `name` VARCHAR(100),
	`photo_id` BIGINT UNSIGNED NULL,
    `created_by_id` BIGINT UNSIGNED NOT NULL COMMENT 'ID создателя',
    `created_at` DATETIME DEFAULT NOW(),
    `updated_at` DATETIME ON UPDATE CURRENT_TIMESTAMP,
    INDEX `conversations_name_idx`(`name`),
    FOREIGN KEY (`created_by_id`) REFERENCES `users`(`id`),
    FOREIGN KEY (`photo_id`) REFERENCES `media`(`id`)
);

# Таблица conversations, которая содержит информацию об участниках бесед (связь один к многим)
CREATE TABLE IF NOT EXISTS `conversations_members`(
	`id` SERIAL PRIMARY KEY,
	`conversation_id` BIGINT UNSIGNED NOT NULL,
    `member_id` BIGINT UNSIGNED NOT NULL,
	`member_status` TINYINT(1) UNSIGNED COMMENT 'Cтатус пользователя: 1 - участвует в беседе, 0 - покинул её',
    `created_at` DATETIME DEFAULT NOW(),
    `updated_at` DATETIME ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (`conversation_id`) REFERENCES `conversations`(`id`),
    FOREIGN KEY (`member_id`) REFERENCES `users`(`id`)
);

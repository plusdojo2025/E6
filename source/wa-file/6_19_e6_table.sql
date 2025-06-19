-- --------------------------------------------------------
-- ホスト:                          127.0.0.1
-- サーバーのバージョン:                   8.0.26 - MySQL Community Server - GPL
-- サーバー OS:                      Win64
-- HeidiSQL バージョン:               12.11.0.7065
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- e6 のデータベース構造をダンプしています
CREATE DATABASE IF NOT EXISTS `e6` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `e6`;

--  テーブル e6.users の構造をダンプしています
CREATE TABLE IF NOT EXISTS `users` (
  `regist_number` int NOT NULL AUTO_INCREMENT,
  `mail` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(100) NOT NULL,
  `company` varchar(100) NOT NULL,
  PRIMARY KEY (`regist_number`),
  UNIQUE KEY `mail` (`mail`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- テーブル e6.users: ~12 rows (約) のデータをダンプしています
INSERT INTO `users` (`regist_number`, `mail`, `password`, `name`, `company`) VALUES
	(15, 'aaaa@aaaaa', 'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', '田所浩二', '株式会社テスト'),
	(16, 'bbbb@bbbb', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', '木村直樹', '株式会社テスト'),
	(17, 'cccc@cccc', 'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', '三浦池沼', '株式会社テスト'),
	(18, 'dddd@dddd', '2ce45fb0bf5e07f9a599b713bf3981dfe94a0be138b18e74ceaed1f894cb0202', '多田野数人', '株式会社テスト'),
	(19, 'eeee@eeee', 'a34e1cc0c8b2b42bcbec122223f654b23e0de095bbe0b499816cf0d23746aaac', '永吉嵐', '株式会社テスト'),
	(20, 'fff@fff', 'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', 'yuasa', '株式会社テスト'),
	(21, 't21j094br@ous.jp', 'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', '湯浅勇子', '株式会社テスト'),
	(22, 'dojouser1@plusdojo.jp', '40f2d20f80eeb798c36839d98dda52f7ca07f1b151c83c17f4b02fd4336cbbcc', 'dojouser1', 'PLUSDOJO'),
	(23, 'dojouser2@plusdojo.jp', '40f2d20f80eeb798c36839d98dda52f7ca07f1b151c83c17f4b02fd4336cbbcc', 'dojouser2', 'PLUSDOJO'),
	(24, 'dojouser3@plusdojo.jp', '40f2d20f80eeb798c36839d98dda52f7ca07f1b151c83c17f4b02fd4336cbbcc', 'dojouser3', 'PLUSDOJO'),
	(26, 'dojouser4@plusdojo.jp', '40f2d20f80eeb798c36839d98dda52f7ca07f1b151c83c17f4b02fd4336cbbcc', 'dojouser4', 'PLUSDOJO'),
	(27, 'dojouser5@plusdojo.jp', '40f2d20f80eeb798c36839d98dda52f7ca07f1b151c83c17f4b02fd4336cbbcc', 'dojouser5', 'PLUSDOJO');

--  テーブル e6.coin の構造をダンプしています
CREATE TABLE IF NOT EXISTS `coin` (
  `regist_number` int NOT NULL,
  `hold_coin` int DEFAULT '100',
  `receive_coin` int DEFAULT '0',
  `ranking_coin` int DEFAULT '0',
  PRIMARY KEY (`regist_number`),
  CONSTRAINT `coin_ibfk_1` FOREIGN KEY (`regist_number`) REFERENCES `users` (`regist_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- テーブル e6.coin: ~12 rows (約) のデータをダンプしています
INSERT INTO `coin` (`regist_number`, `hold_coin`, `receive_coin`, `ranking_coin`) VALUES
	(15, 3, 16, 20),
	(16, 50, 3, 30),
	(17, 34, 0, 50),
	(18, 50, 0, 100),
	(19, 50, 0, 80),
	(20, 50, 0, 0),
	(21, 100, 0, 0),
	(22, 73, 26, 100),
	(23, 83, 28, 300),
	(24, 61, 22, 80),
	(26, 80, 32, 50),
	(27, 60, 35, 200);

--  テーブル e6.monthly_reset_log の構造をダンプしています
CREATE TABLE IF NOT EXISTS `monthly_reset_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `reset_year` int NOT NULL,
  `reset_month` int NOT NULL,
  `reset_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- テーブル e6.monthly_reset_log: ~0 rows (約) のデータをダンプしています
INSERT INTO `monthly_reset_log` (`id`, `reset_year`, `reset_month`, `reset_time`) VALUES
	(1, 2025, 6, '2025-06-13 01:21:11');

--  テーブル e6.send の構造をダンプしています
CREATE TABLE IF NOT EXISTS `send` (
  `id` int NOT NULL AUTO_INCREMENT,
  `regist_number` int NOT NULL,
  `send_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `comment` varchar(3000) DEFAULT NULL,
  `send_coin` int DEFAULT '0',
  `receiver_number` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- テーブル e6.send: ~32 rows (約) のデータをダンプしています
INSERT INTO `send` (`id`, `regist_number`, `send_date`, `comment`, `send_coin`, `receiver_number`) VALUES
	(1, 1, '2025-06-13 12:04:14', 'あなたは私の生き別れの兄弟です。', 5, 8),
	(2, 1, '2025-06-13 13:01:49', 'aiueo', 3, 9),
	(3, 1, '2025-06-13 13:15:47', 'あかさたな', 5, 8),
	(4, 1, '2025-06-13 13:22:28', 'あかさたな', 5, 8),
	(5, 1, '2025-06-13 13:23:14', 'どしたん話聞こか？ｗ', 1, 9),
	(6, 1, '2025-06-13 13:24:54', 'あ', 1, 9),
	(7, 1, '2025-06-13 13:25:42', 'aa', 1, 9),
	(8, 1, '2025-06-13 13:27:26', 'こんにちは', 3, 9),
	(9, 17, '2025-06-16 16:21:43', 'a', 3, 15),
	(10, 17, '2025-06-16 16:21:55', 'い', 5, 15),
	(11, 17, '2025-06-16 16:22:03', 'う', 8, 15),
	(12, 15, '2025-06-16 16:30:25', 'e', 3, 16),
	(13, 22, '2025-06-19 10:04:02', '助かりました！', 3, 23),
	(14, 22, '2025-06-19 10:04:26', '資料作成手伝ってくれてありがとう！', 6, 24),
	(15, 22, '2025-06-19 10:04:47', 'お土産ありがとうございます！', 8, 26),
	(16, 22, '2025-06-19 10:05:04', '命の恩人です！', 10, 27),
	(17, 23, '2025-06-19 10:07:07', 'ありがとう', 1, 22),
	(18, 23, '2025-06-19 10:07:24', 'thenks', 1, 24),
	(19, 23, '2025-06-19 10:07:50', 'やりますねぇ', 5, 26),
	(20, 23, '2025-06-19 10:08:26', '感謝...圧倒的感謝...!', 10, 27),
	(21, 24, '2025-06-19 10:09:14', '神', 10, 22),
	(22, 24, '2025-06-19 10:09:22', '神', 10, 23),
	(23, 24, '2025-06-19 10:09:29', '神', 9, 26),
	(24, 24, '2025-06-19 10:09:48', '神', 10, 27),
	(25, 26, '2025-06-19 10:11:06', 'おつかれ！', 5, 22),
	(26, 26, '2025-06-19 10:11:13', 'おつかれ！', 5, 23),
	(27, 26, '2025-06-19 10:11:19', 'おつかれ！', 5, 24),
	(28, 26, '2025-06-19 10:11:25', 'おつかれ！', 5, 27),
	(29, 27, '2025-06-19 10:14:27', 'おつかれチャン！☻', 10, 22),
	(30, 27, '2025-06-19 10:14:35', 'おつかれチャン！☻', 10, 23),
	(31, 27, '2025-06-19 10:14:41', 'おつかれチャン！☻', 10, 24),
	(32, 27, '2025-06-19 10:14:47', 'おつかれチャン！☻', 10, 26);



--  トリガー e6.after_user_insert の構造をダンプしています
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `after_user_insert` AFTER INSERT ON `users` FOR EACH ROW BEGIN
  INSERT INTO coin (regist_number) VALUES (NEW.regist_number);
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
